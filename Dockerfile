FROM ubuntu:20.04

######################
# Prerequisites
#######################
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -yq \

    # gnupg requirement
    dirmngr \
    gnupg \

    # curl requirement
    ca-certificates \
    curl \

    # google-cloud-sdk requirement
    lsb-release \

    # useful utilities for debugging within the docker
    unzip \
    nano \
    vim \
    procps \

    # python requirements
    checkinstall \
    build-essential \
    zlib1g-dev \

    # pip requirements
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \

    # install script requirements
    sudo \
    wget \
    locales \
    git \

    # openjdk 11
    default-jre \
    default-jdk

#######################
## Install Conda
########################
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
  && chmod +x /tmp/miniconda.sh && bash /tmp/miniconda.sh -b -p /tmp/miniconda

# make non-activate conda commands available
ENV PATH=/tmp/miniconda/bin:$PATH
# # make conda activate command available from /bin/bash --login shells
RUN echo ". /tmp/miniconda/etc/profile.d/conda.sh" >> ~/.profile
# # make conda activate command available from /bin/bash --interative shells
RUN conda init bash
