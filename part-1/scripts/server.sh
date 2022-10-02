# cd /etc/yum.repos.d/
# sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# systemctl start firewalld
# systemctl enable firewalld


curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -
cp /var/lib/rancher/k3s/server/node-token /vagrant/

firewall-cmd --zone=public --permanent --add-port 6443/tcp
firewall-cmd --reload