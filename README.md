# Redis-Dockerfile 사용법

### Create docker Image
docker build --t <Dockerfile Path> 형식입니다.<br>
example: sudo docker build --t pegasuskim-redis:latest ./dockerfile.<br>

### Docker image file list
sudo docker images

### docker Image run
sudo docker run -it -d --restart=always --name imqa-redis -p 63785:63785 -v "외부 volume path" pegasuskim-redis:latest

### docker Image run(백그라운드)
sudo docker run -it -d --restart=always --name imqa-redis -p 63785:63785 -v "외부 volume path":/var/lib/redis pegasuskim-redis:latest


### docker image run (그냥 실행 함.)
sudo docker run -it --name imqa-redis  -p 63785:63785 -v "외부 volume path":/var/lib/redis pegasuskim-redis:latest

###  Bash 실행.
sudo docker run -it  -p 63785:63785 -v "외부 volume path":/var/lib/redis pegasuskim-redis:latest /bin/bash

###  redis 접속
sudo docker exec -it redis redis-cli -h 127.0.0.1 -p 63785
auth asdf12


## Docker Public Repository & docker registry Server 
