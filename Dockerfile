# FROM ubuntu:20.04
FROM nvidia/opengl:1.1-glvnd-devel-ubuntu20.04

WORKDIR /home/steam/

MAINTAINER Xian

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/archive\.ubuntu\.com/tw.archive.ubuntu.com/' /etc/apt/sources.list
RUN apt-get update && apt-get -y install software-properties-common wget pulseaudio && \
    dpkg --add-architecture i386 && \
    add-apt-repository -y multiverse && \
    apt-get update && \
    apt-get -y install lib32gcc1 pciutils sudo && \
    wget "https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb" && \
    apt-get install -y language-pack-en language-pack-zh-hant language-selector-common && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        $(check-language-support) \
        pkg-config \
        libxau-dev \
        libxdmcp-dev \
        libxcb1-dev \
        libxext-dev \
        libx11-dev \
        libcurl4 \
        libglvnd0 libgl1 libglx0 libegl1 \
        libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev \
        libxext6 libx11-6 \
        xdg-desktop-portal \
        xdg-desktop-portal-gtk \
        dbus-x11 \
        libgl1-mesa-dri:i386 \
        libgl1:i386 \
        libc6:i386 && \
    apt-get update && \
    apt-get install -y -f --install-recommends ./steam.deb && \
    rm -rf steam.deb /var/lib/apt/lists/*

ENV PULSE_SERVER=unix:/tmp/pulseaudio.socket
ENV PULSE_COOKIE=/tmp/pulseaudio.cookie
ENV LANG=en_US.UTF-8

COPY client.conf /etc/pulse/client.conf
COPY init /root/init

ARG USER_UID=1000
ARG USER_GID=1000

ENV USER_UID=${USER_UID}
ENV USER_GID=${USER_GID}

RUN groupadd -r -g ${USER_GID} steam && useradd -u ${USER_UID} --no-log-init -r -g steam steam && \
    chown -R steam:steam .

ENV USER_UID=
ENV USER_GID=

ENTRYPOINT [ "/root/init" ]
CMD [ "steam" ]
