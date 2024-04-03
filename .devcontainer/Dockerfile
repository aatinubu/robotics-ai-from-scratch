FROM ros:humble
ARG USERNAME=ghost
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        python3-pip \
        git \
        build-essential \
        clang \
        cmake \
        gdb \
        wget \
        curl \
        nano \
        openssh-client \
        libopencv-dev \
        libpcl-dev \
        iputils-ping \
        net-tools \
        clang-format \
        cppcheck \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL /usr/bin/zsh

USER $USERNAME