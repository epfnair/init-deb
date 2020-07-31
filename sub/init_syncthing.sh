wget -qO - https://syncthing.net/release-key.txt | apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get -y install syncthing

# the service should be generated when starting syncthing
# if test -d "/home/$INITUSER/.config/autostart"; then
#     cp "./data/syncthing.service" "/home/$INITUSER/.config/autostart/"
# fi

inilog "starting Start Syncing once to make shure that syncthing is properly initilized and autostarts"
inilog "when adding new devices, restarting / reloading on the remote device might speed up the prozess"