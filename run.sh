#!/bin/bash

file=$1
type=$2

if [[ $file =~ \.gz$ ]]
then
  MD_OUT=($(gunzip -c $file | md5sum))
else
  MD_OUT=($(md5sum $file))
fi

MD=${MD_OUT[0]}
validateFiles type=$type $file
ERCD=$?
echo "md5sum	$MD" >> report
echo "validateFiles_errorcode	$ERCD" >> report

