#!/bin/bash

# Xóa màn hình trước khi hiển thị logo
clear

# Hiển thị logo WIBUCRYPTO với màu xanh dương đậm
echo -e "\e[1;34m"  
echo "------------------------------------------------------"
echo " 🚀 Welcome to WIBUCRYPTO 🚀 "
echo "------------------------------------------------------"
echo -e "\e[0m"  
sleep 3  

# Cập nhật danh sách package trước khi cài đặt
echo "🔄 Updating package list..."
sudo apt update -y

# Cài đặt OpenSSL và các thư viện cần thiết
echo "🔧 Installing dependencies (OpenSSL, pkg-config, etc.)..."
sudo apt install -y pkg-config libssl-dev unzip wget curl

# Kiểm tra xem OpenSSL đã được cài đặt chưa
if ! command -v openssl &> /dev/null; then
    echo -e "\e[31m❌ OpenSSL is not installed! Please install it manually.\e[0m"
    exit 1
fi

# Cài đặt Protobuf (Protocol Buffers)
echo "🔧 Installing protoc..."
wget https://github.com/protocolbuffers/protobuf/releases/download/v29.1/protoc-29.1-linux-x86_64.zip
unzip protoc-29.1-linux-x86_64.zip -d /usr/local
export PATH=/usr/local/bin:$PATH
source ~/.bashrc
protoc --version

# Cài đặt Rust
echo "🔧 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf

# Cài đặt Nexus CLI
echo "🔧 Installing Nexus CLI..."
curl https://cli.nexus.xyz/ | sh

# Kiểm tra xem cài đặt có thành công không
if ! command -v cargo &> /dev/null; then
    echo -e "\e[31m❌ Rust installation failed! Try installing manually.\e[0m"
    exit 1
fi

if ! command -v protoc &> /dev/null; then
    echo -e "\e[31m❌ Protoc installation failed! Check your installation.\e[0m"
    exit 1
fi

# Hiển thị thông báo hoàn thành
echo -e "\e[32m✅ Installation complete! Enjoy WIBUCRYPTO! 🚀\e[0m"
