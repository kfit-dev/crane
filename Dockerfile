FROM golang:alpine

RUN  apk --no-cache add git \
  && go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login \
  && go get -u github.com/google/go-containerregistry/cmd/crane

#------------------------------------------
FROM alpine

COPY --from=0 /go/bin/docker-credential-ecr-login /usr/local/bin/
COPY --from=0 /go/bin/crane /usr/local/bin/

RUN mkdir -p /root/.docker

ENTRYPOINT ["/bin/sh"]
