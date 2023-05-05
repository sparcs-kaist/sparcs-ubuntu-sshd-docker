FROM ubuntu:20.04

RUN apt-get update

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y openssh-server vim git sudo curl
RUN mkdir /var/run/sshd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["sh", "-c", "test -n \"$PASSWORD\" && echo \"root:$PASSWORD\" | chpasswd && /usr/sbin/sshd -D"]