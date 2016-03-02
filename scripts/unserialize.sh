#!/usr/bin/env bash

if [[ $1 ]]; 
then
	php -r " echo var_dump(unserialize('"$1"')); echo \"\\n\";"
else
	STRING=`pbpaste`
	php -r " echo var_dump(unserialize('"$STRING"')); echo \"\\n\";"
fi
