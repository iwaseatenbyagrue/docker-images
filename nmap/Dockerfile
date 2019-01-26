FROM alpine

RUN apk update
RUN apk add nmap

ENTRYPOINT ["/usr/bin/nmap"]

ARG BUILD_DATE
LABEL   org.label-schema.schema-version="1.0" \
  org.label-schema.name="nmap" \
  org.label-schema.description="The network mapper." \
  org.label-schema.url="https://nmap.org/" \
  org.label-schema.usage="https://nmap.org/book/man.html" \
  org.label-schema.build-date="$BUILD_DATE"
