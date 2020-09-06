FROM ubuntu:18.04

RUN apt-get update && if which apt-get > /dev/null; then apt-get -y install git build-essential automake libcurl4-openssl-dev;fi

RUN git clone -b release https://github.com/roswell/roswell.git

RUN cd roswell && sh bootstrap && ./configure && make && make install && ros setup

ENV SWANK_PORT 4005
ENV WORK_DIR /cl

RUN mkdir ${WORK_DIR}
WORKDIR ${WORK_DIR}

CMD [ "/bin/sh", "-c", "ros run -e '(ql:quickload :swank :silent t)' -e '(setf swank::*loopback-interface* \"0.0.0.0\")' -e \"(swank:create-server :port ${SWANK_PORT})\"" ]
