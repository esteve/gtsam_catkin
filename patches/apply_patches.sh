#!/bin/sh

PATCHES_DIR=$1
if [ -d ${PATCHES_DIR} ]
then
    find ${PATCHES_DIR} -name "*.patch" -print0 | sort -z | xargs -r0 git am
fi