

execute "influxdb key" do
    command "curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -"
    action :run
end

execute "apt repository" do
    command "echo \"deb https://repos.influxdata.com/ubuntu #{node['lsb']['codename']} stable\" | sudo tee /etc/apt/sources.list.d/influxdb.list"
    action :run
end

execute "apt update" do
    command "sudo apt-get update"
    action :run
end

apt_package 'influxdb' do
  action :install
end

template '/etc/influxdb/influxdb.conf' do
    owner 'root'
    group 'root'
    mode '0644'
    source 'influxdb.erb'
end

service "influxdb" do
  supports :restart => true, :reload => false, :status => true
  action [ :enable, :start ]
end
