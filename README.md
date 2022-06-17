# Traefik error server

Make your traefik error pages look good 💅

## Prerequisites

- [Docker Engine](https://docs.docker.com/engine/) should be available in your system.
- some familiarity with [traefik](https://traefik.io/traefik/).
- [Docker-compose](https://docs.docker.com/compose/) should be available on your system.

## Installation

```bash
git clone https://github.com/abdirahmn1/traefik-error-server.git
cd traefik-errorserver
docker build -t traefik-errorserver .
docker-compose up -d
```

## Deployment

Add the `error` middleware to your services behind traefik.

An example of a service that may use the error middleware is shown below.

```yaml
services:
  nginx:
    container_name: nginx
    image: nginx
    networks:
      - proxy
    labels:
      - "traefik.enable= true"
      - "traefik.http.routers.nginx-router.rule= Host(`nginx.mydomain`)"
      # Replace `web` with whatever you :80 entrypoint name is.
      - "traefik.http.routers.nginx-router.entrypoints=web"
      - "traefik.http.routers.nginx-router.middlewares=error-pages-middleware@docker"
      - "traefik.http.routers.nginx-router.service=nginx"
      - "traefik.http.services.nginx.loadbalancer.server.port=80"

networks:
  proxy:
    external: true
```
