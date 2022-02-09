#!/usr/bin/env rc

in=$1
if(~ $#* 0) {
	in='-'
}

cue export cue: $in | cue export -l 'input:' -e '(#fromReadableRoot & {param: input}).out' . json: -
