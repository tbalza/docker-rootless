# Creating a Docker Rootless Mode Image

Kaniko is currently not maintained, and has important limitations

docker build uses Buildx and BuildKit by default since Docker Engine 23.0

MacOS docker desktop cannot build an image with a Docker rootless setup

It uses a "LinuxKit" VM that doesn't have the necessary Linux kernel modules. See: https://medium.com/@notsinge/making-your-own-linuxkit-with-docker-for-mac-5c1234170fb1 

You need to run docker in a VM with Debian/Ubuntu in order to build the Dockerfile.

https://docs.docker.com/engine/security/rootless/

https://docs.docker.com/build/builders/manage/

