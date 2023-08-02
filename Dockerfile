FROM debian:latest

ENV DISPLAY=:1
ENV USER=root
ENV HOME=/root
EXPOSE 5901 6080

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget openjdk-17-jdk && \
    apt-get install -y tigervnc-standalone-server tigervnc-common novnc python3-websockify && \
    apt-get install -y task-xfce-desktop dbus-x11
RUN printf "password\npassword\n\n" | vncpasswd && \
    wget https://github.com/Deep-Symmetry/beat-link-trigger/releases/download/v7.1.0/beat-link-trigger-7.1.0.jar
RUN printf "password\npassword\n\n" | passwd root
COPY --chown=root:root blt-start.sh /root/Desktop/blt-start.sh
RUN chmod +x /root/Desktop/blt-start.sh
CMD vncserver :1 -geometry 1280x800 -depth 24 && \
    websockify -D --web=/usr/share/novnc/ 6080 localhost:5901 && \
    /usr/bin/xfce4-session