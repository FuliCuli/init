#!/bin/bash
export ANSIBLE_FORCE_COLOR=true
export PYTHONUNBUFFERED=1
apt-get update
apt-get install python-pip python-dev git -y
pip install PyYAML jinja2 paramiko
cd /tmp
git clone https://github.com/ansible/ansible.git
cd ansible
git submodule update --init --recursive
make install
cd ../
rm -rf ansible/
cd /home/ansible
ansible-playbook -i hosts_dev jarvis.yml --connection=local