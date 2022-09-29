docker stop $(docker ps -a -q)
docker rm -v -f $(docker ps -a -f status=exited -q)
docker rmi -f $(docker images -a -q)