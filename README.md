# docker-distro-ssh

### description

run container
```bash
docker run -d -p 2222:22 ccy1219/docker-distro-ssh:ubuntu-18.04
```

build image
```bash
./build_image.sh DOCKERFILE=Dockerfile.ubuntu-18.04 IMAGE_TAG=test123 ARG_PASSWD=pass123

./build_image.sh DOCKERFILE=Dockerfile.ubuntu-18.04 IMAGE_TAG=test123 ID_RSA=~/.ssh/id_rsa ID_RSA_PUB=~/.ssh/id_rsa.pub

./build_image.sh DOCKERFILE=Dockerfile.ubuntu-18.04 IMAGE_TAG=test123 ARG_PASSWD=pass123 ID_RSA=~/.ssh/id_rsa ID_RSA_PUB=~/.ssh/id_rsa.pub
```
