limit=2
numFile=$HOME/dev/scripts/neoCool/last.txt

if [[ $# -eq 1 ]]; then
	if [[ $1 -le ${limit} ]]; then
		num=$1
	fi
else
	num=$(cat ${numFile})

	if [[ ${num} -ge ${limit} ]]; then
		num=1
	else
		(( num++ ))
	fi

	echo ${num} > ${numFile}
fi

imgFile=$HOME/Pictures/asciiArt/rotation/art-${num}

neofetch --ascii_colors 2 3 4 1 5 4 --ascii ${imgFile}
