#!/bin/sh

cleanExports() {
    unset -f printVersionIfNeed;
    unset -f exitIfNoArgs;
    unset -f createFileWhenNotExist;
    unset -f resizeFile;
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
    
    NO_ARGS=$([ $# -ne 2 ]);
    NOT_ALL_ARGS=$([ -z "$FILE" ] || [ -z "$SIZE" ]);
    
    if [ "$NO_ARGS" ] || [ "$NOT_ALL_ARGS" ]; then
         echo "loop <file> <size>";
         exit;
    fi
}

createFileWhenNotExist() {
    if [ ! -f "$FILE" ]; then
        fallocate -l "$SIZE" "$FILE"
        mkfs.ext4 "$FILE"
    fi
}

resizeFile() {
    e2fsck "$FILE"
    resize2fs "$FILE" "$SIZE"
}

