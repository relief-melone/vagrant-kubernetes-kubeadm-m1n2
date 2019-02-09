echo "Installing Prerequisites"

swapoff -a
apt-get update

apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common

# Download and install repo keys

curl -s http://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
curl -fsSL http://download.docker.com/linux/ubuntu/gpg | apt-key add -

echo "deb https://apt.kubernetes.io kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list

apt-get update

apt-get install -y kubelet kubeadm kubectl

apt-key fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update

apt-get install -y docker-ce