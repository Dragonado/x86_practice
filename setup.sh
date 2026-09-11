#!/bin/sh
set -eu

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker Desktop is required: https://www.docker.com/products/docker-desktop/"
  echo "After installing it, enable 'Use Rosetta for x86/amd64 emulation' in Settings > General."
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "Docker Desktop is installed but not running. Start it and rerun ./setup.sh."
  exit 1
fi

machine=$(uname -m)
if [ "$machine" = "arm64" ]; then
  echo "Apple Silicon detected. Confirm Docker Desktop > Settings > General > Use Rosetta for x86/amd64 emulation is enabled."
fi

echo "Building the amd64 learning image..."
docker compose build
echo "Running the smoke test..."
docker compose run --rm x86-harness ./src/00-hello/test.sh solution
echo "Setup complete. Try: make run MODULE=00-hello"
