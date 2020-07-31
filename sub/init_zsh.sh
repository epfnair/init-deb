apt-get update
apt-get -y install zsh

chsh -s /bin/zsh $USER

ZSH="/home/$INITUSER/.local/opt/ohmyzsh"

wget "https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh" -O "$TMPDIR/zsh_install.sh"
. "$TMPDIR/zsh_install.sh" --unattended --keep-zshrc

sed -r -e "s/@USER@/$INITUSER/g" -e "s/@THEME@/$ZSHTHEME/g" "$INITDATA/.zshrc" > "/home/$INITUSER/.zshrc"

if [[ $ZSHADDTHEMES == true ]]; then
    ls -d $INITDATA/* | grep ".*\.zsh-theme$" | xargs -I{} -r -- cp "{}" "$ZSH/themes/"
fi

inilog "the behaviour of zsh can be altered by editing ~/.zshrc"