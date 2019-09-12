cd $1
for f in *.tgz; do tar -xzf $f  -C $1; done
touch failed_login_data.txt
grep  -rh "Failed password" --exclude="*.txt" . > failed_login_data.txt
sed -Ein 's/([A-Za-z]+)\s*([0-9]+)\s*([0-9]+):.*:.*\s*([0-9a-zA-Z_]+)\s*sshd\[.*\]:\s*Failed\s*password\s*for\s*([0-9a-zA-Z._\ -]+)\s*from\s*([0-9].+)\s*port\s*([0-9]+)\s*.*$/\1 \2 \3 \5 \6 /' "failed_login_data.txt"
sed -Ein 's/invalid user/ /' "failed_login_data.txt"
#vi failed_login_data.txt
 
