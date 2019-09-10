tmp_dir=$(mktemp -d -t ci-XXXXXXX)
echo $tmp_dir
for f in ../log_files/*.tgz; do tar -xzf $f  -C $tmp_dir; done
ls -L $tmp_dir/var/log/
cd $tmp_dir/var/log/
#grep -r '\bJul\b \b21\b' * > outputfile.txt 
grep  -rl "Failed password" * | xargs sed -E ""  's/([A-Za-z]+) ([0-9])/wwww/g' > outputfile.txt
#vi secure-20110724
vi outputfile.txt

#add :wn after E when line matches

