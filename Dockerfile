FROM datadog/docker-dd-agent:latest-alpine

RUN rm -rf /opt/data-agent/agent/conf.d/*.yaml && rm -rf /opt/data-agent/agent/conf.d/*.yaml.default

COPY conf.d/haproxy.yaml /conf.d/haproxy.yaml