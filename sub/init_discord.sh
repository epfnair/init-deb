wget "https://discord.com/api/download?platform=linux&format=deb" -O "$TMPDIR/discord.deb"
apt install -y "$TMPDIR/discord.deb"