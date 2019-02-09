echo "Initialzing Master"
mkdir /tmp/kubeadm

# Initialize master
kubeadm init \
    --ignore-preflight-errors=SystemVerification  \
    --apiserver-advertise-address=192.168.255.100 \

# Make kubeadm available
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config

# Create join cluster command
kubeadm token create --print-join-command >> /tmp/kubeadm/join.sh
chmod +x /tmp/kubeadm/join.sh

# Create the pod network
kubectl apply -n kube-system -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base 64 | tr -d '\n')"

