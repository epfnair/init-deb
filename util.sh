. conf.sh

function yes_no {
    local reply
    echo -ne "$1 [y/n]: "
    read reply
    if [[ $reply == [yY]* ]]; then
        return 0
    else
        return 1
    fi
}

function get_inits {
    ls -d $INITDIR/sub/* | grep -E '^.+/init_.*\.sh|\.py'
}

function print_file_header {
    local len
    len=`echo $1 | wc -c`
    len=`expr $len + 3`
    for i in `seq $len`; do
        echo -ne "#"
    done
    echo ""
    echo "# $1 #"
    for i in `seq $len`; do
        echo -ne "#"
    done
    echo ""
}

function new_lines {
    for i in `seq $1`; do
        echo ""
    done
}

function inilog {
    local ind
    if [[ $# == 1 ]]; then
        echo " - $1" >> "$INITTODO"
    elif [[ $# == 2 ]]; then
        ind=`expr $1 - 1`
        for i in `seq $ind`; do
            echo -ne "   "  >> "$INITTODO"
        done
        echo " - $2" >> "$INITTODO"
    elif [[ $# == 3 ]]; then
        ind=`expr $1 - 1`
        for i in `seq $ind`; do
            echo -ne "   "  >> "$INITTODO"
        done
        echo " $2 $3" >> "$INITTODO"
    fi
}

function exec_subinit {
    print_file_header "$1" >> $INITTODO
    if [[ $1 =~ .*sh$ ]]; then
        echo "sub ini: bash $1"
        . "$1"
    elif [[ $1 =~ .*py$ ]]; then
        if [[ INITPY3 == true ]]; then
            echo "sub ini: python3 $1"
            python3 "$1"
        else
            echo "sub ini: python $1"
            python "$1"
        fi
    fi
    new_lines 3 >> $INITTODO
}