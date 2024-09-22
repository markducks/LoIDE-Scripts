#!/bin/bash

CONFIG_PATH_ESE=""
LOGS_PATH_ESE=""

# Pull and run the latest version of the ESE
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
sudo docker pull loideunical/loide:ese
nohup docker run --network host --mount type=bind,source=CONFIG_PATH_ESE,target=/config_files --privileged=true --restart=always --name ese loideunical/loide:ese >> LOGS_PATH_ESE 2>&1 &