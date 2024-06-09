echo '#!/bin/bash

create_logs() {
    num_files=$1
    for i in $(seq 1 $num_files); do
        file="log$i.txt"
        echo "File name: $file" > $file
        echo "Created by: skrypt.sh" >> $file
        date >> $file
    done
}

create_errors() {
    num_files=$1
    mkdir -p errorx
    for i in $(seq 1 $num_files); do
        file="errorx/error$i.txt"
        echo "File name: $file" > $file
        echo "Created by: skrypt.sh" >> $file
        date >> $file
    done
}

case "$1" in
    --date|-d)
        date
        ;;
    --logs|-l)
        if [ -z "$2" ]; then
            create_logs 100
        else
            create_logs $2
        fi
        ;;
    --help|-h)
        echo "--date, -d     Show current date"
        echo "--logs, -l [N] Create N log files (default 100)"
        echo "--error, -e [N] Create N error files (default 100)"
        echo "--help, -h     Show available options"
        ;;
    --error|-e)
        if [ -z "$2" ]; then
            create_errors 100
        else
            create_errors $2
        fi
        ;;
    --init)
        git clone https://github.com/twoje-konto/zadanie-skrypt-bash.git
        export PATH=$PATH:$(pwd)
        ;;
esac' > newLogs.sh