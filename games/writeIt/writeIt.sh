#!/bin/bash

TARGET=10
WORDS="./words.txt"
if test "x$1" != "x" ; then 
  WORDS=$1 
fi


############

SCORE=0
ATTEMPT=0

function getRandomLine() {
    FILE=$1
    head -$((${RANDOM} % `wc -l < $FILE` + 1)) $FILE | tail -1
}

function askQuestion() {
    clear
    ATTEMPT=$((ATTEMPT+1))
    A=$(getRandomLine $WORDS)   
    echo
    echo "------------------------------------------"
    echo "You have $SCORE point(s), your taget is $TARGET"
    echo "------------------------------------------" 
    echo
    echo "Please copy this text:"
    echo $A
    echo
    echo -n "> "
    read INPUT

    echo
    if test "$A" = "$INPUT" ; then
       echo "Congratulations! 👌 "
       SCORE=$((SCORE+1))
    else
       echo "Sorry try again‼️ "
    fi
}

while test $SCORE -lt $TARGET ; do
  askQuestion
done

echo
echo "   >>> 🤘 🤘 🤘  AWESOME! YOU DID IT !!! nb attemps: $ATTEMPT 🤘 🤘 🤘  <<<"
echo

sleep 2


