ARG apline_ver=3.9
FROM alpine:${apline_ver}

ARG apline_ver
ARG gomplate_ver=3.3.1

COPY --from=hairyhenderson/gomplate:v3.3.1-alpine /bin/gomplate /bin/gomplate

RUN addgroup -g 9001 -S runner && \
    adduser -u 9001 -S runner -G runner && \
    apk add --no-cache su-exec && \
    mkdir /app && chown -R runner:runner /app && \
    rm -rf /var/cache/apk/* /tmp/*

RUN echo "alpine version:"$apline_ver > /app/versions && echo "gomplate version:"$gomplate_ver >> /app/versions
