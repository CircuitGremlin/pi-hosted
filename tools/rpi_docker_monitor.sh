#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

echo "Creating directories..."
sudo mkdir -p /portainer/Files/AppData/Config/prometheus/config || error "Failed to create config directory!"
sudo mkdir -p /portainer/Files/AppData/Config/prometheus/data || error "Failed to create data directory for Prometheus!"
sudo mkdir -p /portainer/Files/AppData/Config/grafana/data || error "Failed to create data directory for Grafana!"
sudo mkdir -p /portainer/Files/AppData/Config/grafana/provisioning || error "Failed to create provisioning directory for Grafana!"
sudo mkdir -p /portainer/Files/AppData/Config/grafana/provisioning/dashboards || error "Failed to create dashboards directory for Grafana!"
sudo mkdir -p /portainer/Files/AppData/Config/grafana/provisioning/datasources || error "Failed to create datasources directory for Grafana!"
echo "Downloading Prometheus config files if they don't exist"
if [ -d /portainer/Files/AppData/Config/prometheus/config/prometheus.yml ];
then
    echo "/portainer/Files/AppData/Config/prometheus/config/prometheus.yml is a directory removing"
    rm -rf '/portainer/Files/AppData/Config/prometheus/config/prometheus.yml/'
fi

if [ ! -f /portainer/Files/AppData/Config/prometheus/config/prometheus.yml ]; 
then
	sudo wget -O /portainer/Files/AppData/Config/prometheus/config/prometheus.yml https://raw.githubusercontent.com/oijkn/Docker-Raspberry-PI-Monitoring/main/prometheus/prometheus.yml || error "Failed to download prometheus.yml file!"
fi

echo "Create a Grafana files if they don't exist"
if [ -d /portainer/Files/AppData/Config/grafana/grafana.ini ];
then
    echo "/portainer/Files/AppData/Config/grafana/grafana.ini is a directory removing"
    rm -rf '/portainer/Files/AppData/Config/grafana/grafana.ini'
fi

if [ ! -f /portainer/Files/AppData/Config/grafana/provisioning/dashboards/dashboard.yml ]; 
then
	sudo wget -O /portainer/Files/AppData/Config/grafana/provisioning/dashboards/dashboard.yml https://raw.githubusercontent.com/oijkn/Docker-Raspberry-PI-Monitoring/main/grafana/provisioning/dashboards/dashboard.yml || error "Failed to download dashboard.yml file!"
fi

if [ ! -f /portainer/Files/AppData/Config/grafana/provisioning/dashboards/rpi-monitoring.json ]; 
then
	sudo wget -O /portainer/Files/AppData/Config/grafana/provisioning/dashboards/rpi-monitoring.json https://raw.githubusercontent.com/oijkn/Docker-Raspberry-PI-Monitoring/main/grafana/provisioning/dashboards/rpi-monitoring.json || error "Failed to download rpi-monitoring.json file!"
fi

if [ ! -f /portainer/Files/AppData/Config/grafana/provisioning/datasources/datasource.yml ]; 
then
	sudo wget -O /portainer/Files/AppData/Config/grafana/provisioning/datasources/datasource.yml https://raw.githubusercontent.com/oijkn/Docker-Raspberry-PI-Monitoring/main/grafana/provisioning/datasources/datasource.yml || error "Failed to download datasource.yml file!"
fi
sudo touch /portainer/Files/AppData/Config/grafana/grafana.ini || error "Failed to touch grafana.ini file!"
echo "Setting permissions..."
sudo chown -R 472:472 /portainer/Files/AppData/Config/grafana/data || error "Failed to set permissions for Grafana data!"
sudo chown -R 65534:65534 /portainer/Files/AppData/Config/prometheus/data || error "Failed to set permissions for Prometheus data!"
echo "Done You are ready to goto next step in the install document"