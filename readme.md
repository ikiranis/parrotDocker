# Parrot

A Spring Boot app (Java 21) that serves and thumbnails a photo library, backed by an embedded Derby database. Runs in Docker via Docker Compose.

## Prerequisites

- Docker and Docker Compose
- A directory of photos to serve (mounted into the container)

## Configuration

Edit [docker-compose.yml](docker-compose.yml) before first run:

- **Photo source** — the first volume maps your photo directory into the container at `/media/photos`. Change the host path to point at your library:

  ```yaml
  volumes:
    - /your/photo/path:/media/photos
  ```

- **Port** — the app is published on host port `8888` (mapped to container port `9999`).
- **Timezone** — the image is built with `TZ=Europe/Athens` (see [Dockerfile](Dockerfile)).

The `./db` and `./thumbnails` directories are bind-mounted for persistent Derby data and generated thumbnails.

## Install & run

Build and start in the background:

```sh
docker compose up -d --build
```

Stop:

```sh
docker compose down
```

View logs:

```sh
docker compose logs -f
```

## Enter the container

```sh
docker exec -it parrot-docker-app /bin/sh
```

## Access

Once running, the API is available at:

```text
http://localhost:8888/
```
