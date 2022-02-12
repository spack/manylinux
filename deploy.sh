#!/bin/bash
tag="quay.io/pypa/${POLICY}_poc_${PLATFORM}"
build_id=$(git show -s --format=%cd-%h --date=short ${COMMIT_SHA})

docker login -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
docker tag ${tag}:${COMMIT_SHA} ${tag}:poc
docker push ${tag}:poc
