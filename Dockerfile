FROM --platform=arm64 ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc mono-mcs && \
    apt-get install -y git && \
    apt-get install -y make \
    build-essential \
    gcc \
    g++ \
    gdb \
    clang \
    cmake \
    rsync \
    curl \
    tar \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y python3.11 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Set up llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp && \
    cd llama.cpp && \
    make && \
# install Python dependencies
    pip install -r requirements.txt 

# get the models
ARG HF_REPO
ARG MODEL
ENV MODEL=${MODEL}
ENV HF_REPO=${HF_REPO}

# install huggingface downloader
RUN pip install huggingface-hub
RUN cd llama.cpp/models && \
    # huggingface-cli download TheBloke/Llama-2-7b-Chat-GGUF llama-2-7b-chat.Q4_K_M.gguf --local-dir . --local-dir-use-symlinks False
    huggingface-cli download ${HF_REPO} ${MODEL} --local-dir . --local-dir-use-symlinks False

# Installing Node
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 18

# run model
RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.39.5/install.sh | bash \
    && echo ". $NVM_DIR/nvm.sh" >> ~/.bashrc \
    && . ~/.bashrc \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION 

RUN . $NVM_DIR/nvm.sh \
    && git clone https://github.com/keldenl/gpt-llama.cpp.git \
    && cd gpt-llama.cpp \
    && npm install 

# Set the working directory to gpt-llama.cpp
WORKDIR /gpt-llama.cpp

#set the port to expose
ARG PORT
ENV PORT=${PORT}
CMD ["/bin/bash", "-c", ". $NVM_DIR/nvm.sh && npm start"]