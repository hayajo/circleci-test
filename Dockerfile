# syntax = docker/dockerfile:experimental
FROM alpine
RUN \
  --mount=type=cache,id=foo,target=/var/tmp \
  /bin/sh -c 'touch /var/tmp/foo; ls -l /var/tmp > /foo'
