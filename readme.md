# Parrot

A Spring Boot app (Java 21) that serves and thumbnails a photo library, backed by an embedded Derby database. Runs in Docker via Docker Compose.

## Prerequisites

- Docker and Docker Compose
- A directory of photos to serve (mounted into the container)

## Configuration

Copy the sample env file and edit it before first run:

```sh
cp .env.sample .env
```

[.env](.env.sample) holds the settings Compose reads at startup:

- **`HOST_PORT`** — host port the app is published on (mapped to container port `9999`). Defaults to `8888`.
- **`PHOTOS_PATH`** — host path to the photo library, mounted into the container at `/media/photos`.

`.env` is gitignored; commit changes to [.env.sample](.env.sample) instead.

The image is also built with `TZ=Europe/Athens` (see [Dockerfile](Dockerfile)). The `./db` and `./thumbnails` directories are bind-mounted for persistent Derby data and generated thumbnails.

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

Once running, the API is available on the port set in `HOST_PORT` (default `8888`):

```text
http://localhost:8888/
```
