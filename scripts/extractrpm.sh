#!/bin/bash

dirname=`echo $1 | sed 's/.rpm$//'`
mkdir $dirname && cd $dirname && rpm2cpio ../$1 | cpio -idmv && cd ..
