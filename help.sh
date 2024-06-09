#!/bin/bash

create_logs() {
    num_files=$1
    for i in $(seq 1 $num_files); do
        file="log$i.txt"
        echo "File name: $file" > $file
        echo "Created by: skrypt.sh" >> $file
        date >> $file
    done
}

case "$1" in
    --date)
        date
        ;;
    --logs)
        if [ -z "$2" ]; then
            create_logs 100
        else
            create_logs $2
        fi
        ;;
    --help)
        echo "Available options:"
        echo "--date           Show current date"
        echo "--logs [N]       Create N log files (default 100)"
        echo "--help           Show available options"
        ;;
    *)
        echo "Invalid option. Use --help to see available options."
        ;;
esac
chmod +x skrypt.sh