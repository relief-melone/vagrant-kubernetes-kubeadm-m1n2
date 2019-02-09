echo "Initializing Node"
# Install SSHPASS and copy join command from master
apt-get install -y sshpass
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@192.168.255.100:/tmp/kubeadm/join.sh .
sh ./join.sh