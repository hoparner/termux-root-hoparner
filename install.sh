#!/bin/bash

# Function to display progress bar
progressbar() {
  local duration=$1
  local chars="===================="
  local prefix="Installing root: "
  local suffix="]"
  local fill=""

  printf "%s" "$prefix"
  for ((i=0; i<=${duration}; i++)); do
    printf "%s" "${chars:$i:1}"
    sleep 0.1
  done
  printf "%s\n" "$suffix"
}

# Update and upgrade packages
pkg update -y
pkg upgrade -y

# Install necessary packages
pkg install proot -y
pkg install git -y

# Clone the root repository
git clone https://github.com/termux/proot-distro.git

# Enter the proot-distro directory
cd proot-distro

# Install rootfs
progressbar 10
./start-distro.sh

# Start the rootfs
progressbar 20
./start-rootfs.sh

# Root installation completed
echo -e "\n\e[32mRoot access has been installed successfully!\e[0m"
echo -e "\n\e[32mRoot-доступ успешно установлен!\e[0m"
echo -e "\n\e[32mRoot մուտքը հաջողությամբ տեղադրվել է:\e[0m"

