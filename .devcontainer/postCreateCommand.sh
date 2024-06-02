#!/bin/bash

USERNAME=ghost

rosdep update && rosdep install --from-paths src --ignore-src -y && sudo chown -R $USERNAME /home/$USERNAME/ws/

source /opt/ros/$ROS_DISTRO/setup.sh; 
colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=On -DCMAKE_CXX_FLAGS='-Wall -Wextra -Wpedantic'

sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" -- \
    -t takashiyoshida \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting \
    -p https://github.com/MichaelAquilina/zsh-you-should-use \
    -p https://github.com/marlonrichert/zsh-autocomplete 

mkdir -p /home/$USERNAME/.cache/zsh
eval "$(ssh-agent -s)"

cat /home/$USERNAME/ws/.devcontainer/zsh_.sh >> /home/$USERNAME/.zshrc

echo "export XDG_RUNTIME_DIR='/tmp/runtime-$(whoami)'" >> /home/$USERNAME/.zshrc

sudo apt-get install -y ros-$ROS_DISTRO-ros2-control ros-$ROS_DISTRO-ros2-controllers ros-$ROS_DISTRO-xacro ros-$ROS_DISTRO-rqt* ros-$ROS_DISTRO-rviz2
sudo apt-get install -y ros-$ROS_DISTRO-pcl-conversions

chmod +x /home/$USERNAME/ws/.devcontainer/requirements.sh; . /home/$USERNAME/ws/.devcontainer/requirements.sh