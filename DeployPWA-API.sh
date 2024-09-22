#!/bin/bash

# Pull and run the latest version of the API
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
nohup docker run --network host --mount type=bind,source=/home/marco/Desktop/API-config/config,target=/app/config --name api loideunical/loide:api >> loide/api/logs/api-logs.log 2>&1 &

# Pull and run the latest version of the PWA
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
nohup docker run --network host --env REACT_APP_LOIDE_API_SERVER="" --mount type=bind,source=/home/marco/Desktop/PWA-config/config,target=/app/config --name pwa loideunical/loide:pwa >> loide/pwa/logs/pwa-logs.log 2>&1 &
