#!/bin/bash

# Pull and run the latest version of the PWA
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
sudo docker pull loideunical/loide:pwa
sudo docker run -d --network host --env REACT_APP_LOIDE_API_SERVER="" --mount type=bind,source=,target=/app/config --restart=always loideunical/loide:pwa

# Save the logs of PWA
sudo docker logs -f -t loideunical/loide:pwa >& loide/pwa/logs/pwa-logs.log

# Pull and run the latest version of the API
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
sudo docker pull loideunical/loide:api
sudo docker run -d --network host --mount type=bind,source=,target=/app/config --restart=always loideunical/loide:api

# Save the logs of API
sudo docker logs -f -t loideunical/loide:api >& loide/api/logs/api-logs.log
