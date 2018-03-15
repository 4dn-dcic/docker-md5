#!/bin/sh

image_name=docker-md5_local  # local image name for testing

cwd=$(pwd)
mkdir -p tmpout
docker run -it -v $cwd/sample_data/:/d/:ro -v $cwd/tmp_out/:/e/:rw $image_name sh -c 'run.sh /d/somefile.gz; mv report /e/'
md5sum $cwd/sample_data/somefile.gz | cut -f1 -d' ' > log2
gunzip -c $cwd/sample_data/somefile.gz | md5sum | cut -f1 -d' ' >> log2
if [ ! -z "$(diff tmp_out/report log2)" ]; then
  echo "test failed"
  return 1;
fi
