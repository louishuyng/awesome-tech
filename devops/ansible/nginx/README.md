### Setup Nginx
```bash
# Replace the <Public IP Address> with the 
# remote Linux server's IP Address
ansible-playbook configure_nginx_web_server.yml -i <Public Ip Address>, -vvv
```
