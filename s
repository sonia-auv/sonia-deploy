[1mdiff --git a/docker-compose.auv7.yml b/docker-compose.auv7.yml[m
[1mindex 9457c0c..bee2d05 100644[m
[1m--- a/docker-compose.auv7.yml[m
[1m+++ b/docker-compose.auv7.yml[m
[36m@@ -145,7 +145,7 @@[m [mservices:[m
       - ros-master[m
 [m
   proc_image_processing:[m
[31m-    image: ghcr.io/sonia-auv/proc_image_processing/proc_image_processing:arm64-perception-develop[m
[32m+[m[32m    image: ghcr.io/sonia-auv/proc_image_processing/proc_image_processing:arm64-perception-feature-solve-deep-learning-bug[m[41m[m
     container_name: proc_image_processing[m
     environment:[m
       - ROS_IP=${ADRESS_IP}[m
[1mdiff --git a/docker-compose.local.yml b/docker-compose.local.yml[m
[1mindex 23d4932..08d9cb7 100644[m
[1m--- a/docker-compose.local.yml[m
[1m+++ b/docker-compose.local.yml[m
[36m@@ -10,21 +10,21 @@[m [mservices:[m
       - ROS_IP=${ADRESS_IP}[m
     command: stdbuf -o L roscore[m
 [m
[31m-  sonia-ros-bridge:[m
[31m-      image: ghcr.io/sonia-auv/sonia-ros-bridge/sonia-ros-bridge:x86-perception-latest[m
[31m-      container_name: sonia-ros-bridge[m
[31m-      environment:[m
[31m-        - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[31m-        - ROS_IP=${ADRESS_IP}[m
[31m-      network_mode: host[m
[31m-      depends_on:[m
[31m-        - ros-master[m
[31m-      command:[m
[31m-        - roslaunch[m
[31m-        - --wait[m
[31m-        - --log[m
[31m-        - rosbridge_server[m
[31m-        - rosbridge_websocket.launch[m
[32m+[m[32m  # sonia-ros-bridge:[m
[32m+[m[32m  #     image: ghcr.io/sonia-auv/sonia-ros-bridge/sonia-ros-bridge:x86-perception-latest[m
[32m+[m[32m  #     container_name: sonia-ros-bridge[m
[32m+[m[32m  #     environment:[m
[32m+[m[32m  #       - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[32m+[m[32m  #       - ROS_IP=${ADRESS_IP}[m
[32m+[m[32m  #     network_mode: host[m
[32m+[m[32m  #     depends_on:[m
[32m+[m[32m  #       - ros-master[m
[32m+[m[32m  #     command:[m
[32m+[m[32m  #       - roslaunch[m
[32m+[m[32m  #       - --wait[m
[32m+[m[32m  #       - --log[m
[32m+[m[32m  #       - rosbridge_server[m
[32m+[m[32m  #       - rosbridge_websocket.launch[m
 [m
   sonia-ros-tcp-endpoint:[m
     image: ghcr.io/sonia-auv/sonia-ros-tcp-endpoint/sonia-ros-tcp-endpoint:x86-perception-latest[m
[36m@@ -38,15 +38,15 @@[m [mservices:[m
       - ros_tcp_endpoint[m
       - endpoint.launch[m
       [m
[31m-  octopus_telemetry:[m
[31m-    image: ghcr.io/sonia-auv/octopus-telemetry:develop[m
[31m-    container_name: octopus_telemetry[m
[31m-    network_mode: host[m
[31m-    environment:[m
[31m-      - REACT_APP_BRIDGE_IP=${ADRESS_IP}[m
[31m-      - REACT_APP_AUV=${AUV}[m
[31m-    depends_on: [m
[31m-      - sonia-ros-bridge[m
[32m+[m[32m  # octopus_telemetry:[m
[32m+[m[32m  #   image: ghcr.io/sonia-auv/octopus-telemetry:develop[m
[32m+[m[32m  #   container_name: octopus_telemetry[m
[32m+[m[32m  #   network_mode: host[m
[32m+[m[32m  #   environment:[m
[32m+[m[32m  #     - REACT_APP_BRIDGE_IP=${ADRESS_IP}[m
[32m+[m[32m  #     - REACT_APP_AUV=${AUV}[m
[32m+[m[32m  #   depends_on:[m[41m [m
[32m+[m[32m  #     - sonia-ros-bridge[m
 [m
   proc_mapping:[m
     image: ghcr.io/sonia-auv/proc_mapping/proc_mapping:x86-perception-develop[m
[36m@@ -59,7 +59,7 @@[m [mservices:[m
       - ros-master[m
 [m
   proc_image_processing:[m
[31m-    image: ghcr.io/sonia-auv/proc_image_processing/proc_image_processing:x86-perception-feature-bounding-box[m
[32m+[m[32m    image: ghcr.io/sonia-auv/proc_image_processing/proc_image_processing:x86-perception-feature-solve-deep-learning-bug[m
     container_name: proc_image_processing[m
     environment:[m
       - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[36m@@ -183,16 +183,16 @@[m [mservices:[m
   #   depends_on:[m
   #     - ros-master[m
 [m
[31m-  provider_power:[m
[31m-    image: ghcr.io/sonia-auv/provider_power/provider_power:x86-perception-develop[m
[31m-    container_name: provider_power[m
[31m-    environment:[m
[31m-      - ROS_IP=${ADRESS_IP}[m
[31m-      - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[31m-      - AUV=${LOCAL_AUV}[m
[31m-    network_mode: host[m
[31m-    depends_on:[m
[31m-      - ros-master[m
[32m+[m[32m  # provider_power:[m
[32m+[m[32m  #   image: ghcr.io/sonia-auv/provider_power/provider_power:x86-perception-develop[m
[32m+[m[32m  #   container_name: provider_power[m
[32m+[m[32m  #   environment:[m
[32m+[m[32m  #     - ROS_IP=${ADRESS_IP}[m
[32m+[m[32m  #     - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[32m+[m[32m  #     - AUV=${LOCAL_AUV}[m
[32m+[m[32m  #   network_mode: host[m
[32m+[m[32m  #   depends_on:[m
[32m+[m[32m  #     - ros-master[m
 [m
   # provider_actuators:[m
   #   image: ghcr.io/sonia-auv/provider_actuators/provider_actuators:x86-perception-develop[m
[36m@@ -214,19 +214,19 @@[m [mservices:[m
   #   depends_on:[m
   #     - ros-master[m
 [m
[31m-  interface_rs485:[m
[31m-    image: ghcr.io/sonia-auv/interface_rs485/interface_rs485:x86-perception-develop[m
[31m-    container_name: interface_rs485[m
[31m-    environment:[m
[31m-      - ROS_IP=${ADRESS_IP}[m
[31m-      - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[31m-      - AUV=${AUV}[m
[31m-    network_mode: host[m
[31m-    privileged: true[m
[31m-    volumes:[m
[31m-      - /dev/ttyUSB0:/dev/ttyUSB0[m
[31m-    depends_on:[m
[31m-     - ros-master[m
[32m+[m[32m  # interface_rs485:[m
[32m+[m[32m  #   image: ghcr.io/sonia-auv/interface_rs485/interface_rs485:x86-perception-develop[m
[32m+[m[32m  #   container_name: interface_rs485[m
[32m+[m[32m  #   environment:[m
[32m+[m[32m  #     - ROS_IP=${ADRESS_IP}[m
[32m+[m[32m  #     - ROS_MASTER_URI=http://${ADRESS_IP}:11311[m
[32m+[m[32m  #     - AUV=${AUV}[m
[32m+[m[32m  #   network_mode: host[m
[32m+[m[32m  #   privileged: true[m
[32m+[m[32m  #   volumes:[m
[32m+[m[32m  #     - /dev/ttyUSB0:/dev/ttyUSB0[m
[32m+[m[32m  #   depends_on:[m
[32m+[m[32m  #    - ros-master[m
 [m
   # interface_rs485:[m
   #   image: ghcr.io/sonia-auv/interface_rs485/interface_rs485:x86-perception-develop[m
