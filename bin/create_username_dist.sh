start_dir=$(pwd)
cd $1
input_dir=$(pwd)
find -name 'failed_login_data.txt' -exec cat {} \; > failed_login_datafull.txt
touch tempfile.html
sed -En 's/([A-Za-z]+)\s*([0-9]+)\s*([0-9]+)\s*([A-Za-z0-9_-]+)\s*([0-9]+).([0-9]+).([0-9]+).([0-9]+)/ \4/p' "failed_login_datafull.txt" | sort | uniq -c | sed -E  's/\s*([0-9]+)\s*([A-Za-z0-9_-]+)/data.addRow([\x27\2\x27, \1\]);/' > tempfile.html
cd "$start_dir"/html_components
$start_dir/bin/wrap_contents.sh $input_dir/tempfile.html username_dist $input_dir/username_dist.html
rm "$input_dir"/tempfile.html
rm "$input_dir"/failed_login_datafull.txt
