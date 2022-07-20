export ADRESS_IP=192.168.0.126
export AUV=AUV8
sudo chmod -R a+rwx "/home/sonia/ssd/config_filterchain"
docker rm $(docker ps -a -q)

#start deep learning
source ~/ssd/catkin_ws/devel/setup.bash
source ~/ssd/catkin_cv_bridge/install/setup.bash --extend

roslaunch --wait proc_detection proc_detection.launch &

docker-compose -f docker-compose.auv8.yml up
