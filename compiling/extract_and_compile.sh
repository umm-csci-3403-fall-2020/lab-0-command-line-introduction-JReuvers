#!/usr/bin/env bash

num=${1?Error: no number given}

#Uncompressing and Extracting NthPrime
tar zxf NthPrime.tgz

#Entering the new directory
cd NthPrime

#Compiling the c files
gcc main.c nth_prime.c -o NthPrime

#Runs the compiled c program with previously specified value
./NthPrime $num
