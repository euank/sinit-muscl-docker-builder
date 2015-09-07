FROM alpine
MAINTAINER <euank>

RUN apk update; apk add git; apk add gcc; apk add make; apk add musl-dev
RUN git clone git://git.suckless.org/sinit

WORKDIR /sinit
RUN git checkout v1.0
RUN make

VOLUME ["/out"]
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
