name             "influxdb"
maintainer       "Gandhar Pednekar"
maintainer_email "gandhar.pednekar15@gmail.com"
license          "MIT"
description      "Chef cookbook to install and configure InfluxDB on Ubuntu servers"
version          "0.0.1"

%w{ubuntu}.each do |os|
  supports os
end
