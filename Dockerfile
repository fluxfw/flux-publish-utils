FROM php:8.0-cli-alpine

LABEL org.opencontainers.image.source="https://github.com/fluxapps/FluxPublishUtils"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

COPY ./bin/entrypoint.php /entrypoint.php
ENTRYPOINT ["/entrypoint.php"]
