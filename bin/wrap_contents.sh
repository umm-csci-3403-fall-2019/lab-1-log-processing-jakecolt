filename=$1
prefixhf=$2
output=$3
touch $output
cat $prefixhf"_header.html" $filename $prefixhf"_footer.html" > $3 
#Takes filename input $1, prefix for modifying $2, and puts the result into file $3
