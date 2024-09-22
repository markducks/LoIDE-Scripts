#!/bin/bash

CONFIG_PATH_PWA=""
CONFIG_PATH_API=""
LOGS_PATH_PWA=""
LOGS_PATH_API=""
API_SERVER=""

# Pull and run the latest version of the API
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
docker pull loideunical/loide:pwa
nohup docker run --network host --mount type=bind,source=CONFIG_PATH,target=/app/config --restart=always --name api loideunical/loide:api >> LOGS_PATH_PWA 2>&1 &

# Pull and run the latest version of the PWA
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
docker pull loideunical/loide:pwa
nohup docker run --network host --env REACT_APP_LOIDE_API_SERVER=API_SERVER --mount type=bind,source=CONFIG_PATH,target=/app/config --restart=always --name pwa loideunical/loide:pwa >> LOGS_PATH_API 2>&1 &

