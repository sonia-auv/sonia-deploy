echo $(hostname -I | awk '{print $1}')

export XAVIER_IP=$(hostname -I | awk '{print $1}')

docker rm $(docker ps -a -q)
docker-compose -f docker-compose.auv8.yml up
