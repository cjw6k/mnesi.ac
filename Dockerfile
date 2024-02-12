ARG ALPINE_VERSION=3.19.1
ARG ALPINE_HASH=sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b
ARG ALPINE_GLIBC_REPO=https://github.com/sgerrand/alpine-pkg-glibc/releases/download
ARG ALPINE_GLIBC_VERSION=2.35-r1
ARG GCOMPAT_VERSION=1.1.0-r4
ARG BASH_VERSION=5.2.21-r0
ARG BUN_VERSION=1.0.26
ARG CURL_VERSION=8.5.0-r0


FROM alpine:${ALPINE_VERSION}@${ALPINE_HASH}

ARG ALPINE_GLIBC_REPO
ARG ALPINE_GLIBC_VERSION
ARG BASH_VERSION
ARG BUN_VERSION
ARG CURL_VERSION
ARG GCOMPAT_VERSION

RUN apk add --no-cache \
      bash=${BASH_VERSION} \
      curl=${CURL_VERSION}

RUN apk add --virtual .build_deps --no-cache gcompat=${GCOMPAT_VERSION} \
 && curl -fsSL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
 && curl -fsSLO ${ALPINE_GLIBC_REPO}/${ALPINE_GLIBC_VERSION}/glibc-${ALPINE_GLIBC_VERSION}.apk \
 && apk add --force-overwrite --no-cache glibc-${ALPINE_GLIBC_VERSION}.apk \
 && apk del gcompat \
 && curl -fsSLO ${ALPINE_GLIBC_REPO}/${ALPINE_GLIBC_VERSION}/glibc-bin-${ALPINE_GLIBC_VERSION}.apk \
 && apk add --no-cache glibc-bin-${ALPINE_GLIBC_VERSION}.apk \
# && curl -fsSLO ${ALPINE_GLIBC_REPO}/${ALPINE_GLIBC_VERSION}/glibc-i18n-${ALPINE_GLIBC_VERSION}.apk \
# && apk add --no-cache glibc-i18n-${ALPINE_GLIBC_VERSION}.apk \
 && rm glibc-${ALPINE_GLIBC_VERSION}.apk \
 && rm glibc-bin-${ALPINE_GLIBC_VERSION}.apk \
# && rm glibc-i18n-${ALPINE_GLIBC_VERSION}.apk \
 && apk del .build_deps

# hadolint ignore=DL4006
RUN curl -fsSL https://bun.sh/install | bash -s "bun-v${BUN_VERSION}" \
 && ln -s /root/.bun/bin/bun /usr/local/bin/bun

WORKDIR /opt/contrib

COPY src/ .

RUN bun install

EXPOSE 8080

ENTRYPOINT ["bun"]
CMD ["x", "@11ty/eleventy", "--serve"]
