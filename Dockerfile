FROM otel/opentelemetry-collector-dev:latest as otel_layer

FROM alpine:3.9
RUN apk add bash

COPY --from=otel_layer /otelcol /usr/local/bin/otelcol
COPY --from=otel_layer /etc/otel/config.yaml /etc/otel/config.yaml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

COPY *.yaml.in ./
COPY *.yaml ./

EXPOSE 55678
EXPOSE 55679

CMD ["/usr/local/bin/entrypoint.sh"]
