XAVIER=$(hostname -I | awk '{print $1}')
echo $XAVIER

export XAVIER_IP=$XAVIER
docker-compose -f docker-compose.auv8.yml up
