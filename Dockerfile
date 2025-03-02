FROM ubuntu:focal
MAINTAINER Brett Watz <brett@mail.121gigawatz.net>

RUN apt update && apt install samba avahi-daemon -y

EXPOSE 137/udp 138/udp 139 445 5353/udp

COPY smb.conf /etc/samba/smb.conf
COPY samba.service /etc/avahi/services/samba.service

COPY run.sh /

RUN sed -i 's/.*enable-dbus=.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

RUN chmod +x /run.sh

RUN sed -i s/^#host-name=foo/host-name=time-machine-docker/ /etc/avahi/avahi-daemon.conf

CMD ["/bin/bash","/run.sh"]
