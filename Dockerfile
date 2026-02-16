FROM nvcr.io/nvidia/cuda:13.0.0-devel-ubuntu24.04
RUN apt update && apt install -y curl && \
    curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg && \
    install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg && \
    gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806 && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntuhandbook1/ffmpeg6 && \
    add-apt-repository ppa:deadsnakes/ppa && \
    find /etc/apt/sources.list.d/ -name "*handbook1*" -exec sed -i 's/noble/focal/g' {} \; && \
    apt update && \
    apt install -y conda \
                    python3.11 \
                    python3.11-dev \
                    python3-dev \
                    build-essential \
                    pkg-config \
                    python3-venv \
                    espeak-ng \
                    espeak-ng-data \
                    git \
                    libsndfile1 \
                    curl \
                    g++  \
                    ffmpeg \
                    libavcodec-dev \
                    libavdevice-dev \
                    libavfilter-dev \
                    libavformat-dev \
                    libavutil-dev \
                    libswresample-dev \
                    git-lfs sox libsox-dev zip unzip \
                    libswscale-dev && \
    git lfs install && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /usr/share/espeak-ng-data &&  \
    ln -s /usr/lib/*/espeak-ng-data/* /usr/share/espeak-ng-data/ 
