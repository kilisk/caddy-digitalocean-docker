# Build Caddy image with DigitalOcean DNS module
FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean@master
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
