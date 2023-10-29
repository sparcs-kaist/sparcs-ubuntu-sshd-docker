FROM ubuntu:20.04

RUN apt-get update

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y openssh-server vim git sudo curl
RUN mkdir /var/run/sshd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir /cred

# Copy custom password change script
WORKDIR /root
COPY ./template/changepw .
RUN chmod u+x changepw

EXPOSE 22

CMD ["sh", "-c", "ln -sf /cred/shadow /etc/shadow && /usr/sbin/sshd -D"]