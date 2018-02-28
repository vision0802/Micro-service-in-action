#!/bin/bash

echo "***************************************************************开始打包*******************************************************************"
mvn clean package spring-boot:repackage && cd eureka-server/target/
echo "***************************************************************打包完成*******************************************************************"

echo "*********************************************************启动eureka-server 集群节点peer1**************************************************"
java -jar eureka-server-0.0.1.jar --spring.profiles.active=peer1 &

echo "*********************************************************启动eureka-server 集群节点peer2**************************************************"
java -jar eureka-server-0.0.1.jar --spring.profiles.active=peer2 &

echo "*********************************************************启动hello-service 服务节点8001***************************************************"
cd ../../hello-service/target/ 
java -jar hello-service-0.0.1.jar --server.port=8001 &

echo "*********************************************************启动hello-service 服务节点8002***************************************************"
java -jar hello-service-0.0.1.jar --server.port=8002 &

echo "*********************************************************启动ribbon-consumer 服务节点8003***************************************************"
cd ../../ribbon-consumer/target/
java -jar ribbon-consumer-0.0.1.jar &