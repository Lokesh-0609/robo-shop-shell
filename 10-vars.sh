## input scripts

## x=100 bash 10-vars.sh
echo  x from left side of  script - ${x}

## export y=200
## bash 10-vars.sh

echo y from before script declared  - ${y}

### bash 10-vars.sh call firts argument
echo first arugument is - $1

## after executing script
read -p 'enter z is -' z
echo z from  input -${z}


## Out of four, right side using arguments are preferred by many engineers to write, As this is the standard way of most commands that execute in Linux.

echo first argument is -$1
echo seconde argument is $2
###echo N th argument-${n} beyond $9, from $10, to get the value we should use ${10}
echo all arguments- $*
echo number of arguments- $#

##command substitution
date=$(date)
echo date is -${date}

##Arithemetic sub stitution
sum=$((10+5))
echo 'sum of 10+5 is -' ${sum}