#!/bin/bash

# apt-get update first
apt-get update -y

# install openssh-server
apt-get install -y openssh-server
mkdir -p /var/run/sshd

# allow root to login
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

if [ -f /runtime_data/arg_passwd ]
then
    # set pre-defined root password
    echo "root:$(cat /runtime_data/arg_passwd)" |chpasswd
fi

if [ -f /runtime_data/id_rsa ]
then
    # set pre-defined key file
    mkdir -p /root/.ssh/
    mv /runtime_data/id_rsa /root/.ssh/id_rsa
    mv /runtime_data/id_rsa.pub /root/.ssh/id_rsa.pub

    chmod 600 /root/.ssh/id_rsa
    chmod 644 /root/.ssh/id_rsa.pub
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
fi


