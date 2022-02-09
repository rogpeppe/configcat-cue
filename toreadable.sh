#!/usr/bin/env rc

in=$1
if(~ $#* 0) {
	in='-'
}

cue export --out cue -l 'input:' -e '(#toReadableRoot & {param: input}).out' . json: $in
