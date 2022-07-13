#!/bin/bash
# Start Jupyter via container

#  Notice:
#  -------
#  This script invokes `docker run` to start a container
#+ running Jupyter Notebook on port 10735.
#  Current folder will be attached as a volume, which will
#+ be Jupyter's workspace. Container will be removed on stop.
#  Save data on shared volume, else it will be deleted.

docker run -it --rm \
--name notebook \
-p 10735:8888 \
-e DOCKER_STACKS_JUPYTER_CMD=notebook \
-v "${PWD}":"/home/jovyan/${PWD##*/}" jupyter/minimal-notebook:latest