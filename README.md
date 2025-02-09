# Creating a Docker Rootless Mode Image

Kaniko is currently not maintained, and has important limitations

docker build uses Buildx and BuildKit by default since Docker Engine 23.0

# MacOS Requirements

MacOS Docker Desktop cannot build an image with a Docker rootless mode setup

It uses a "LinuxKit" VM that doesn't have the necessary Linux kernel modules. See: https://medium.com/@notsinge/making-your-own-linuxkit-with-docker-for-mac-5c1234170fb1 

You need to run docker build in a VM with Debian/Ubuntu in order to build the initial Dockerfile.

# Quickstart

If you're on mac, from the Linux VM:

```
docker build --no-cache --progress=plain -t rootless-docker-debian -f Dockerfile.debian2 .

docker run -rm -it rootless-docker-debian /bin/sh

    rootlesskit --version
    docker buildx version
```

# End Result

The resulting image is able to run docker build in a CI pipeline without root privileges inside kubernetes/ecs fargate
```
docker buildx create --name mybuilder --use

docker buildx build \
--builder mybuilder \
--platform linux/amd64 \
--file Dockerfile \
--tag example:${COMMIT_HASH} \
--push
```

# Documentation

https://docs.docker.com/engine/security/rootless/

https://docs.docker.com/build/builders/manage/