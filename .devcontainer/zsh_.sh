
source /opt/ros/$ROS_DISTRO/setup.zsh
source /home/$USERNAME/ws/install/setup.zsh

setopt nomatch

alias sz="source ~/.zshrc"
alias ez="code ~/.zshrc"

alias hist="code ~/.zsh_history"
alias hist_b="code ~/.bash_history"

alias cls="clear"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade -y"
alias inst="sudo apt install -y"

alias cbd="cd /home/$USERNAME/ws; colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=On -DCMAKE_CXX_FLAGS='-Wall -Wextra -Wpedantic'"
alias ccd="colcon_cd"

source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/$ROS_DISTRO/