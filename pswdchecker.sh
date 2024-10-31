#!/bin/bash

echo "Enter a Password!"
read pswd
echo "$pswd is your Password."

score=0
if [ ${#pswd} -ge 8 ]; then
    ((score += 2))
    echo "Your password has more than 8 characters!"
else
    echo "Less than 8 characters!"
fi

case "$pswd" in
    *[A-Z]*)
        echo "Password contains a uppercase letter."
        ((score += 2))
        ;;
    *)
        echo "No uppercase letter found."
        ;;
esac


case "$pswd" in
    *[a-z]*)
        echo "Password contains a lowercase letter."
        ((score += 2))
        ;;
    *)
        echo "No lowercase letter found."
        ;;
esac

if [[ $pswd =~ [0-9] ]]; then
    ((score += 2))
fi
echo "Having atleast one numeric character!"


scount=0
i=0


schars="!@#$%^&*()_+{}[]:<>?/"


while [ $i -lt ${#pswd} ]; do
    char="${pswd:$i:1}" #I can loop separate pswd char w/ this ^_^

    
    if [[ "$schars" == *"$char"* ]]; then
        ((scount += 1))
    fi
    ((i += 1))
done

if [ "$scount" -ge 2 ]; then
    echo "Password contains at least 2 special characters."
    ((score += 2))
else
    echo "Password doesn't have enough special characters."
fi
echo " "
echo "Your Password score: $score/10"
