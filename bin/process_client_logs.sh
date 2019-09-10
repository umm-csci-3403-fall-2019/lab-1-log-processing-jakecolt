tmp_dir=$(mktemp -d -t ci-XXXXXXX)
echo $tmp_dir
for f in ../log_files/*.tgz; do tar -xzf $f  -C $tmp_dir; done
ls -L $tmp_dir/var/log/
cd $tmp_dir/var/log/
grep -r '/\ ([a-zA-Z]   /   /' * > outputfile.txt
#vi secure-20110724
vi outputfile.txt

