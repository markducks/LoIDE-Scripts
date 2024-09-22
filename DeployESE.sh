#!/bin/bash

#CONFIG_PATH_ESE is the path to the configuration folder of the ESE.
#LOGS_PATH_ESE is the path to the log file of the ESE.
BASE_PATH=""
CONFIG_PATH_ESE="$BASE_PATH/ese/config/config_files"
LOGS_PATH_ESE="$BASE_PATH/ese/logs/ese.log"

# Pull and run the latest version of the ESE
docker pull loideunical/loide:ese
nohup docker run --network host --mount type=bind,source=$CONFIG_PATH_ESE,target=/config_files --privileged=true --restart=always --name ese loideunical/loide:ese >> $LOGS_PATH_ESE 2>&1 &