cd $1
touch tempfile.html
sed -En 's/([A-Za-z]+)\s*([0-9]+)\s*([0-9]+)\s*([A-Za-z0-9_-]+)\s*([0-9]+).([0-9]+).([0-9]+).([0-9]+)/ \4/p' "failed_login_data.txt" | sort | uniq -c | sed -En  's/([0-9]+)  ([A-Za-z0-9_-]+)/data.addRow([\x27\2\x27,\x27\1\x27]);/p' > tempfile.html
cd ../html_components
../bin/wrap_contents.sh $1/tempfile.html username_dist $1/username_dist.html
rm $1/tempfile.html
