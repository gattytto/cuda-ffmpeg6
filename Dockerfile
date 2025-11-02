FROM nvcr.io/nvidia/cuda:13.0.0-devel-ubuntu24.04
RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntuhandbook1/ffmpeg6 && \
    add-apt-repository ppa:deadsnakes/ppa && \
    find /etc/apt/sources.list.d/ -name "*handbook1*" -exec sed -i 's/noble/focal/g' {} \; && \
    apt update && \
    apt install -y python3.11 \
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
                    libswscale-dev && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    mkdir -p /usr/share/espeak-ng-data &&  \
    ln -s /usr/lib/*/espeak-ng-data/* /usr/share/espeak-ng-data/ 
