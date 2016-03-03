FROM fedora:23
MAINTAINER clime@redhat.com

ENV container docker
RUN dnf -y update
RUN dnf -y install systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME ["/sys/fs/cgroup"]

RUN dnf -y install htop
RUN dnf -y install tito
RUN dnf -y install wget
RUN dnf -y install net-tools
RUN dnf -y install iputils
RUN dnf -y install vim
RUN dnf -y install mlocate
RUN dnf -y install git
RUN dnf -y install sudo
RUN dnf -y install openssh-server
RUN dnf -y install dnf-plugins-core
RUN dnf -y install psmisc
RUN dnf -y install python-jedi

RUN export LANG=en_US.utf8
RUN setcap cap_net_raw,cap_net_admin+p /usr/bin/ping

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -q

RUN echo 'root:passwd' | chpasswd
WORKDIR /root/
RUN git init
RUN git remote add origin https://github.com/clime/home.git
RUN git fetch
RUN git reset --hard origin/master
RUN mkdir .ssh &&  chmod 700 . .ssh
RUN ssh-keygen -f .ssh/id_rsa -N '' -q
RUN touch .ssh/authorized_keys && chmod 600 ./.ssh/authorized_keys
RUN cat .ssh/id_rsa.pub >> ./.ssh/authorized_keys
RUN cp .local_bashrc_tmpl .local_bashrc
RUN echo 'export PS1="\[\e[31;1m\]\u\[\e[31;1m\]@\[\e[31;1m\]\h \[\e[0;1m\]\w\[\e[31;1m\] $ \[\e[0m\]"' > .local_bashrc

RUN useradd clime
RUN echo 'clime:passwd' | chpasswd
RUN echo 'clime  ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/clime
RUN git init
RUN git remote add origin https://github.com/clime/home.git
RUN git fetch
RUN git reset --hard origin/master
RUN mkdir .ssh && chmod 700 . .ssh
RUN ssh-keygen -f .ssh/id_rsa -N '' -q
RUN touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
RUN cat .ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN cat .ssh/id_rsa.pub >> .ssh/authorized_keys
RUN cp .local_bashrc_tmpl .local_bashrc
RUN echo 'export PS1="\[\e[33;1m\]\u\[\e[36;1m\]@\[\e[36;1m\]\h \[\e[37;1m\]\w\[\e[32;1m\] $ \[\e[0m\]"' > .local_bashrc
RUN chown clime:clime -R .

RUN dnf -y install procps-ng
rm /run/nologin

CMD ["/usr/sbin/init"]
