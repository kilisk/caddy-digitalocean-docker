# Build Caddy image with DigitalOcean DNS module
FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean@master

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
