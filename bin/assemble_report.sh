start_dir=$(pwd)
cd $1
touch failed_login_summary.html
cat $start_dir/html_components/summary_plots_header.html country_dist.html hours_dist.html username_dist.html $start_dir/html_components/summary_plots_footer.html  > failed_login_summary.html
