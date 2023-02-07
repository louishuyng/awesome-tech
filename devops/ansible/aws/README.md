### Setup
```bash
ansible-playbook create_vpc.yaml
ansible-playbook create_linux_ec2.yaml
```

### Run Ping
```bash
ansible-playbook ping.yaml -i <Public Ip Address>,
```

### Destroy ALL
```bash
ansible-playbook destroy_all.yaml
```
