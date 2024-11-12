# Docker-md5


QC module for any files, based on md5sum.
* Input : a file (either gzipped or not)
* Output : a report file containing regular md5sum (first line) and content (ungzipped) md5sum (second line)
    * format of output report file
    ```
    38008d3eb5f7532896c748172427b524
    5a6d311c0d8f6d1dd03c1c129061d3b1
    ```

_The current version of this pipeline pulls the Docker image from a public AWS Elastic Container Registry. If you prefer to pull from Docker Hub (DH), please use the tagged version utilizing DH: `v2_DH`._

This repo contains the source files for a docker image stored in both `4dndcic/md5:v2` and AWS `public.ecr.aws/dcic-4dn/md5:v2`.

## Cloning the repo
```
git clone https://github.com/4dn-dcic/docker-md5
cd docker-md5
```

## Resources tools
Major software tools used inside the docker container are downloaded by the script `downloads.sh`. This script also creates a symlink to a version-independent folder for each software tool. In order to build an updated docker image with a new version of the tools, ideally only `downloads.sh` should be modified, but not `Dockerfile`, unless the new tool requires a specific APT tool that need to be downloaded. 
The `downloads.sh` file also contains comment lines that specifies the name and version of individual software tools.


## Building docker image
You need docker daemon to rebuild the docker image. If you want to push it to a different docker repo, replace 4dndcic/md5:v2 with your desired docker repo name. You need permission to push to 4dndcic/md5:v2.
```
docker build -t 4dndcic/md5:v2 .
docker push 4dndcic/md5:v2
```

## Usage
Run the following in the container.
```
run.sh <file> 
# file : input file, either gzipped or not
# output file 'report' is generated.
```
