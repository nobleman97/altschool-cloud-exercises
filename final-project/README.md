# Final-Project: Deploy Laravel Application with Apache Using Ansible 

### Resources Used...
- https://www.digitalocean.com/community/tutorials/how-to-use-ansible-to-install-and-set-up-apache-on-ubuntu-18-04
- 

Dependencies:
- php8.1, composer, apache, php8.1-mysql, php8.1-xml,php8.1-curl
- 
- 
- 

```
export ANSIBLE_INVENTORY=/home/david/Documents/altschool/projects/final-project/inventory.yaml
```

Ping server
``` shell
ansible --private-key ~/.ssh/Zuri_droplet -u root web -m ping
```
``` sh
ansible-playbook --private-key ~/.ssh/Zuri_droplet -u root play.yaml --check
```