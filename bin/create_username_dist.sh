cd $1
sed -En 's/([A-Za-z]+)\s*([0-9]+)\s*([0-9]+)\s*([A-Za-z0-9_-]+)\s*([0-9]+).([0-9]+).([0-9]+).([0-9]+)/ \4/p' "failed_login_data.txt" | sort | uniq -c | sed -E 's/([0-9]+)  ([A-Za-z0-9_-]+)/ \1 \2 /p'
