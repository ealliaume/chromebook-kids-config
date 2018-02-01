#!/bin/bash

TARGET=10

###########

MIN_NUMBER_1=0
MAX_NUMBER_1=10
MIN_NUMBER_2=0
MAX_NUMBER_2=5
OPERATOR="+"

SCORE=0
ATTEMPT=0

function updateRules() {
  if test $SCORE -lt $((TARGET / 3)) ; then
    MIN_NUMBER_1=0
    MIN_NUMBER_2=0
    MAX_NUMBER_1=10
    MAX_NUMBER_2=5
    OPERATOR="+"
  elif test $SCORE -lt $((TARGET / 3 * 2)) ; then 
    MIN_NUMBER_1=0
    MIN_NUMBER_2=0
    MAX_NUMBER_1=19
    MAX_NUMBER_2=10
    OPERATOR="+"
  else
    MIN_NUMBER_1=5
    MIN_NUMBER_2=0
    MAX_NUMBER_1=10
    MAX_NUMBER_2=5
    OPERATOR="-"
  fi 
}

function getNum() {
    min=$1
    max=$2
   
    ok=false
    while test $ok != "true" ; do   
        num=$(( ( RANDOM % $max )))
        if test $num -ge $min ; then
            ok=true
        fi
    done
    echo $num
}

function solve() {
    a=$1
    op=$2
    b=$3
    
    r=-1
    if test $op = "+" ; then
      r=$((a + b))
    elif test $op = "-" ; then
      r=$((a - b))
    elif test $op = "*" ; then
      r=$((a * b))
    fi
    echo $r
}

function askQuestion() {
    clear
    ATTEMPT=$((ATTEMPT+1))

    updateRules       
    A=$(getNum $MIN_NUMBER_1 $MAX_NUMBER_1)
    B=$(getNum $MIN_NUMBER_2 $MAX_NUMBER_2)
    R=$(solve $A $OPERATOR  $B)
  
    echo
    echo "------------------------------------------"
    echo "You have $SCORE point(s), your taget is $TARGET"
    echo "------------------------------------------" 
    echo
    echo -n "Solve me :    $A $OPERATOR $B = "
    read INPUT

    echo
    if test "$R" = "$INPUT" ; then
       echo "Congratulations! 👌 "
       SCORE=$((SCORE+1))
    else
       echo "Sorry try again‼️ "
    fi
    sleep 2
}

while test $SCORE -lt $TARGET ; do
  askQuestion
done

echo
echo "   >>> 🤘 🤘 🤘  AWESOME! YOU DID IT !!! nb attemps: $ATTEMPT 🤘 🤘 🤘  <<<"
echo

sleep 2


