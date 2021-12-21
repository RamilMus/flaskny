#!/bin/bash

echo "\\n           \033[1;31mStopping container\\n"
sleep 3
docker stop First_Flask_app
docker stop First_Flask_appp
echo "\\n           Deleting all containers\\n"
sleep 3
docker rm $(docker ps -qa)
echo "\n           Deleting image\\n"
sleep 3
docker rmi name pyt_app
echo "\\n           \033[1;34mBuilding image\\n"
docker build -t pyt_app .
echo "\n"
echo "          \033[1;32mIMAGE HAS BEEN BUILT, STARTING CONTAINER
          open http://0.0.0.0:8080/ in your browser\033[0m"

docker run --name First_Flask_appp -it -p 8080:8080 pyt_app