#wget "https://update.code.visualstudio.com/latest/linux-deb-x64/stable" -O "$TMPDIR/vscode.deb"
#dpkg -i "$TMPDIR/vscode.deb"
#apt install -f

inilog "to stop data being sent to microsoft do the following: "
inilog 2 "disable Telemetry"
inilog 3 "go to File > Preferences > Settings"
inilog 3 " " "search for telemetry.enableTelemetry and set it to false"
inilog 2 "disable crash reporting"
inilog 3 "go to File > Preferences > Settings"
inilog 3 " " "search for telemetry.enableCrashReporter and set it to false"
inilog "for more infos visit https://code.visualstudio.com/docs/getstarted/telemetry"
inilog "some usefull packages: "
inilog 2 "Doxygen Documentation Generator - Christoph Schlosser"
inilog 2 "Bracket Pair Colorizer - CoenraadS"
inilog 2 "Markdown All in One - Yu Zhang"
inilog 2 "Meson - Ali Sabil"
inilog 2 "Material Icon Theme - Philipp Kief"
inilog 2 "One Dark Pro - binaryify"
inilog 2 "Git Graph - mhutchie"
inilog 2 "Nim - Konstantin Zaitsev"

INTSTALL_CODE_EXTENTIONS=false
if [[ $CODE_EXTENT == true ]]; then
    INTSTALL_CODE_EXTENTIONS=true
else
    yes_no "install vscode extentions" && INTSTALL_CODE_EXTENTIONS=true || INTSTALL_CODE_EXTENTIONS=false
fi

if [[ $INTSTALL_CODE_EXTENTIONS == true ]]; then
    echo "extentions"
    sed -n -r "s/^[ \t]*([^ #\t]+)[ \t#]?.*$/\1/p" "$INITDATA/vscode_extentions.list" | xargs -I{} -r -- su -c 'code --install-extension "{}"' "$INITUSER"
fi
