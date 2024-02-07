#!/bin/bash

# Pull and run the latest version of the ESE
# ADD THE PATH TO THE CONFIGURATION FOLDER IN THE --mount OPTION
sudo docker pull loideunical/loide:ese
sudo docker run -d --network host --mount type=bind,source=,target=/app/config --privileged=true --restart=always loideunical/loide:ese

# Save the logs of ESE
sudo docker logs -f -t loideunical/loide:ese >& loide/ese/logs/ese-logs.log