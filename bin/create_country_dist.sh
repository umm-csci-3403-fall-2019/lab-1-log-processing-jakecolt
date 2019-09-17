start_dir=$(pwd)
cd $1
input_dir=$(pwd)
find -name 'failed_login_data.txt' -exec cat {} \; > failed_login_datafull.txt
pwd
touch tempfile.html
sed -En 's/([A-Za-z]+)\s*([0-9]+)\s*([0-9]+)\s*([A-Za-z0-9_-]+)\s*([0-9]+.[0-9]+.[0-9]+.[0-9]+)/\5/p' "failed_login_datafull.txt" | sort > tempfile.html
touch temptempfile.html
join tempfile.html $start_dir/etc/country_IP_map.txt > temptempfile.html 
sed -En 's/([0-9]+.[0-9]+.[0-9]+.[0-9]+)\s*([A-Z]+)/\2/p' "temptempfile.html" | uniq -c | sed -E 's/([0-9]+)\s*([A-Z]+)\s*/data.addRow([\x27\2\x27,\1\]);/' > tempfile.html
vi tempfile.html
cd "$start_dir"/html_components
$start_dir/bin/wrap_contents.sh $input_dir/tempfile.html country_dist $input_dir/country_dist.html
rm tempfile.html
rm temptempfile.html
