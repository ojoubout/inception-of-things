apt update && apt install -y curl && apt install net-tools
echo "export PATH=$PATH:/usr/sbin" >> /etc/profile
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant/