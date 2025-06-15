#!/bin/bash -x
#OS: linux, darwin, windows
#Arch: amd64, arm, arm64, ppc64
repo_name="europe-west3-docker.pkg.dev/robotic-weft-462808-a2/k8s-learn"
version="v1.0.4"
app_name="kbot"
if [ "$#" -ne 2 ]; then
   echo "Usage: build.sh TargetOS TargetArch"
   exit 1
fi

TrgtOS=$1
TrgtArch=$2
#image_name="${repo_name}/${app_name}_${TrgtOS}_${TrgtArch}:${version}"
image_name="${repo_name}/${app_name}:${version}"

#export TargetOS=$TrgtOS
#export TargetArch=$TrgtArch

docker build --build-arg TargetOS=$TrgtOS --build-arg TargetArch=$TrgtArch -t ${image_name} .
