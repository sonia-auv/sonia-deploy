export ADRESS_IP=$(hostname -I | awk '{print $1}')
export AUV=AUV8
sudo chmod -R a+rwx "/home/sonia/ssd/config_filterchain"
docker rm $(docker ps -a -q)
docker-compose -f docker-compose.auv8.yml up
