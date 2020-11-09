#!/usr/bin/env sh
# Usage: $0 Section_number
# Section_number = 5, 6, 7,

echo $1

# List all students
if [ $1 -eq -1 ]; then
    echo "List all emails from all sessions..."
    for COURSE in 79158 76203 78323
    do
	echo $COURSE
	curl -H "Authorization: Bearer  XXX--to-find-out--XXX" https://emory.instructure.com/api/v1/courses/$COURSE/users?per_page=30 | jq '.[]|{"name","email"}'
    done
    cat /dev/null > Math221_Emails.csv
    for COURSE in 79158 76203 78323
    do
	echo $COURSE
	curl -H "Authorization: Bearer  XXX--to-find-out--XXX" https://emory.instructure.com/api/v1/courses/$COURSE/users?per_page=30 | jq -r '.[]|[.name,.email]|@csv'  >> Math221_Emails.csv
    done
    nvim -c ':Tabularize /,' -c ':wq' Math221_Emails.csv
    cat Math221_Emails.csv
    rm Math221_Emails.html
    rm Math221_Emails.abook
    rm Math221_Emails.mutt
    abook   --convert   --informat   csv   --infile   Math221_Emails.csv   --outformat   html    --outfile   Math221_Emails.html
    abook   --convert   --informat   csv   --infile   Math221_Emails.csv   --outformat   abook   --outfile   Math221_Emails.abook
    abook   --convert   --informat   csv   --infile   Math221_Emails.csv   --outformat   mutt    --outfile   Math221_Emails.mutt
    cwd=$(pwd)
    cd ~/.abook/
    ln -s $cwd/Math221_Emails.abook Math221_Emails.abook
    ln -s $cwd/Math221_Emails.mutt Math221_Emails.mutt
    cd -
    exit 1
fi


if [ $1 -eq 0 ]; then
     COURSE=66586
fi

if [ $1 -eq 5 ]; then
     COURSE=79158
fi

if [ $1 -eq 6 ]; then
     COURSE=76203
fi

if [ $1 -eq 7 ]; then
     COURSE=78323
fi
echo $COURSE


# Readable output
curl -H "Authorization: Bearer  XXX--to-find-out--XXX" https://emory.instructure.com/api/v1/courses/$COURSE/users?per_page=30 | jq '.[]|{"name","email"}'

# CSV output
curl -H "Authorization: Bearer  XXX--to-find-out--XXX" https://emory.instructure.com/api/v1/courses/$COURSE/users?per_page=30 | jq -r '.[]|[.name,.email]|@csv' > Math221_$1_Emails.csv
nvim -c ':Tabularize /,' -c ':wq' Math221_$1_Emails.csv
cat Math221_$1_Emails.csv
rm Math221_$1_Emails.html
rm Math221_$1_Emails.abook
rm Math221_$1_Emails.mutt
abook   --convert   --informat   csv   --infile   Math221_$1_Emails.csv   --outformat   html    --outfile   Math221_$1_Emails.html
abook   --convert   --informat   csv   --infile   Math221_$1_Emails.csv   --outformat   abook   --outfile   Math221_$1_Emails.abook
abook   --convert   --informat   csv   --infile   Math221_$1_Emails.csv   --outformat   mutt    --outfile   Math221_$1_Emails.mutt
cwd=$(pwd)
cd ~/.abook/
ln   -s   $cwd/Math221_$1_Emails.abook   Math221_$1_Emails.abook
ln   -s   $cwd/Math221_$1_Emails.mutt    Math221_$1_Emails.mutt
cd -


