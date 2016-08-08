FROM ubuntu:latest
MAINTAINER "slefort" <simon.lefort@gmail.com>


# Utils
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y git curl python3-pip python-dev libxml2-dev libxslt-dev libjpeg-dev zlib1g-dev libpng12-dev

# Install Newspaper
RUN pip3 install newspaper3k
RUN curl https://raw.githubusercontent.com/codelucas/newspaper/master/download_corpora.py | python3

# Install Extractor
RUN mkdir -p /app/extractor
ADD extract.py /app/extractor/extract.py

# Install html2text
RUN mkdir -p /app/html2text
RUN git clone https://github.com/aaronsw/html2text.git /app/html2text

# Install pocket2notes
RUN mkdir -p /app/pocket2notes
ADD pocket2notes /app/pocket2notes/pocket2notes

# Run
#CMD [ "/bin/bash" ]
