export ADRESS_IP=$(hostname -I | awk '{print $1}')
export AUV=LOCAL
docker rm $(docker ps -a -q)
docker compose -f docker-compose.local.yml pull