FROM ubuntu:20.04 AS base
RUN apt update \
    && apt upgrade -y

FROM base AS packages
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        dnsutils \
        gcc \
        git \
        iputils-ping \
        jq \
        libdigest-sha-perl \
        make \
        net-tools \
        inetutils-traceroute \
        vim \
        wget \
        && rm -rf /var/lib/apt/lists/*
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt update \
    && apt install -y kubectl \
    && rm -rf /var/lib/apt/lists/*
RUN curl -L https://carvel.dev/install.sh | bash

FROM packages AS customized
COPY vimrc /root/.vimrc
CMD ["sleep", "604800"]
