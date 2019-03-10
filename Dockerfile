ARG REPO=library
FROM ${REPO}/python:3-alpine

ARG ARCH=x86_64

COPY ./build/qemu-${ARCH}-static /usr/bin/

RUN echo "OK" > /foo

CMD [ "cat", "/foo" ]
