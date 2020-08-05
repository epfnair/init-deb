# configs #
. util.sh
. conf.sh
. pre_init.sh

VERSION="0.4.0"

sub_inits=$(get_inits)
CONTINUE=true
ALL=false

# basic argument parsing #
if [[ $# == 0 || "help" == $1 ]]; then
    CONTINUE=false
    echo "init version: $VERSION"
    echo ""
    echo "usage: init.sh [all, list, help]"
    echo "           all:  install all available sub_inits"
    echo "           list: list all available sub inits (does not affect anything)"
    echo "           help: shows this help message (does not affect anything)"
    echo ""
    echo "       init.sh [list of sub_inits]"
    echo "           installs all spezified sub_inits"
    echo ""
    CONTINUE=false
elif [[ "all" == "$1" ]]; then
    yes_no "install everything" && CONTINUE=true || CONTINUE=false
    ALL=true
elif [[ "version" == "$1" ]]; then
    echo "init version: $VERSION"
    CONTINUE=false
elif [[ "list" == "$1" ]]; then
    echo "sub inits: "
    echo "$sub_inits"
    CONTINUE=false
fi

# download all of just the spizified sub_inits #
if [[ $CONTINUE == true ]]; then
    # check if the script is run as root #
    if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

    echo "starting init"
    
    if [[ $ALL == true ]]; then
        for file in $sub_inits; do
            exec_subinit "$file"
        done
    else
        for i in "$@"; do
            sub_file="$INITDIR/sub/init_$i.sh"
            if [[ -f "$sub_file" ]]; then
                exec_subinit "$sub_file"
            else
                echo "could not fild sub init: $i"
            fi
        done
    fi
    echo "finished init"
    echo "please read todo.txt ($INITTODO) on further instructions to finish initialisation"
fi

. post_init.sh
