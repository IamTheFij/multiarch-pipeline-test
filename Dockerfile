# First build arg is to ensure pulling the image from the correct repository
# The following will work with any library image that supports multi-arch
# Other repositories may use tag suffix instead
ARG REPO=library
FROM multiarch/qemu-user-static:4.2.0-2 as qemu-user-static

# Try in a new dir
RUN mkdir /qemu
RUN touch /qemu/qemu-x86_64-dummy
RUN cp /usr/bin/qemu-* /qemu/
RUN ls -al /qemu

# What's going on here? Why does the dir go away?
RUN ls -al /usr/bin
RUN echo "" > /usr/bin/dummy
RUN ls -al /usr/bin

# How about bin?
RUN ls -al /bin
RUN echo "" > /bin/dummy
RUN ls -al /bin

FROM ${REPO}/python:3-alpine

# This should be the target qemu arch
ARG ARCH=x86_64
COPY --from=qemu-user-static /usr/bin/qemu-${ARCH}-* /usr/bin/

# Everything below here is just a simple example

RUN echo "OK" > /foo

CMD [ "cat", "/foo" ]
