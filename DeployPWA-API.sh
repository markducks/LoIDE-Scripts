#!/bin/bash

# CONFIG_PATH_API and CONFIG_PATH_PWA are the paths to the configuration folders of the API and PWA, respectively.
# LOGS_PATH_API and LOGS_PATH_PWA are the paths to the log files of the API and PWA, respectively.
# API_SERVER is the IP address of the API server.
BASE_PATH=""
CONFIG_PATH_API="LoIDE_data/api/config"
LOGS_PATH_API="LoIDE_data/api/logs"
CONFIG_PATH_PWA="LoIDE_data/pwa/config"
LOGS_PATH_PWA="LoIDE_data/pwa/logs"
API_SERVER=""

# Pull and run the latest version of the API
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
docker pull loideunical/loide:api
nohup docker run --network host --mount type=bind,source=$BASE_PATH/$CONFIG_PATH_API,target=/app/config --restart=always --name api loideunical/loide:api >> $BASE_PATH/$LOGS_PATH_API 2>&1 &

# Pull and run the latest version of the PWA
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
docker pull loideunical/loide:pwa
nohup docker run --network host --env REACT_APP_LOIDE_API_SERVER=API_SERVER --mount type=bind,source=$BASE_PATH/$CONFIG_PATH_PWA,target=/app/config --restart=always --name pwa loideunical/loide:pwa >> $BASE_PATH/$LOGS_PATH_PWA 2>&1 &

