#!/bin/bash

if [[ ! -L /etc/ssh/ssh_host_rsa_key ]]
then
  rm -f /etc/ssh/ssh_host*
fi

if [[ ! -f /etc/ssh/keys/ssh_host_rsa_key ]]
then
  ssh-keygen -A
  mv /etc/ssh/ssh_host* /etc/ssh/keys
fi

if [[ ! -L /etc/ssh/ssh_host_rsa_key && -f /etc/ssh/keys/ssh_host_rsa_key ]]
then
  ln -s /etc/ssh/keys/ssh_host* /etc/ssh/
fi

exec /usr/sbin/sshd -D
