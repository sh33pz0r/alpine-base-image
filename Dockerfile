ARG apline_ver=3.8
FROM alpine:${apline_ver}

ARG apline_ver
RUN echo "alpine version:"$apline_ver > /home/versions

RUN addgroup -g 9001 -S runner && \
    adduser -u 9001 -S runner -G runner && \
    apk add --no-cache gomplate su-exec