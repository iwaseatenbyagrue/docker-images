FROM alpine

ARG MATTERMOST_VERSION=5.9.0

RUN apk update && apk add --no-cache libc6-compat
RUN addgroup mattermost
RUN adduser -h /var/lib/mattermost -G mattermost -D -s /sbin/nologin mattermost
RUN mkdir -p /usr/local/src/mattermost /var/lib/mattermost/logs
RUN wget -O /usr/local/src/mattermost/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz \
  https://releases.mattermost.com/${MATTERMOST_VERSION}/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz
RUN tar --gzip --extract --directory /var/lib/ \
  --file /usr/local/src/mattermost/mattermost-${MATTERMOST_VERSION}-linux-amd64.tar.gz
RUN chown -R mattermost:mattermost /var/lib/mattermost/logs /var/lib/mattermost/config
RUN rm -rf /usr/local/src/mattermost/
USER mattermost
WORKDIR /var/lib/mattermost
ENV MM_TEAMSETTINGS_SITENAME "My Mattermost"
EXPOSE 8065
ENTRYPOINT ["/var/lib/mattermost/bin/mattermost"]
