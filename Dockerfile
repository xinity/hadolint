FROM alpine:3.4

MAINTAINER Rachid Zarouali <xinity77@gmail.com>

RUN apk --no-cache add gmp

COPY bin/hadolint /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/hadolint", "-" ]


