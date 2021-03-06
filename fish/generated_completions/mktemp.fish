# mktemp
# Autogenerated from man page /usr/share/man/man1/mktemp.1.gz
# using Deroffing man parser
complete -c mktemp -s d -l directory --description 'create a directory, not a file.'
complete -c mktemp -s u -l dry-run --description 'do not create anything; merely print a name (unsafe).'
complete -c mktemp -s q -l quiet --description 'suppress diagnostics about file/dir-creation failure.'
complete -c mktemp -l suffix --description 'append SUFF to TEMPLATE; SUFF must not contain a slash.'
complete -c mktemp -s p -l 'tmpdir[' --description 'interpret TEMPLATE relative to DIR; if DIR is n… [See Man Page]'
complete -c mktemp -s t --description 'interpret TEMPLATE as a single file name compon… [See Man Page]'
complete -c mktemp -l help --description 'display this help and exit.'
complete -c mktemp -l version --description 'output version information and exit.'

