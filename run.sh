#!/bin/bash
MD_OUT=($(md5sum $1))
MD=${MD_OUT[0]}
validateFiles type=$2 $1
ERCD=$?
echo "md5sum	$MD" >> report
echo "validateFiles_errorcode	$ERCD" >> report

