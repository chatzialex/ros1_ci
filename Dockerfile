# Base image
FROM osrf/ros:noetic-desktop-full-focal

# Install Gazebo
RUN apt-get update && apt-get install -y \
 git \
 gazebo11 \
 ros-noetic-gazebo-ros-pkgs \
 && rm -rf /var/lib/apt/lists/*

# Prepare workspace with packages
RUN mkdir -p /catkin_ws/src
RUN git clone --depth 1 --branch noetic https://github.com/chatzialex/tortoisebot.git /catkin_ws/src/tortoisebot
COPY tortoisebot_waypoints /catkin_ws/src/tortoisebot_waypoints

# Build and source environment
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && cd /catkin_ws && catkin_make"

# Start
RUN sed -i '/exec "\$@"/i source /catkin_ws/devel/setup.bash' /ros_entrypoint.sh
# SHELL ["/bin/bash", "-c"]
