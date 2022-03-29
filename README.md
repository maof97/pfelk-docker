# docker-pfelk 
Deploy pfelk with docker-compose [Video Tutorial](https://www.youtube.com/watch?v=xl0v9h8RXBc) 

![Version badge](https://img.shields.io/badge/ELK-8.1.1-blue.svg)
[![Build Status](https://travis-ci.org/pfelk/docker.svg?branch=master)](https://travis-ci.org/pfelk/docker-pfelk)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/a3ilson) 

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
### (5) Start Docker 
```
sudo docker-compose up
```
Once fully running, navigate to the host ip (ex: 192.168.0.100:5601)

### (6) Finalizing 

Finalize templates and dashboards [here](https://github.com/pfelk/pfelk/blob/master/install/configuration.md)
