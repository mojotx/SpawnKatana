#!/bin/bash

SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DEST="${HOME}/Zomboid/mods"

if [[ ! -d "${SRCDIR}" ]]
then
    echo "Weird error!" >&2
    exit 1
fi

if [[ ! -d "${DEST}" ]]
then
    mkdir -p "${DEST}"
fi

rsync -avP \
    --exclude-from="${SRCDIR}/.rsync_excludes.txt" \
    --delete-excluded \
    --delete \
    "${SRCDIR}" "${DEST}"


# vim:ft=sh
