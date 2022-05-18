FROM centos

run mkdir tesla
WORKDIR tesla
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum update -y
Run yum install httpd -y
run yum install git -y
expose 80
run git clone https://github.com/chandujain/tesla.git
WORKDIR tesla
copy /home/ubuntu/tesla/project.html /var/www/html
RUN  httpd
