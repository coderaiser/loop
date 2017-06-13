#!/bin/sh

BASENAME=$(dirname "$0");

# shellcheck source=lib/api.sh
. "$BASENAME/../lib/api.sh"

FILE=${1:-$FILE};
SIZE=${2:-$SIZE};

printVersionIfNeed "$1";
checkDependencies;
exitIfNoArgs "$FILE" "$SIZE";
createFileWhenNotExist "$FILE" "$SIZE";
resizeFile "$FILE" "$SIZE";
cleanExports;

