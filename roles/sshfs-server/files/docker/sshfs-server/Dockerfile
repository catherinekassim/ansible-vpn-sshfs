FROM alpine
RUN apk add --update --no-cache openssh openssh-sftp-server
RUN apk add --update --no-cache bash
COPY run.sh /run.sh
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
RUN rm -f /etc/ssh/ssh_host*

# TODO: http://www.psc.edu/index.php/hpn-ssh

VOLUME /etc/ssh/keys
#VOLUME /root/.ssh/authorized_keys
VOLUME /data
EXPOSE 22
CMD /bin/bash /run.sh
