ARG REPO=library
FROM ${REPO}/python:3-alpine

ARG ARCH=x86_64
ARG HOST_ARCH=x86_64

ARG QEMU_VERSION=v2.9.1-1

RUN [ $ARCH == $HOST_ARCH ] || { \
             wget https://github.com/multiarch/qemu-user-static/releases/download/${QEMU_VERSION}/${HOST_ARCH}_qemu-${ARCH}-static.tar.gz && \
             tar -xvf ${HOST_ARCH}_qemu-${ARCH}-static.tar.gz && \
             rm ${HOST_ARCH}_qemu-${ARCH}-static.tar.gz && \
             mv qemu-${ARCH}-static /usr/bin/ ; \
             }

RUN echo "OK" > /foo


CMD [ "cat", "/foo" ]
