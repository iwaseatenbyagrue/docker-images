FROM alpine

RUN apk update
RUN apk add tor

RUN adduser -Dh /var/lib/tor toranon
RUN mkdir -m 750 -p /run/tor && chown toranon:toranon /run/tor

COPY torrc /etc/tor/torrc
USER toranon


ENTRYPOINT ["/usr/bin/tor"]

CMD []

ARG BUILD_DATE
LABEL   org.label-schema.schema-version="1.0" \
  org.label-schema.name="tor" \
  org.label-schema.description="Protect your privacy. Defend yourself against network surveillance and traffic analysis." \
  org.label-schema.url="https://www.torproject.org/" \
  org.label-schema.usage="https://www.torproject.org/docs/tor-manual.html.en" \
  org.label-schema.build-date="$BUILD_DATE"

