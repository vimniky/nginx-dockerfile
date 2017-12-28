FROM nginx:1.13.8

COPY entry.sh /usr/bin/
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install --no-install-recommends -y curl ca-certificates \
 && apt-get install -y --no-install-recommends \
            curl \
            jq \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/*

 RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 -o /usr/local/bin/confd \
 && chmod +x /usr/local/bin/confd

COPY website /web
WORKDIR /web
EXPOSE 3001

ENTRYPOINT ["/usr/bin/entry.sh"]
CMD ["nginx", "-g", "daemon off;"]
