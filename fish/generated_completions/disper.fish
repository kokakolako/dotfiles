# disper
# Autogenerated from man page /usr/share/man/man1/disper.1
# using Deroffing man parser
complete -c disper -l version --description 'show program\'s version number and exit.'
complete -c disper -s h -l help --description 'show this help message and exit.'
complete -c disper -s v -l verbose --description 'show what\'s happening.'
complete -c disper -s q -l quiet --description 'be quiet and only show errors.'
complete -c disper -s r -l resolution --description 'set resolution, e. g.'
complete -c disper -s d -l displays --description 'comma-separated list of displays to operate on,… [See Man Page]'
complete -c disper -s t -l direction --description 'where to extend displays: "left", "right", "top", or "bottom".'
complete -c disper -l scaling --description 'flat-panel scaling mode: "default", "native", "… [See Man Page]'
complete -c disper -l plugins --description 'comma-separated list of plugins to enable.'
complete -c disper -l cycle-stages --description 'colon-separated list command-line arguments to … [See Man Page]'
complete -c disper -s l -l list --description 'list the attached displays.'
complete -c disper -s s -l single --description 'only enable the primary display.'
complete -c disper -s S -l secondary --description 'only enable the secondary display.'
complete -c disper -s c -l clone --description 'clone displays.'
complete -c disper -s e -l extend --description 'extend displays.'
complete -c disper -s p -l export --description 'export current settings to standard output.'
complete -c disper -s i -l import --description 'import current settings from standard input.'
complete -c disper -s C -l cycle --description 'cycle through the list of cycle stages FILES $X… [See Man Page]'
complete -c disper -o 'e\'' --description '$XDG_CONFIG_HOME/disper/hooks/ or ~/.'
