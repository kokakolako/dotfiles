# oggenc
# Autogenerated from man page /usr/share/man/man1/oggenc.1.gz
# using Deroffing man parser
complete -c oggenc -s h -l help --description 'Show command help.'
complete -c oggenc -s V -l version --description 'Show the version number.'
complete -c oggenc -s r -l raw --description 'Assume input data is raw little-endian audio da… [See Man Page]'
complete -c oggenc -s B -l raw-bits --description 'Sets raw mode input sample size in bits.  Default is 16.'
complete -c oggenc -s C -l raw-chan --description 'Sets raw mode input number of channels.  Default is 2.'
complete -c oggenc -s R -l raw-rate --description 'Sets raw mode input samplerate.  Default is 44100.'
complete -c oggenc -l raw-endianness --description 'Sets raw mode endianness to big endian (1) or l… [See Man Page]'
complete -c oggenc -l utf8 --description 'Informs oggenc that the Vorbis Comments are alr… [See Man Page]'
complete -c oggenc -s k -l skeleton --description 'Add a Skeleton bitstream.'
complete -c oggenc -l ignorelength --description 'Support for Wave files over 4 GB and stdin data streams.'
complete -c oggenc -s Q -l quiet --description 'Quiet mode.   No messages are displayed.'
complete -c oggenc -s b -l bitrate --description 'Sets target bitrate to n (in kb/s).'
complete -c oggenc -s m -l min-bitrate --description 'Sets minimum bitrate to n (in kb/s).'
complete -c oggenc -s M -l max-bitrate --description 'Sets maximum bitrate to n (in kb/s).'
complete -c oggenc -l managed --description 'Set bitrate management mode.'
complete -c oggenc -s q -l quality --description 'Sets encoding quality to n, between -1 (very lo… [See Man Page]'
complete -c oggenc -l resample --description 'Resample input to the given sample rate (in Hz)… [See Man Page]'
complete -c oggenc -l downmix --description 'Downmix input from stereo to mono (has no effec… [See Man Page]'
complete -c oggenc -l advanced-encode-option --description 'Sets an advanced option.'
complete -c oggenc -s s -l serial --description 'Forces a specific serial number in the output stream.'
complete -c oggenc -l discard-comments --description 'Prevents comments in FLAC and Ogg FLAC files fr… [See Man Page]'
complete -c oggenc -s o -l output --description 'Write the Ogg Vorbis stream to  output_file (on… [See Man Page]'
complete -c oggenc -s n -l names --description 'Produce filenames as this string, with %g, %a, … [See Man Page]'
complete -c oggenc -s X -l name-remove --description 'Remove the specified characters from parameters… [See Man Page]'
complete -c oggenc -s P -l name-replace --description 'Replace characters removed by --name-remove wit… [See Man Page]'
complete -c oggenc -s c -l comment --description 'Add the string  comment as an extra comment.'
complete -c oggenc -s a -l artist --description 'Set the artist comment field in the comments to  artist.'
complete -c oggenc -s G -l genre --description 'Set the genre comment field in the comments to  genre.'
complete -c oggenc -s d -l date --description 'Sets the date comment field to the given value.'
complete -c oggenc -s N -l tracknum --description 'Sets the track number comment field to the given value.'
complete -c oggenc -s t -l title --description 'Set the track title comment field to  title.'
complete -c oggenc -s l -l album --description 'Set the album comment field to  album.'
complete -c oggenc -s L -l lyrics --description 'Loads lyrics from  filename and encodes them in… [See Man Page]'
complete -c oggenc -s Y -l lyrics-language --description 'Sets the language for the corresponding lyrics … [See Man Page]'

