#!/bin/sh

__cleanExports() {
    unset -f __printVersionIfNeed;
    unset -f __exitIfNoArgs;
    unset -f __createFileWhenNotExist;
    unset -f __resizeFile;
    unset -f __cleanExports;
}

__printVersionIfNeed() {
    if echo "$1" | grep -Eq '(-v|--version)'; then
        BASEDIR=$(dirname "$0");
        PACKAGE="$BASEDIR/../package.json";
        VERSION=$(grep '"version":' "$PACKAGE"| cut -d\" -f4)
        echo "v$VERSION";
        exit;
    fi
}

__exitIfNoArgs() {
    FILE=$1;
    SIZE=$2;
    
    NO_ARGS=$([ $# -ne 2 ]);
    NOT_ALL_ARGS=$([ -z "$FILE" ] || [ -z "$SIZE" ]);
    
    if [ "$NO_ARGS" ] || [ "$NOT_ALL_ARGS" ]; then
         echo "loop <file> <size>";
         exit;
    fi
}

__createFileWhenNotExist() {
    if [ ! -f "$FILE" ]; then
        fallocate -l "$SIZE" "$FILE"
        mkfs.ext4 "$FILE"
    fi
}

__resizeFile() {
    e2fsck "$FILE"
    resize2fs "$FILE" "$SIZE"
}

