FROM ubuntu

ARG INPUT_STREAM_FROM
ARG OUTPUT_FILE="snapshot.jpg"
ENV INPUT_STREAM=${INPUT_STREAM_FROM}
ENV OUTPUT_FILE=${OUTPUT_FILE}

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y ffmpeg

WORKDIR /src

SHELL ["/bin/bash", "-c"]
CMD ffmpeg -loglevel debug -y -rtsp_transport tcp -i $INPUT_STREAM -vf "select='not(mod(n,90))',setpts='N/(30*TB)'" -update 1 -f image2 $OUTPUT_FILE