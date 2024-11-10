#!/bin/sh

docker build --build-arg OUTPUT_FILE=$OUTPUT_FILE --build-arg INPUT_STREAM_FROM=$INPUT_STREAM -f snapshotserver.Dockerfile -t snapshotserver .