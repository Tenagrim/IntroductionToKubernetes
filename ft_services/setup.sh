#!/bin/bash

clear

#kubectl get pods -n metallb-system
tmp=1
retr=0

while true
do
	minikube delete;
	minikube start --vm-driver=virtualbox
	minikube status
	tmp=$?
	((retr++))
	if [ $tmp -eq "0" ]
	then
		echo 	">>>>>>>>>>>>>>>>  MINIKUBE STARTED  <<<<<<<<<<<<<<<<<<<<< "
		break
	fi
		echo	">>>>>>>>>>  MINIKUBE FAILED TO START. RETRY... <<<<<<<<<< "
done

eval $(minikube docker-env)

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

minikube addons enable metallb
minikube addons enable dashboard

kubectl apply -f srcs/lbconf.yaml

docker build -t nginx_image srcs/nginx
docker build -t wordpress_image srcs/wordpress
docker build -t phpmyadmin_image srcs/phpmyadmin
docker build -t mysql_image srcs/mysql
docker build -t grafana_image srcs/grafana
docker build -t influxdb_image srcs/influxdb
docker build -t telegraf_image srcs/telegraf
docker build -t ftps_image srcs/ftps

kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/ftps/ftps.yaml


echo 	">>>>>>>>>>>>>>>>  MINIKUBE STARTED.  TRIES: $retr <<<<<<<<<<<<<<<<<<<<< "

minikube dashboard
