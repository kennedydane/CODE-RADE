# Ansible for CentOS 6.
#
# basic metadata
FROM centos:6
MAINTAINER "Bruce Becker <bbecker@Csir.co.za>"

# Get Ansible requirements

RUN  yum -y install \
            python-simplejson \
            libselinux-python \
            python-setuptools \
            python-devel \
            python-pip \
            which \
            git
RUN yum -y groupinstall 'Development Tools'

# Install Ansible
RUN pip install ansible
RUN which ansible
RUN ansible --version

WORKDIR /root
RUN git checkout --recursive https://github.com/AAROC/DevOps/
WORKDIR /root/DevOps/Ansible
RUN ansible-playbook -i inventories/inventory.local cvmfs.yml 
