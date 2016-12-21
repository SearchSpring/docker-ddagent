FROM datadog/docker-dd-agent:latest
MAINTAINER Greg Hellings <greg@searchspring.com>

RUN apt-get clean && apt-get update && apt-get install -y wget

ENV \
  DOCKERIZE_VERSION=v0.3.0 \
  SECRET="" \
  SYNCPATH="/data"

RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && mkdir -p /templates \
    && rm -rf /opt/data-agent/agent/conf.d/*.yaml \
    && rm -rf /opt/data-agent/agent/conf.d/*.yaml.default

COPY conf.d/haproxy.yaml.tmpl /templates
COPY myentrypoint.sh /myentrypoint.sh

ENTRYPOINT ["/myentrypoint.sh"]