# Pi-Hosted Portainer Template V3

### Installation
Run `install-docker.sh`, to install docker, and add the current user to the docker usergroup.
```
wget -qO- https://raw.githubusercontent.com/CircuitGremlin/pi-hosted/master/install_docker.sh | bash
```
You need to reboot/logout for changes to take effect
```
sudo reboot
```
After a reboot, run `install-portainer.sh`, to install Portainer.io
```
wget -qO- https://raw.githubusercontent.com/CircuitGremlin/pi-hosted/master/install_portainer.sh | bash
```
### To update portainer, run this command instead
```
wget -qO- https://raw.githubusercontent.com/CircuitGremlin/pi-hosted/master/update_portainer.sh | bash
```

### Login to Portainer to update the App Template.

Goto pi-ip:9000 and then login

Click Settings, in the bottom-left corner, and paste the Portainer v2 json file link from below into the "App Templates" box.

You're done! Now just click App Templates and deploy applications!

#### Portainer Architecture

| Architecture | Tested OS's | URL |
| ------------ | ----------- | --- |
| Arm64   | Pi OS, Ubuntu, DietPi | https://raw.githubusercontent.com/CircuitGremlin/pi-hosted/master/template/portainer-v3-arm64.json |

### Included Scripts
Install, Update, Pre-Install and extra scripts can be found in our [GitHub Tools](https://github.com/CircuitGremlin/pi-hosted/blob/master/tools) folder.

### Contributors
See the list of [contributors](https://github.com/CircuitGremlin/pi-hosted/graphs/contributors) who participated in this project.

### Acknowledgment
* template based on [SelfHosted](https://github.com/SelfhostedPro/selfhosted_templates) Portainer App Template branch on 2021/10/05
* template based on [pi-hosted](https://github.com/pi-hosted/pi-hosted)
