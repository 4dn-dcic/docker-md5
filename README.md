# Docker-validatefiles


QC module for fastq files, based on validateFiles.
* Input : a fastq file (either gzipped or not)
* Output : a report file containing md5sum and validateFile error code (0 means pass)

This repo contains the source files for a docker image stored in duplexa/validatefiles:v1. (we will change the docker hub account soon)


## Cloning the repo
```
git clone https://github.com/4dn-dcic/docker-validatefiles
cd docker-validatefiles
```

## Resources tools
Major software tools used inside the docker container are downloaded by the script `downloads.sh`. This script also creates a symlink to a version-independent folder for each software tool. In order to build an updated docker image with a new version of the tools, ideally only `downloads.sh` should be modified, but not `Dockerfile`, unless the new tool requires a specific APT tool that need to be downloaded. 
The `downloads.sh` file also contains comment lines that specifies the name and version of individual software tools.


## Building docker image
You need docker daemon to rebuild the docker image. If you want to push it to a different docker repo, replace duplexa/validatefiles:v1 with your desired docker repo name. You need permission to push to duplexa/validatefiles:v1.
```
docker build -t duplexa/validatefiles:v1 .
docker push duplexa/validatefiles:v1
```

## Usage
Run the following in the container.
```
run.sh <file> <type>
# file : input file, either gzipped or not
# type : type of the file to be validate (e.g. 'fastq')
# output file 'report' is generated.
```
