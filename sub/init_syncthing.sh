wget -qO - https://syncthing.net/release-key.txt | apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get -y install syncthing


if test -d "/home/$INITUSER/.config/autostart"; then
    cp "/usr/share/applications/syncthing.desktop" "/home/$INITUSER/.config/autostart/"
fi

inilog "when adding new devices, restarting / reloading on the remote device might speed up the process"
