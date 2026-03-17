# Kushify Docker

Dev environment for the Kushify platform. Clones both repos, runs Vite dev servers with hot reload, and serves everything behind nginx.

## Prerequisites

- Docker
- SSH key with access to both GitHub repos

## Setup

```bash
git clone git@github.com:npaul429/kushify-docker.git
cd kushify-docker
./setup.sh
docker compose up --build
```

- **Pitch Deck**: http://localhost
- **Card Game**: http://localhost/play/

## Update to Latest Code

```bash
./setup.sh
docker compose up --build
```

`setup.sh` runs `git pull` on both repos if they already exist.

## How It Works

```
nginx (port 80)
├── /       → web-main (Vite dev server, port 3000) — pitch deck
└── /play/  → web-play (Vite dev server, port 3001) — card game
```

Source code is volume-mounted from `app-main/` and `app-play/` into the containers. Edit files on your host and changes appear instantly via hot reload.

## Stopping

```bash
docker compose down
```
