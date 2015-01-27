# sg_logs
# Autogenerated from man page /usr/share/man/man8/sg_logs.8.gz
# using Deroffing man parser
complete -c sg_logs -s a -l all --description 'outputs all the log pages supported by the device.'
complete -c sg_logs -s b -l brief --description 'shorten the amount of output for some log pages.'
complete -c sg_logs -s c -l control --description 'accepts 0, 1, 2 or 3 for the PC argument: .'
complete -c sg_logs -s h -l help --description 'print out the usage message then exit.'
complete -c sg_logs -s H -l hex --description 'The default action is to decode known mode page… [See Man Page]'
complete -c sg_logs -s l -l list --description 'lists the names of all logs sense pages support… [See Man Page]'
complete -c sg_logs -s m -l maxlen --description 'sets the "allocation length" field in the LOG SENSE cdb.'
complete -c sg_logs -s n -l name --description 'decode some log pages into \'name=value\' entries, one per line.'
complete -c sg_logs -s O -l old --description 'switch to older style options.'
complete -c sg_logs -s p -l page --description 'log page code to access.'
complete -c sg_logs -s P -l paramp --description 'PP is the parameter pointer value to place in a… [See Man Page]'
complete -c sg_logs -s q -l pcb --description 'show Parameter Control Byte settings (only rele… [See Man Page]'
complete -c sg_logs -s Q -l ppc --description 'sets the Parameter Pointer Control (PPC) bit in… [See Man Page]'
complete -c sg_logs -s r -l raw --description 'output the response in binary to stdout.'
complete -c sg_logs -s R -l reset --description 'use SCSI LOG SELECT command (PCR bit set) to re… [See Man Page]'
complete -c sg_logs -s S -l select --description 'use a LOG SELECT command.  The default action (i. e.'
complete -c sg_logs -s s -l sp --description 'sets the Saving Parameters (SP) bit.  Default is 0 (i. e.'
complete -c sg_logs -s t -l temperature --description 'outputs the temperature.'
complete -c sg_logs -s T -l transport --description 'outputs the transport (\'Protocol specific port\') log page.'
complete -c sg_logs -s v -l verbose --description 'increase level of verbosity.'
complete -c sg_logs -s V -l version --description 'print out version string then exit.'
complete -c sg_logs -s A --description 'outputs all the log pages and subpages supported by the device.'
complete -c sg_logs -s L --description 'lists the names of all logs sense pages and sub… [See Man Page]'
complete -c sg_logs -s N --description 'switch to the newer style options.'
complete -c sg_logs -o paramp --description 'PP is the parameter pointer value (in hex) to place in command.'
complete -c sg_logs -o pcb --description 'show Parameter Control Byte settings (only rele… [See Man Page]'
complete -c sg_logs -o ppc --description 'sets the Parameter Pointer Control (PPC) bit.  Default is 0 (i.'
complete -c sg_logs -o select --description 'use a LOG SELECT command.'
complete -c sg_logs -o sp --description 'sets the Saving Parameters (SP) bit.  Default is 0 (i. e.'
complete -c sg_logs -s '?' --description 'output usage message then exit.'

