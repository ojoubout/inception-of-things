apt update && apt install -y curl && apt install net-tools
echo "export PATH=$PATH:/usr/sbin" >> /etc/profile
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-iface=eth1" K3S_URL=https://192.168.42.110:6443 K3S_TOKEN_FILE=/vagrant/node-token sh -