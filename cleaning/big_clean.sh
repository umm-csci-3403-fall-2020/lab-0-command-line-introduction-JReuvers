#!/usr/bin/env bash

#Takes a file name as input
#Saves it as variable FILE
#Saves without an extention as BASE
FILE=${1?Error: no file name given}
BASE=$(echo "$FILE" | cut -f 1 -d '.')

#Creates a temp directory
#Saves it as tmp_dir
tmp_dir=$(mktemp -d)

#Uncompresses and untars the designated FILE
#Places it in the temp directory made prior
tar -xzf "$FILE" -C "$tmp_dir"

#Saves the current directory as HERE
HERE=$(pwd)

cd "$tmp_dir" || exit
pushd "$BASE" || exit

#Finds and deletes files that have DELETE ME! in them 
rm -f $(find . | xargs grep -l -F "DELETE ME!")

popd || exit

#Compresses and places the files back into the original directory
tar -czf "$HERE"/cleaned_"$FILE" "$BASE"
