#!/bin/bash

wget https://github.com/protocolbuffers/protobuf/releases/download/v29.1/protoc-29.1-linux-x86_64.zip
apt install unzip -y
unzip protoc-29.1-linux-x86_64.zip -d /usr/local
export PATH=/usr/local/bin:$PATH
source ~/.bashrc
protoc --version

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf


curl https://cli.nexus.xyz/ | sh

echo -e "\e[32m"
echo "==================================="
echo "       WELCOME TO WIBUCRYPTO       "
echo "==================================="
echo -e "\e[0m"
