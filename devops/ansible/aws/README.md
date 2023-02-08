### Setup
```bash
ansible-playbook create_vpc.yaml
ansible-playbook create_linux_ec2.yaml
```

### Encrpyt file
```bash
ansible-vault encrypt group_vars/linux.yml
```

### Run Ping
```bash
ansible-playbook ping.yaml -i hosts --limit linux --ask-vault-pass
```

### Destroy ALL
```bash
ansible-playbook destroy_all.yaml
```
