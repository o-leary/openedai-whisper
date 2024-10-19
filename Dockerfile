FROM nvidia/cuda:11.8.0-base-ubuntu22.04

RUN apt-get update && apt-get install --no-install-recommends -y ffmpeg python-is-python3 python3-pip git nano

#RUN git clone https://github.com/matatonic/openedai-whisper /app
RUN mkdir -p /app
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY *.py /app/

RUN <<EOF
git clone https://github.com/rhasspy/wyoming-faster-whisper.git
cd wyoming-faster-whisper
script/setup
cd ..
EOF
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
CMD bash startup.sh
