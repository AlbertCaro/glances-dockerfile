# Glances Dockerfile
I discovered that the official Glances Docker container couldn't run on ARM architectures, which is what my Raspberry Pi uses. So, I whipped up this Dockerfile to make it compatible with my home-based Docker infrastructure.

## Usage examples
Docker run:
```
# Build the Dockerfile into an image
docker build -t simple-glances .

# Launch a container using this image
docker run -d \
  --name glances \
  --restart=always \
  --network host \
  --pid host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /etc/os-release:/etc/os-release:ro \
  -v /etc/hostname:/etc/hostname:ro \
  simple-glances
```

Docker compose:
```
version: '3'

services:
  glances:
    build:
      context: .
    container_name: glances
    restart: always
    network_mode: host
    pid: host # Required for displaying all host processes correctly
    volumes: # Volumes required to display host OS information instead of container's info
      - /var/run/docker.sock:/var/run/docker.sock
      - /etc/os-release:/etc/os-release:ro
      - /etc/hostname:/etc/hostname:ro
```
