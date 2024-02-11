ARG ALPINE_VERSION=3.19.1
ARG ALPINE_HASH=sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

ARG EZA_VERSION=0.16.2-r0


###
### context
###
FROM alpine:${ALPINE_VERSION}@${ALPINE_HASH} AS context

ARG EZA_VERSION

RUN apk add --no-cache eza=${EZA_VERSION}

WORKDIR /opt/mnesi.ac

COPY . .

ENTRYPOINT ["eza"]
CMD ["--all", "--tree", "--level=10", "--icons"]
