## default recipe :)

execute "influxdb key" do
    command "curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -"
    action :run
end

execute "distribution info" do
    command "source /etc/lsb-release"
    action :run
end

execute "apt repository" do
    command "echo \"deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable\" | sudo tee /etc/apt/sources.list.d/influxdb.list"
    action :run
end

apt_update "apt update" do
  action :update
end

apt_package 'influxdb' do
  action :install
end

service "influxdb" do
  supports :restart => true, :reload => false, :status => true
  action [ :enable, :start ]
end
