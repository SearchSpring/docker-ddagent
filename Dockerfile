FROM datadog/docker-dd-agent:latest-alpine

RUN rm -rf /opt/data-agent/agent/conf.d/*.yaml && rm -rf /opt/data-agent/agent/conf.d/*.yaml.default

COPY conf.d/elastic.yaml /conf.d/elastic.yaml