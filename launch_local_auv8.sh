export ADRESS_IP=192.168.0.126
export AUV=LOCAL
export LOCAL_AUV=AUV8
sudo chmod -R a+rwx "$ROS_SONIA_WS/src/config_filterchain"
docker rm $(docker ps -a -q)
docker-compose -f docker-compose.local.yml up