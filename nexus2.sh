#!/bin/bash

echo -e "\e[1;34m"  # Màu xanh dương + in đậm
echo "------------------------------------------------------"
echo " 🚀 Welcome to \e[1;34mWIBUCRYPTO\e[0m 🔗"
echo "------------------------------------------------------"
echo -e "\e[0m"  # Reset màu
sleep 3  # Chờ 3 giây để người dùng thấy logo

# Cài đặt protoc (Protocol Buffers)
echo "🔧 Installing protoc..."
wget https://github.com/protocolbuffers/protobuf/releases/download/v29.1/protoc-29.1-linux-x86_64.zip
apt install unzip -y
unzip protoc-29.1-linux-x86_64.zip -d /usr/local
export PATH=/usr/local/bin:$PATH
source ~/.bashrc
protoc --version

# Cài đặt Rust và công cụ liên quan
echo "🔧 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf

echo "🔧 Installing Nexus CLI..."
curl https://cli.nexus.xyz/ | sh

echo -e "\e[32m✅ Installation complete! Enjoy WIBUCRYPTO! 🚀\e[0m"
