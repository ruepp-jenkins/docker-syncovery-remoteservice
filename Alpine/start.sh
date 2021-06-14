#!/bin/bash
echo 
echo "OS Date: $(date)"

if ! id -u $SSH_USERNAME > /dev/null 2>&1; then
    echo "adding ssh user"

    if [ "${SSH_USERNAME}" = "default"]; then
        echo "for security reasons username default is not allowed - please check your docker environment variables!"
        echo "no user was created"
    else
        useradd -r -s /bin/bash -g root -G sudo $SSH_USERNAME
        echo "${SSH_USERNAME}:${SSH_PASSWORD}" | chpasswd
        echo "user ${SSH_USERNAME} successfully created"
    fi
fi

echo "starting ssh service"
service ssh start

echo "starting syncovery remote service"
/syncovery/SyncoveryRS