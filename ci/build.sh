#!/bin/bash

set -e -x

pushd source-code
mvn clean package
popd
if [ -f source-code/target/*.war ]; then
artifact=$(basename source-code/target/*.war)
cp source-code/target/$artifact  build-output/.
curl -u admin:password -X PUT http://192.168.115.152/artifactory/def-temp/random/$artifact -T source-code/target/$artifact
else
artifact=$(basename source-code/target/*.jar)
 cp source-code/target/$artifact  build-output/.
 curl -u admin:password -X PUT http://192.168.115.152/artifactory/def-temp/random/$artifact -T source-code/target/$artifact
fi
