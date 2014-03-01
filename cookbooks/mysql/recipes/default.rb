#data_bag("rtb_data_bag")
#db = data_bag_item("rtb_data_bag", "rtb")
#password = db[node.environment]['mysql']['password'] || "qqqqqq"
password = "qqqqqq" # default password, need to set up override

bash "install_mysql" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    export DEBIAN_FRONTEND=noninteractive
    apt-get -q -y install mysql-server
  EOH
  action :run
  #not_if {File.exists?("#{Chef::Config[:file_cache_path]}/mysql_lock")}
end

bash "config_mysql" do
  user "root"
  cwd "#{Chef::Config[:file_cache_path]}"
  code <<-EOH
    mysqladmin -u root password #{password}
    echo "grant all privileges on *.* to 'root'@'%' identified by '#{password}'; FLUSH PRIVILEGES;" | mysql -u root -p#{password}
  EOH
  action :run
  #not_if {File.exists?("#{Chef::Config[:file_cache_path]}/mysql_lock")}
end 

#mysql lock file