#!/bin/bash

git init

touch junk

echo "Enter Beginning date [yyyymmdd]"
read BEGIN_DATE

echo "Enter End date [yyyymmdd]"
read END_DATE

DATE=$BEGIN_DATE

while [[ "$DATE" -le "$END_DATE" ]]; do
    echo 'Dont ask a barber if you need a haircut!' >> junk

    git add .

    msg="commit${DATE}"

    GIT_COMMITTER_DATE="${DATE}T12:00:00" git commit -m "$msg"

    DATE=$(date +%Y%m%d -d "$DATE + 1 day")

done