#!/bin/sh

cleanExports() {
    unset -f printVersionIfNeed;
    unset -f exitIfNoArgs;
    unset -f createFileWhenNotExist;
    unset -f resizeFile;
    unset -f check;
    unset -f checkDependencies;
    unset -f printMissing;
    unset -f cleanExports;
}

printVersionIfNeed() {
    if echo "$1" | grep -Eq '(-v|--version)'; then
        BASEDIR=$(dirname "$0");
        PACKAGE="$BASEDIR/../package.json";
        VERSION=$(grep '"version":' "$PACKAGE"| cut -d\" -f4)
        echo "v$VERSION";
        exit;
    fi
}

exitIfNoArgs() {
    FILE=$1;
    SIZE=$2;
    
    if [ -z "$FILE" ] || [ -z "$SIZE" ]; then
         echo "loop <file> <size>";
         exit;
    fi
}

check() {
    if [ ! "$(command -v "$1")" ]; then
        printMissing "$1";
        exit 1;
    fi
}

checkDependencies() {
    check fallocate;
    check mkfs.ext4;
    check e2fsck;
    check resize2fs;
}

printMissing() {
    echo "$1 is missing, please install it";
}

createFileWhenNotExist() {
    FILE="$1";
    SIZE="$2"
    
    if [ ! -f "$FILE" ]; then
        fallocate -l "$SIZE" "$FILE" || \
        dd if=/dev/zero of="$FILE" bs="$SIZE" seek=1 count=0
        
        mkfs.ext4 "$FILE"
    fi
}

resizeFile() {
    FILE=$1;
    SIZE=$2;
    
    e2fsck -p "$FILE"
    resize2fs "$FILE" "$SIZE"
}

