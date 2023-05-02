#!/bin/bash
###### This script is for performing floating point operations

#Taking the two numbers from user
read -p "Enter first number:" N1
read -p "Enter second number:" N2


#calculating the sum, sub, multiplication, division and modulus
#Here i used two methods but the awk is more accurate

#####sum
echo "The sum o/p is:"
#echo "$N1+$N2" | bc
echo | awk "{ print $N1 + $N2 }"


#####subtraction
echo "The subtraction o/p is:"
#echo "$N1-$N2" | bc
echo | awk "{ print $N1 - $N2 }"


#####multiplication
echo "The multipliction o/p is:"
#echo "$N1*$N2" | bc
echo | awk "{ print $N1 * $N2 }"


#######division
echo "The division o/p is:"
#echo "scale = 2; $N1/$N2" | bc
echo | awk "{ print $N1 / $N2 }"



#######modulus
echo "The modules o/p is:"
#echo "$N1%$N2" | bc
echo | awk "{ print $N1 % $N2 }"
