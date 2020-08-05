wget "https://discord.com/api/download?platform=linux&format=deb" -O "$TMPDIR/discord.deb"
dpkg -i "$TMPDIR/discord.deb"
apt install -f
