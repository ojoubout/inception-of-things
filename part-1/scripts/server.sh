curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/

firewall-cmd --zone=public --permanent --add-port 6443/tcp
firewall-cmd --reload