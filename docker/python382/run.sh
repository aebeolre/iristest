#!/bin/bash

# usage
SCRIPT_FILE=`basename $0`
function usage()
{
  echo "usage: ${SCRIPT_FILE} docker/nvidia-docker" 1>&2
}

# arguments
if [ $# -ne 1 ]; then
  usage
  exit 1
fi
DOCKER_CMD=$1

# constant
CONTAINER_NAME=iristest
CONTAINER_IMAGE=iristest
HOST_PORT_IPYNB=28888
CONTAINER_PORT_IPYNB=8888
HOST_PORT_KV=24141
CONTAINER_PORT_KV=4141

# main
${DOCKER_CMD} run --name ${CONTAINER_NAME} \
  --privileged \
  --entrypoint bash \
  -v $(pwd)/../../:/opt/iristest/ \
  -p ${HOST_PORT_IPYNB}:${CONTAINER_PORT_IPYNB} \
  -p ${HOST_PORT_KV}:${CONTAINER_PORT_KV} \
  -it ${CONTAINER_IMAGE}
