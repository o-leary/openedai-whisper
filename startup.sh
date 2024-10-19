#!/bin/bash
cd wyoming-faster-whisper
script/run --model tiny-int8 --language en --uri 'tcp://0.0.0.0:10300' --data-dir /data --download-dir /data &
cd ..
python whisper.py
