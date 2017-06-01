#!/bin/sh

if echo "$1" | grep -Eq '(-v|--version)'; then
    VERSION=$(grep '"version":' package.json | cut -d\" -f4)
    echo "v$VERSION";
    exit;
fi

FILE=$1
SIZE=$2

if [ $# -ne 2 ]; then
     echo "loop <file> <size>";
     exit;
fi

echo file: "$FILE";
echo size: "$SIZE";

if [ ! -f "$FILE" ]; then
    fallocate -l "$SIZE" "$FILE"
    mkfs.ext4 "$FILE"
fi

e2fsck "$FILE"
resize2fs "$FILE" "$SIZE"

