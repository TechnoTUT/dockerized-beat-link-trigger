# dockerized-beat-link-trigger
## About
This repository contains a Dockerfile for building a Docker image of the [Beat Link Trigger](https://github.com/Deep-Symmetry/beat-link-trigger) application.  
The docker image is based on the [Debian/GNU Linux](https://www.debian.org/) distribution and uses the [OpenJDK](https://openjdk.java.net/) Java 17 runtime environment.

## Attention
This project is not support on Windows and MacOS systems. Docker for Windows and MacOS does not support the `network_mode: host` option. Please use a Linux system or a virtual machine with Linux.

## Usage
### Pulling this repository
```bash
git clone https://github.com/technotut/dockerized-beat-link-trigger.git
```
### Building the Docker image
```bash
cd dockerized-beat-link-trigger
docker compose build
```
### Starting the Docker container
```bash
docker compose up -d
```
Connect to the Docker container via VNC with browser. Please access the following URL in your browser: `http://localhost:6080/vnc.html` or `http://<IP-Address>:6080/vnc.html`.  
Select the `Connect` button and enter the password `password`.  
Double-click the shell-script `blt-start.sh` on the desktop to start the Beat Link Trigger application.  

If you have config files for the Beat Link Trigger application, you can copy them to the `bltconfig` directory. That directory is mounted as a volume in the Docker container `/root/bltconfig`. (You can change the directory in the `docker-compose.yml` file.)  

### Stopping the Docker container
```bash
docker compose down
```
