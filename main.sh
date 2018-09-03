#!/bin/bash

git init

touch junk

echo "Enter Beginning date [yyyymmdd]"
read BEGIN_DATE

echo "Enter End date [yyyymmdd]"
read END_DATE

DATE=$BEGIN_DATE

while [[ "$DATE" -le "$END_DATE" ]]; do
    echo 'a' >> junk

    git add .

    msg="commit${DATE}"

    export GIT_AUTHOR_DATE="${DATE}T12:00:00"
    export GIT_COMMITTER_DATE="${DATE}T12:00:00"
    
    git commit -m "$msg"

    unset GIT_AUTHOR_DATE
    unset GIT_COMMITTER_DATE

    DATE=$(date +%Y%m%d -d "$DATE + 1 day")

done
