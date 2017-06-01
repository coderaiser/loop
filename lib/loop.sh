#!/bin/sh

BASENAME=$(dirname "$0");

. "$BASENAME/api.sh"

FILE=${1:-$FILE};
SIZE=${2:-$SIZE};

__printVersionIfNeed "$1";
__exitIfNoArgs "$FILE" "$SIZE";
__createFileWhenNotExist;
__resizeFile;
__cleanExports;

