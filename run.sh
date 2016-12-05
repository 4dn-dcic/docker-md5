#!/bin/bash

file=$1
type=$2
validate=$3  ## 0 : don't validate, just do md5. 1 : validatefastq

if [[ $file =~ \.gz$ ]]
then
  MD_OUT=($(gunzip -c $file | md5sum))
else
  MD_OUT=($(md5sum $file))
fi

MD=${MD_OUT[0]}
echo "md5sum	$MD" >> report

if (( $validate == 1 ))
then
validateFiles type=$type $file
  ERCD=$?
  echo "validateFiles_errorcode	$ERCD" >> report
fi

