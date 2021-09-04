FROM ubuntu:20.04
#the following ARG turns off the questions normally asked for location and timezone for Apache
ENV DEBIAN_FRONTEND=noninteractive

#install all the tools you might want to use in your container
#probably should change to apt-get install -y --no-install-recommends
RUN apt update
RUN apt install -y software-properties-common curl

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && chmod 777 nodesource_setup.sh
RUN ./nodesource_setup.sh
RUN apt-get install nodejs -y


WORKDIR /app
EXPOSE 3000
CMD node realtime/server.js
