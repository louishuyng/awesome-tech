FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y gcc python2-dev libkrb5-dev && \
    apt-get install python3-pip -y && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade virtualenv && \
    pip3 install pywinrm && \
    pip3 install kerberos && \
    pip3 install boto3 && \
    pip3 install boto && \
    apt install krb5-user -y && \
    pip3 install ansible && \
    pip3 install "pywinrm>=0.3.0" && \
    apt install openssh-server openssh-client -y && \
    apt install sshpass -y && \
    ansible-galaxy collection install amazon.aws
