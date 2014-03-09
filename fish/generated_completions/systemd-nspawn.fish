# systemd-nspawn
# Autogenerated from man page /usr/share/man/man1/systemd-nspawn.1.gz
# using Deroffing man parser
complete -c systemd-nspawn -s h -l help --description 'Prints a short help text and exits.'
complete -c systemd-nspawn -l version --description 'Prints a version string and exits.'
complete -c systemd-nspawn -s D -l directory --description 'Directory to use as file system root for the na… [See Man Page]'
complete -c systemd-nspawn -s b -l boot --description 'Automatically search for an init binary and inv… [See Man Page]'
complete -c systemd-nspawn -s u -l user --description 'Run the command under specified user, create ho… [See Man Page]'
complete -c systemd-nspawn -s M -l machine --description 'Sets the machine name for this container.'
complete -c systemd-nspawn -l slice --description 'Make the container part of the specified slice,… [See Man Page]'
complete -c systemd-nspawn -l uuid --description 'Set the specified UUID for the container.'
complete -c systemd-nspawn -l private-network --description 'Turn off networking in the container.'
complete -c systemd-nspawn -l read-only --description 'Mount the root file system read-only for the container.'
complete -c systemd-nspawn -l capability --description 'List one or more additional capabilities to gra… [See Man Page]'
complete -c systemd-nspawn -l link-journal --description 'Control whether the container\\*(Aqs journal sha… [See Man Page]'
complete -c systemd-nspawn -s j --description 'Equivalent to --link-journal=guest.'
complete -c systemd-nspawn -l bind -l bind-ro --description 'Bind mount a file or directory from the host in… [See Man Page]'
