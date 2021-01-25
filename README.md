# Dockerized SSH service for different distros

## Description

針對不同的Distro (Debian-based for now) 版本，提供容器化的 SSH Service。 

### Pull Images

```bash
docker pull ccy1219/docker-distro-ssh:ubuntu-16.04
docker pull ccy1219/docker-distro-ssh:ubuntu-18.04
docker pull ccy1219/docker-distro-ssh:ubuntu-20.04
docker pull ccy1219/docker-distro-ssh:debian-9.13
docker pull ccy1219/docker-distro-ssh:debian-10.6
```

### SSH Login information:
- account: root
- password: RootPassWord

###  Run container
```bash
export SSH_DOCKER_TAG="ubuntu-18.04"
export SSH_DOCKER_PORT=2222

docker run -d -p $SSH_DOCKER_PORT:22 ccy1219/docker-distro-ssh:$SSH_DOCKER_TAG
```

###  Build image locally
```bash
export SSH_DOCKER_FILE="Dockerfile.ubuntu-18.04"
export SSH_DOCKER_PASSWD="RootPassWord"
export SSH_DOCKER_TAG="ssh-docker-ubuntu1804"
export SSH_DOCKER_PRIVATE_KEY="./.ssh/id_rsa"
export SSH_DOCKER_PUBLIC_KEY="./.ssh/id_rsa.pub"

# build with pre-defined password
./build_image.sh DOCKERFILE=$SSH_DOCKER_FILE IMAGE_TAG=$SSH_DOCKER_TAG ARG_PASSWD=$SSH_LOGIN_PASSWD

# build with pre-defined key files
./build_image.sh DOCKERFILE=$SSH_DOCKER_FILE IMAGE_TAG=$SSH_DOCKER_TAG ID_RSA=$SSH_DOCKER_PRIVATE_KEY ID_RSA_PUB=$SSH_DOCKER_PUBLIC_KEY

# build with pre-defined p and asswordkey files
./build_image.sh DOCKERFILE=$SSH_DOCKER_FILE IMAGE_TAG=$SSH_DOCKER_TAG ARG_PASSWD=pass123 ID_RSA=$SSH_DOCKER_PRIVATE_KEY ID_RSA_PUB=$SSH_DOCKER_PUBLIC_KEY
```

## Link

[Dockerfile from GitHub](https://github.com/ccy1219/docker-distro-ssh)

[Docker Images from Docker Hub](https://hub.docker.com/r/ccy1219/docker-distro-ssh)
