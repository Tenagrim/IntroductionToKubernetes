minikube delete;

minikube start --vm-driver=virtualbox
minikube addons enable metallb

IP = $(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p);

eval $(minikube docker-env)
docker build -t nginx_image nginx
docker build -t wordpress_image wordpress --build-arg IP=${IP}
