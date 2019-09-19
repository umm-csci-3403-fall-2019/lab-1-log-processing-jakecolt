scratch_dir=$(mktemp -d)
start_dir=$(pwd)
mkdir $scratch_dir/log_files
for i in $@
do
	computer_name=$(basename "$i" _secure.tgz) #Gets computer name
	mkdir $scratch_dir/log_files/$computer_name #makes directory with computer name	
	tar -xf $i -C $scratch_dir/log_files/$computer_name	#unarchives files into computer's directory
	$start_dir/bin/process_client_logs.sh $scratch_dir/log_files/$computer_name #runs process_client_logs on the directory
done

cd $scratch_dir
cp  -r $start_dir/html_components $scratch_dir
mkdir $scratch_dir/bin
mkdir $scratch_dir/etc
cd $scratch_dir/log_files
#
cd $scratch_dir
cp $start_dir/bin/wrap_contents.sh $scratch_dir/bin
cp $start_dir/etc/country_IP_map.txt $scratch_dir/etc                          
$start_dir/bin/process_client_logs.sh $scratch_dir/log_files/
cd $scratch_dir/log_files
rm failed_login_data.txt #deletes extra data
cd $scratch_dir

#assembles report
$start_dir/bin/create_username_dist.sh $scratch_dir/log_files/
$start_dir/bin/create_hours_dist.sh $scratch_dir/log_files/
$start_dir/bin/create_country_dist.sh $scratch_dir/log_files/
$start_dir/bin/assemble_report.sh $scratch_dir/log_files/
#cd $scratch_dir/log_files

mv $scratch_dir/log_files/failed_login_summary.html $start_dir
