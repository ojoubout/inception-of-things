apt install -y curl
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-iface=eth1" K3S_KUBECONFIG_MODE="644" sh -

cd /vagrant/confs
kubectl apply -f app1.deployment.yaml -f app2.deployment.yaml -f app3.deployment.yaml -f ingress.yaml
