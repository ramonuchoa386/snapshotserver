#!/bin/sh

docker run -d --env-file=./.env --name snapshotserver snapshotserver