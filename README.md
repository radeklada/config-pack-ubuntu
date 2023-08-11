# Config-pack-ubuntu

Ansible playbook for my initial OS configuration

## Dependencies:

Install ansible (for Ubuntu):

```

sudo apt update
sudo apt install ansible
ansible-galaxy install -r requirements.yml

ansible-playbook -i ansible.cfg setup.yml

```
