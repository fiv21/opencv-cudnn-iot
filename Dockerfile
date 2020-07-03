FROM datamachines/cudnn_tensorflow_opencv:10.2_2.2.0_4.3.0-20200615
RUN apt-get update && \
    apt-get install -y \
        libcurl4-openssl-dev \
        libboost-python-dev \
        libgtk2.0-dev \
        libglib2.0-0
RUN apt-get install -y build-essential cmake \
        libopenblas-dev gcc unixodbc-dev python3-dev \
        liblapack-dev librdkafka-dev python-dev

ENV TZ 'America/Argentina/Buenos_Aires'

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean
