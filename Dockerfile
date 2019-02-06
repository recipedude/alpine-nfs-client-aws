FROM alpine:3.8
LABEL maintainer "Sean Wenzel <sean@infinitenetworks.com>"

RUN apk -v --update add --no-cache \
			python \
			py-pip \
			groff \
			less \
			mailcap \
			bzip2 \
			nfs-utils \
			&& \
			pip install --upgrade pip && \
			pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
			apk -v --purge del py-pip && \
    	rm -f /var/cache/apk/* 

ADD files/run.sh /scripts/run.sh
RUN chmod -R 755 /scripts && \
    mkdir /data

ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""

VOLUME /data
VOLUME /root/.aws

CMD ["/scripts/run.sh"]
