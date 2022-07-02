export ADRESS_IP=$(hostname -I | awk '{print $1}')
export AUV=AUV7
docker rm $(docker ps -a -q)
docker-compose -f docker-compose.auv7.yml pull