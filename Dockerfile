ARG ALPINE_IMAGE=alpine:latest
ARG FLUX_AUTOLOAD_API_IMAGE=docker-registry.fluxpublisher.ch/flux-autoload/api:latest
ARG FLUX_REST_BASE_API_IMAGE=docker-registry.fluxpublisher.ch/flux-rest/base-api:latest
ARG PHP_CLI_IMAGE=php:cli-alpine

FROM $FLUX_AUTOLOAD_API_IMAGE AS flux_autoload_api
FROM $FLUX_REST_BASE_API_IMAGE AS flux_rest_base_api

FROM $ALPINE_IMAGE AS build

COPY --from=flux_autoload_api /flux-autoload-api /flux-publish-utils/libs/flux-autoload-api
COPY --from=flux_rest_base_api /flux-rest-base-api /flux-publish-utils/libs/flux-rest-base-api
COPY . /flux-publish-utils

FROM $PHP_CLI_IMAGE

LABEL org.opencontainers.image.source="https://github.com/fluxapps/flux-publish-utils"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

USER www-data:www-data

ENTRYPOINT ["/flux-publish-utils/bin/entrypoint.php"]

COPY --from=build /flux-publish-utils /flux-publish-utils
