FROM centos

RUN yum install -y epel-release && yum update -y
RUN yum install -y make gcc python node npm openssl gcc-c++
RUN groupadd node
RUN useradd -g node -d /var/lib/haraka -m -c "Haraka user"  haraka
RUN npm install -g Haraka express
RUN /usr/bin/haraka --install /var/lib/haraka
#
COPY entrypoint.sh /entrypoint.sh
#
COPY smtp.ini /var/lib/haraka/config/smtp.ini
COPY plugins /var/lib/haraka/config/plugins
#
ENV HARAKA_FQDN ""
ENV HARAKA_LOG_LEVEL ""
ENV HARAKA_SKIP_TLS_GEN ""
WORKDIR /var/lib/haraka
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "--configs", "/var/lib/haraka/"]

ARG BUILD_DATE
LABEL   org.label-schema.schema-version="1.0" \
  org.label-schema.name="haraka" \
  org.label-schema.description="A modern, high performance, flexible SMTP server." \
  org.label-schema.url="https://haraka.github.io/" \
  org.label-schema.usage="https://haraka.github.io/README.html" \
  org.label-schema.build-date="$BUILD_DATE"
