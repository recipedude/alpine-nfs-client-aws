#!/bin/sh

docker run -d --name nfs-client --cap-add sys_admin --env-file config.env recipedude/alpine-nfs-client-aws:latest
