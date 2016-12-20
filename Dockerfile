FROM datadog/docker-dd-agent:latest-alpine

COPY conf.d/* /etc/dd-agent/conf.d/