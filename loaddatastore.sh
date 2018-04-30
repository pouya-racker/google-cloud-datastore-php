#!/usr/bin/env bash

FILE=$1
COUNT=${2:-`wc -l $FILE|awk '{print $1}'`}

##Reading and exporting project_id from metadata
export PROJECT_ID=`curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google"`

readarray -n $COUNT -t LINES < $FILE
for LINE in "${LINES[@]}"; do
	sku=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\1/g"`
	name=`echo $LINE | sed "s/^.\?{\"sku\":\([0-9]\+\),\"name\":\"\([^\"]\+\)\".*$/\2/g"`
	echo "Inserting SKU=$sku"
	php loaddatastore.php "$sku" "$name"
done
