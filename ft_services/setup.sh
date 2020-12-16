minikube delete;

minikube start --vm-driver=virtualbox
minikube addons enable metallb

kubectl apply -f lbconf.yaml

eval $(minikube docker-env)
docker build -t nginx_image nginx
docker build -t wordpress_image wordpress
docker build -t phpmyadmin_image phpmyadmin
docker build -t mysql_image mysql

kubectl apply -f mysql/mysql.yaml
kubectl apply -f nginx/nginx.yaml
kubectl apply -f wordpress/wordpress.yaml
kubectl apply -f phpmyadmin/phpmyadmin.yaml

minikube dashboard
