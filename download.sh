#!/bin/sh
# usage: download.sh <puzzle-number> [<puzzle-number>...]
auth_args="-H Cookie:sessionid=h40374cx6710gx7mj1eqm18ad3a6d01h"
for j in $@; do
    i=1
    urls="$(curl https://perpendicular.institute/puzzle/infinite-$j/ $auth_args | grep -o 'https://storage\.googleapis\.com/infinite-corridor/loi-\w*\.png')"
    for url in $urls; do
        sleep 1
        curl $url $auth_args > library/$j-$i.png
        i=$((i+1))
    done
done
