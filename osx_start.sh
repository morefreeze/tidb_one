#!/bin/bash
ROOT_PATH=$(dirname $0)
echo "Build may cost a few minutes, please wait..."
docker build -t tidb $ROOT_PATH
docker kill $(docker ps |grep "start-all.sh") 2>/dev/null
id=$(docker run -d -p 4444:4000 -it tidb)
sleep 30
DOCKER_IP=$(docker-machine ip default)
docker_name=$(docker-machine ls | grep '*' | awk '{print $1}')
docker_ip=$(docker-machine ip $docker_name)
docker_gateway="${docker_ip%.*}.1"
docker exec $id mysql -u root -P 4000 -h 127.0.0.1 --exec 'INSERT INTO mysql.user VALUES("'$docker_gateway'", "root", "", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y");'
echo "Mysql has started, and use \`docker logs -f $id\` to view log"
mysql -h $docker_ip -P 4444 -u root
