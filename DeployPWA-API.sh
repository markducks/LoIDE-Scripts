#!/bin/bash

# CONFIG_PATH_API and CONFIG_PATH_PWA are the paths to the configuration folders of the API and PWA, respectively.
# LOGS_PATH_API and LOGS_PATH_PWA are the paths to the log files of the API and PWA, respectively.
# API_SERVER is the IP address of the API server.
BASE_PATH=""
CONFIG_PATH_API="$BASE_PATH/api/config"
LOGS_PATH_API="$BASE_PATH/api/logs/api.log"
CONFIG_PATH_PWA="$BASE_PATH/pwa/config"
LOGS_PATH_PWA="$BASE_PATH/pwa/logs/pwa.log"
API_SERVER=""

# Pull and run the latest version of the API
docker pull loideunical/loide:api
nohup docker run --network host --mount type=bind,source=$CONFIG_PATH_API,target=/app/config --restart=always --name api loideunical/loide:api >> $LOGS_PATH_API 2>&1 &

# Pull and run the latest version of the PWA
docker pull loideunical/loide:pwa
nohup docker run --network host --env REACT_APP_LOIDE_API_SERVER=$API_SERVER --mount type=bind,source=$CONFIG_PATH_PWA,target=/app/config --restart=always --name pwa loideunical/loide:pwa >> $LOGS_PATH_PWA 2>&1 &