# robert

Docker based utility to convert audio files (mp3, m4a, wma) to the required audio format of Hörbert.

## Description

The [Hörbert](https://www.hoerbert.com/) audio player requires a specific WAV format (32khz, 16bit, Mono) and file name (0.WAV, 1.WAV, ...) to play an audio file on this device. This Docker based utility converts audio files (mp3, m4a, wma) to the required audio format.

## Usage

```sh
$ docker run -it \
   -v /YOUR_LOCAL/PATH/TO_INPUT_DIRECTORY:/input \
   -v /YOUR_LOCAL/PATH/TO_OUTPUT_DIRECTORY:/output \
   maveonair/robert
```
