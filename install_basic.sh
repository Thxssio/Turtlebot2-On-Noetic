#!/usr/bin/env sh

# necessary on a fresh bionic install
sudo apt-get install git -y

mkdir -p src
cd src

git clone https://github.com/turtlebot/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_simulator.git

git clone https://github.com/yujinrobot/kobuki_msgs.git
git clone --single-branch --branch melodic https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_node \
  kobuki/kobuki_keyop kobuki/kobuki_safety_controller \
  kobuki/kobuki_bumper2pc ./
rm -rf kobuki

git clone --single-branch --branch melodic https://github.com/yujinrobot/kobuki_desktop.git
mv kobuki_desktop/kobuki_gazebo_plugins ./
rm -rf kobuki_desktop

git clone https://github.com/yujinrobot/yujin_ocs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs

sudo apt-get install ros-noetic-kobuki-* -y
sudo apt-get install ros-noetic-ecl-streams -y

# necessary for build and gazebo
sudo apt-get install ros-noetic-depthimage-to-laserscan -y
sudo apt-get install ros-noetic-joy -y

sudo apt install ros-noetic-ros-industrial-cmake-boilerplate
sudo apt install ros-noetic-opw-kinematics
sudo apt install ros-noetic-moveit-opw-kinematics-plugin

#!sudo apt-get install ros-noetic-yocs-velocity-smoother -y
