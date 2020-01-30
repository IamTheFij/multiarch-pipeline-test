# First build arg is to ensure pulling the image from the correct repository
# The following will work with any library image that supports multi-arch
# Other repositories may use tag suffix instead
ARG REPO=library
FROM multiarch/qemu-user-static:4.2.0-2 as qemu-user-static

FROM ${REPO}/python:3-alpine

# This should be the target qemu arch
ARG ARCH=x86_64
COPY --from=qemu-user-static /usr/bin/qemu-${ARCH}-* /usr/bin/

# Everything below here is just a simple example

RUN echo "OK" > /foo

CMD [ "cat", "/foo" ]
