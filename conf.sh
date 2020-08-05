# options !NO TRAILING SLASHES! #
INITUSER="epfnair"  # user
TMPDIR="/tmp"     # folder for temporary items
BUILDDIR="/home/$INITUSER/code/build" # folder for sub_inits that need building
INITDIR="$(pwd)"  # root folder for init.sh
INITDATA="$(pwd)/data" # data folder
INITPY3=true      # use python3
INITTODO="$INITDIR/todo.txt" # output file for todos

# sub init spezific #

##ZSH
ZSHADDTHEMES=true   # copy themes from data to ohmyzsh's theme folder
ZSHTHEME="epf"      # default theme for ZHS

## VSCode
#CODE_EXTENT=false  # (only useful if set to true)
