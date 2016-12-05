#!/bin/bash

file=$1

if [[ $file =~ \.gz$ ]]
then
  MD_OUT=($(gunzip -c $file | md5sum))
else
  MD_OUT=($(md5sum $file))
fi

MD=${MD_OUT[0]}
echo "md5sum	$MD" >> report

