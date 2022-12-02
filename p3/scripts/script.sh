# Install Docker
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install K3D
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
#Setup K3S cluster
k3d cluster create mycluster

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

wget https://github.com/argoproj/argo-cd/releases/download/v2.2.15/argocd-linux-amd64
install -o root -g root -m 0755 argocd-linux-amd64 /usr/local/bin/argocd


# echo '#!/bin/sh -e

kubectl create namespace dev

kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0  8080:443 &

sleep 5
argocd login localhost:8080 --insecure --username admin --password $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
argocd app create iot --repo https://github.com/ojoubout/iot-playground --path app --dest-server https://kubernetes.default.svc --dest-namespace dev --sync-policy auto
argocd app sync iot

# exit 0' > /etc/init.d/mystartup.sh
# chmod +x /etc/init.d/mystartup.sh