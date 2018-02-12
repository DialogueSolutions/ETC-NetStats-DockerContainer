#Install ubuntu 16 Image
FROM ubuntu:16.04

# This is the instalation file for the whole envirment in the container. 
COPY install /install

# Run Config
RUN sh /install/init

#Entry point
ENTRYPOINT exec /.etc-netstats/startNetstats.sh
