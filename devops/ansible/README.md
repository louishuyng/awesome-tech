### Setup Environment
> Copy your aws credentials to .env
```bash
cp dev.env.example dev.env
```

### Build
```bash
docker-compose up -d ansible
```

### Test Connection With AWS
```bash
docker-compose exec -it ansible /bin/bash

ansible localhost -m aws_caller_info
```
