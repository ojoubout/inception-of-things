apt update && apt upgrade
apt install curl git -y
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
sed -i 's/bullseye/buster/g' /etc/apt/sources.list.d/gitlab_gitlab-ce.list
apt update -y
export GITLAB_ROOT_PASSWORD='123root123'
apt install gitlab-ce -y
gitlab-ctl reconfigure

mkdir iot-playground
cd iot-playground
cp /vagrant/app.deployement.yaml .
git init
git add .
git config --global user.email "ojoubout@student.1337.ma" 
git config --global user.name "ojoubout" 
git commit -m 'Initial commit'
git push --set-upstream http://root:123root123@localhost/root/iot-playground.git master