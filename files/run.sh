#!/bin/sh

# mount NFS volume
if [[ -z "${NFS_SHARE}" ]]; then
	echo "NFS_SHARE not set"
else
	echo "mounting $NFS_SHARE"
	mount.nfs4 -v $NFS_OPTS $NFS_SHARE /data
fi

# AWS CMD
if [[ -z "${AWS_S3_CMD}" ]]; then
	echo "AWS_S3_CMD not set, sleeping to leave the container running"
	sleep 100000000
else
	cd /data
	echo "Running: aws s3 $AWS_S3_CMD"
	date
	aws s3 $AWS_S3_CMD
fi

echo "finished"
date
