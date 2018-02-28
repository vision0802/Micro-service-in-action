#!/bin/bash
### 首先打包  
echo "开始执行打包!!!";
mvn clean package spring-boot:repackage
echo "执行打包完成!!!"
### 进入到eureka-server/target 目录
echo "进入到eureka-server/target!!!"
cd eureka-server/target/
echo "当前目录为:"
pwd
### 开启新的shell 启动eureka-server 集群节点peer1
java -jar eureka-server-0.0.1.jar --spring.profiles.active=peer1 &
### 开启新的shell 启动eureka-server 集群节点peer2
java -jar eureka-server-0.0.1.jar --spring.profiles.active=peer2 &
### 进入到hello-service/target目录
cd ../../hello-service/target/
### 开启新的shell 启动hello-service 服务实例1
java -jar hello-service-0.0.1.jar --server.port=8001 &
### 开启新的shell 启动hello-service 服务实例2
java -jar hello-service-0.0.1.jar --server.port=8002 &