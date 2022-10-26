# Elastic Integration
- https://docs.elastic.co/en/integrations/pfsense

# docker-pfelk 
Deploy pfelk with docker-compose [Video Tutorial](https://www.youtube.com/watch?v=xl0v9h8RXBc) 

![Version badge](https://img.shields.io/badge/ELK-8.4.3-blue.svg)
[![Build Status](https://travis-ci.org/pfelk/docker.svg?branch=master)](https://travis-ci.org/pfelk/docker-pfelk)

[![YouTube](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/3ilson)

### (0) Required Prerequisits 
- [X] Docker 
- [X] Docker-Compose
- [X] Adequate Memory (i.e. 8GB+)

#### (1) Docker Install
```
sudo apt-get install docker
```
```
sudo apt-get install docker-compose
```

### (2) Download pfELK Docker
```
sudo wget https://github.com/pfelk/docker/archive/refs/heads/main.zip
```
#### (2a) Unzip pfelkdocker.zip
```
sudo apt-get install unzip
```
```
sudo unzip main.zip
```
### (3) Memory 
#### (3a) Set vm.max_map_count to no less than 262144 (must run each time host is booted)
```
sudo sysctl -w vm.max_map_count=262144
```
#### (3b) Set vm.max_map_count to no less than 262144 (one time configuration) 
```
sudo echo "vm.max_map_count=262144" >> /etc/sysctl.conf
```
### (4) Configure Variables (Credentials) 
#### (4a) Edit `.env` File
```
sudo nano .env
```
#### (4b) Amend `.env` File as Desired
```
ELK_VERSION=8.1.0
ELASTIC_PASSWORD=ELASTIC-PASSWORD
KIBANA_PASSWORD=KIBANA-PASSWORD
LOGSTASH_PASSWORD=LOGSTASH-PASSWORD
LICENSE=basic
```
#### (4c) Update `LOGSTASH_PASSWORD` in configuration files
```
sed -i 's/logstash_system_password/LOGSTASH-PASSWORD/' etc/logstash/config/logstash.yml
sed -i 's/elastic_password/ELASTIC-PASSWORD/' etc/pfelk/conf.d/50-outputs.pfelk
```
or use the Script
```
./set-logstash-password.sh
```
### (5) Start Docker 
```
sudo docker-compose up
```
Once fully running, navigate to the host ip (ex: 192.168.0.100:5601)

### (5) Configure Security 
* Configure Security [here](https://github.com/pfelk/pfelk/blob/main/install/security.md)

### (6) Finish Configuring
* Finish Configuring [here](https://github.com/pfelk/pfelk/blob/main/install/configuration.md)

### (7) Finished 
