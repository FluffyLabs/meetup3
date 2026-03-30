#!/usr/bin/env bash
set -euo pipefail

IMAGE="meetup3"
CONTAINER="meetup3"

echo "Building image..."
docker build -t "$IMAGE" .

echo "Stopping previous container..."
docker rm -f "$CONTAINER" 2>/dev/null || true

echo "Starting new container..."
docker run -d \
  --name "$CONTAINER" \
  --env-file .env \
  -v "$(pwd)/data:/app/data" \
  -p 3000:3000 \
  --restart unless-stopped \
  "$IMAGE"

echo "Running: $(docker ps --filter name=$CONTAINER --format '{{.ID}} {{.Status}}')"
