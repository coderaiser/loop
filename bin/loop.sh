#!/bin/sh

BASENAME=$(dirname "$0");

# shellcheck source=lib/api.sh
. "$BASENAME/../lib/api.sh"

FILE=${1:-$FILE};
SIZE=${2:-$SIZE};

__printVersionIfNeed "$1";
__exitIfNoArgs "$FILE" "$SIZE";
__createFileWhenNotExist;
__resizeFile;
__cleanExports;

