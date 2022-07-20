export ADRESS_IP=$(hostname -I | awk '{print $1}')
export AUV=AUV7
sudo chmod -R a+rwx "/home/sonia/ssd/config_filterchain"
docker rm $(docker ps -a -q)

#start deep learning
source ~/ssd/catkin_ws/devel/setup.bash
source ~/ssd/catkin_cv_bridge/install/setup.bash --extend

roslaunch --wait proc_detection proc_detection.launch &

docker-compose -f docker-compose.auv7.yml up
