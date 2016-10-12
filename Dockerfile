FROM ubuntu:16.04
MAINTAINER Soo Lee (duplexa@gmail.com)

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y wget unzip less vim libkrb5-3 libpng12-0

# copy files
WORKDIR /usr/local/bin
RUN wget http://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/validateFiles
COPY run.sh .
RUN chmod +x run.sh validateFiles

# default command
CMD ["run.sh"]

