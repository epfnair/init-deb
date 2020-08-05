echo "updating and installing packages"
apt update
apt upgrade -y
sed -n -r "s/^[ \t]*([^ #\t]+)[ \t#]?.*$/\1/p" "$INITDATA/package.list" | xargs -i -r -- sudo apt-get install -y {}
