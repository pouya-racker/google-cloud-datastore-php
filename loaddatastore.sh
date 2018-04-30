#!/usr/bin/env bash

FILE=$1
COUNT=${2:-`wc -l $FILE|awk '{print $1}'`}

readarray -t LINES < "$FILE"
for LINE in -n $COUNT "${LINES[@]}"; do
    echo "Reading line $LINE"
	sku=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\1/g"`
	name=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\2/g"`
	echo "Inserting $sku , $name"
	php loaddatastore.php "$sku" "$name"
done
