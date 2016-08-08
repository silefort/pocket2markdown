FROM ubuntu:latest
MAINTAINER "slefort" <simon.lefort@gmail.com>


# Utils
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y git curl python3-pip python-dev libxml2-dev libxslt-dev libjpeg-dev zlib1g-dev libpng12-dev

# Install Newspaper
RUN pip3 install newspaper3k

# Run
CMD [ "/bin/bash" ]
