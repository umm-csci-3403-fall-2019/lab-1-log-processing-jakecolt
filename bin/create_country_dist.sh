start_dir=$(pwd)
cd $1
input_dir=$(pwd)
#Find the files that contain 'failed_login_data.txt' and put them into an output folder
find -name 'failed_login_data.txt' -exec cat {} \; > failed_login_datafull.txt
touch tempfile.html 

#Find data that matches the "Jul 20 04 root 140.113.131.400" format, sort it, and place it into a temporary output file
sed -En 's/\s*([A-Za-z]+)\s*([0-9]+)\s*([0-9]+)\s*([A-Za-z0-9_-]+)\s*([0-9]+.[0-9]+.[0-9]+.[0-9]+)/\5/p' "failed_login_datafull.txt" | sort > tempfile.html 
touch temptempfile.html
join tempfile.html $start_dir/etc/country_IP_map.txt > temptempfile.html 
sed -En 's/([0-9]+.[0-9]+.[0-9]+.[0-9]+)\s*([A-Z]+)/\2/p' "temptempfile.html" | sort | uniq -c | sed -E 's/\s*([0-9]+)\s*([A-Z]+)\s*/data.addRow([\x27\2\x27, \1\]);/' > tempfile.html
cd "$start_dir"/html_components #Move to wrap contents
$start_dir/bin/wrap_contents.sh $input_dir/tempfile.html country_dist $input_dir/country_dist.html
cd $input_dir
rm tempfile.html #delete the used files
rm temptempfile.html
rm failed_login_datafull.txt
