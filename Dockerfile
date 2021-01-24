FROM ubuntu:18.04

LABEL maintainer="ccy1219@gmail.com"

COPY ["/runtime_data/","/runtime_data/"]

RUN chmod +x /runtime_data/set_sshd.sh \
    && /runtime_data/set_sshd.sh \
    && rm /runtime_data/set_sshd.sh

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
