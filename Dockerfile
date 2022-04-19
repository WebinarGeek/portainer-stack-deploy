FROM alpine

COPY "entrypoint.sh" "/entrypoint.sh"
RUN apk -U upgrade && \
    apk -U --no-cache add curl jq bash ca-certificates && \
    update-ca-certificates --fresh
ENTRYPOINT ["bash", "/entrypoint.sh"]
