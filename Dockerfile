FROM gcr.io/go-containerregistry/crane:debug

RUN ["/busybox/sh", "-c", "mkdir -p /bin /root && ln -s /busybox/sh /bin/sh"]

ENTRYPOINT ["/bin/sh"]
