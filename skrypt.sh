echo '#!/bin/bash

case "$1" in
    --date)
        date
        ;;
esac' > skrypt.sh
chmod +x skrypt.sh