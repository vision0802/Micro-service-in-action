#!/bin/bash

echo "杀掉所有java线程开始========="
ps -ef | grep java | awk '{print $2}' | xargs kill -9
echo "进程kill完毕================="
echo "清除target目录"
mvn clean 
