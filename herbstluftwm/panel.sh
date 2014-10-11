#!/bin/bash

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi

# geometry has the format W H X Y
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_height=30

# font="-gohu-gohufont-medium-r-normal--14-100-100-100-c-80-iso10646-1"
# font="-fira mono-medium-medium-r-normal--14-100-100-100-c-80-iso10646-1"
# font="-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*"
font="-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*"
# font="Inconsolata-10"

bgcolor='#FFFFFF'
selbg='#FFFFFF'
selfg='#FF0055'

# Try to find textwidth binary.
# In e.g. Ubuntu, this is named dzen2-textwidth.
if which textwidth &> /dev/null ; then
    textwidth="textwidth";
elif which dzen2-textwidth &> /dev/null ; then
    textwidth="dzen2-textwidth";
else
    printf "This script requires the textwidth tool of the dzen2 project."
    exit 1
fi

# true if we are using the svn version of dzen2
# depending on version/distribution, this seems to have version strings like
# "dzen-" or "dzen-x.x.x-svn"
if dzen2 -v 2>&1 | head -n 1 | grep -q '^dzen-\([^,]*-svn\|\),'; then
    dzen2_svn="true"
else
    dzen2_svn=""
fi

if awk -Wv 2>/dev/null | head -1 | grep -q '^mawk'; then
    # mawk needs "-W interactive" to line-buffer stdout correctly
    # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=593504
    uniq_linebuffered() {
      awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
else
    # other awk versions (e.g. gawk) issue a warning with "-W interactive", so
    # we don't want to use it there.
    uniq_linebuffered() {
      awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
    }
fi

hc pad $monitor $panel_height

{

    ### Event generator ###
    # based on different input data (mpc, date, hlwm hooks, ...) this generates events, formed like this:
    #   <eventname>\t<data> [...]
    # e.g.
    #   date    ^fg(#efefef)18:33^fg(#909090), 2013-10-^fg(#efefef)29

    # mpc idleloop player &
    while true ; do
        # "date" output is checked once a second, but an event is only
        # generated if the output changed compared to the previous run.
        date +$'date\t%Y/%m/%d - %H:%M'
        sleep 1 || break
    done > >(uniq_linebuffered) &
    childpid=$!
    hc --idle
    kill $childpid

} 2> /dev/null | {

    IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
    visible=true
    date=""
    windowtitle=""

    while true ; do

        ### Output ###
        # This part prints dzen data based on the _previous_ data handling run,
        # and then waits for the next event to happen.

        # distro_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/arch_10x10.xbm)"
        # distro_icon="^fg(#FF0055)^i($HOME/.config/icons/xbm/tux.xbm)"
        # printf "  $distro_icon "

        # draw tags
        for i in "${tags[@]}" ; do
            case ${i:0:1} in
                '#')
                    printf "^bg($selbg)^fg($selfg)"
                    ;;
                '+')
                    printf "^bg(#000000)^fg(#000000)"
                    ;;
                ':')
                    printf "^bg()^fg(#000000)"
                    ;;
                '!')
                    printf "^bg(#000000)^fg(#000000)"
                    ;;
                *)
                    printf "^bg()^fg(#ababab)"
                    ;;
            esac
            if [ ! -z "$dzen2_svn" ] ; then
                # clickable tags if using SVN dzen
                printf "^ca(1,\"${herbstclient_command[@]:-herbstclient}\" "
                printf "focus_monitor \"$monitor\" && "
                printf "\"${herbstclient_command[@]:-herbstclient}\" "
                printf "use \"${i:1}\") ${i:1} ^ca()"
            else
                # non-clickable tags if using older dzen
                printf " ${i:1} "
            fi
        done

        # temp="^fg(#000000)$( sensors | grep Physical id 0: | grep -Ewo "[0-9]*.[0-9]" )"
        # temp_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/temp.xbm)"

        # vol="^fg(#000000)$( $HOME/.bin/print-volume )"
        # vol_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/cat.xbm)"

        cpu="^fg(#000000)$( $HOME/.bin/print-cpu-last )"
        cpu_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/cpu.xbm)"

        batt="^fg(#000000)$( $HOME/.bin/print-battery-status )"
        batt_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/bat_full_01.xbm)"

        wifi=" ^fg(#000000)$( iwconfig wlp8s0 | grep ESSID | cut -c 33- | tr -d '"' | sed "s/[[:space:]]//g" )"
        wifi_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/wifi_01.xbm)"

        date_icon="^fg(#FF0055)^i($HOME/.config/herbstluftwm/icons/xbm/clock.xbm)^fg(#000000)"

        printf "^bg()^fg(#000000) ${windowtitle//^/^^}"
        right="$batt_icon $batt  $cpu_icon $cpu  ${wifi_icon}${wifi}  $date_icon $date"
        right_text_only=$(echo -n "$right" | sed 's.\^[^(]*([^)]*)..g')

        # get width of right aligned text.. and add some space..
        width=$($textwidth "$font" "$right_text_only       ")
        printf "^pa($(($panel_width - $width)))$right"
        echo

        ### Data handling ###
        # This part handles the events generated in the event loop, and sets
        # internal variables based on them. The event and its arguments are
        # read into the array cmd, then action is taken depending on the event
        # name.
        # "Special" events (quit_panel/togglehidepanel/reload) are also handled
        # here.

        # wait for next event
        IFS=$'\t' read -ra cmd || break

        # find out event origin
        case "${cmd[0]}" in
            tag* )
                #echo "resetting tags" >&2
                IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
            ;;
            date )
                #echo "resetting date" >&2
                date="${cmd[@]:1}"
            ;;
            quit_panel )
                exit
            ;;
            togglehidepanel )
                currentmonidx=$(hc list_monitors | sed -n '/\[FOCUS\]$/s/:.*//p')
                if [ "${cmd[1]}" -ne "$monitor" ] ; then
                    continue
                fi
                if [ "${cmd[1]}" = "current" ] && [ "$currentmonidx" -ne "$monitor" ] ; then
                    continue
                fi
                echo "^togglehide()"
                if $visible ; then
                    visible=false
                    hc pad $monitor 0
                else
                    visible=true
                    hc pad $monitor $panel_height
                fi
            ;;
            reload )
                exit
            ;;
            focus_changed | window_title_changed )
                windowtitle="${cmd[@]:2}"
            ;;
        esac

    done

### dzen2 ###
# After the data is gathered and processed, the output of the previous block
# gets piped to dzen2.

} 2> /dev/null | dzen2 -w $panel_width -x $x -y $y -fn "$font" -h $panel_height \
    -e 'button3=;button4=exec:herbstclient use_index -1;button5=exec:herbstclient use_index +1' \
    -ta l -bg "$bgcolor" -fg '#FF0055' -p
