#!/usr/bin/env bash
FILE=$1
COUNT=${2:-52000}
readarray -t LINES < "$FILE"
for LINE in -n $COUNT "${LINES[@]}"; do
	sku=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\1/g"`
	name=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\2/g"`
	php loaddatastore.php "$sku" "$name"
done
