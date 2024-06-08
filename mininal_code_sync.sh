#!/bin/bash
THIS_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))

if [ "$1" == "" ]; then
    echo "Usage: $0 repo_list.txt"
    exit 1
fi

REPO_LIST=$1

num=1
total=`wc -l $REPO_LIST`

repo init -u git@gitee.com:openharmony/manifest.git -b refs/tags/OpenHarmony-v4.1-Release --no-repo-verify

echo "Pull git repos ..."
for i in `cat $REPO_LIST`; do
    echo "[$num/$total] Fetch $i ..."
    repo sync -c $i
    num=`expr $num + 1`
done

echo "Pull git-lfs objects ..."
repo forall -c 'git lfs pull'
