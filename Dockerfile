FROM alpine:latest
ENV ENV="/etc/profile"
ENV WORKDIR /app
WORKDIR ${WORKDIR}
RUN apk add --update --no-cache \
      pjsua \
 && echo "export PATH=\"${WORKDIR}:${PATH}\"" > /etc/profile.d/pjsua-path.sh \
 && chmod +x /etc/profile.d/pjsua-path.sh \
 && rm -rf /var/cache/apk/* \
           /tmp/* \
           /var/tmp/*
COPY . .
ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["./help"]
