## Init Docker Swarm
```bash
docker swarm init
```

## Deploy the app
```bash
docker stack deploy app --compose-file=swarm.yml
```

## List down stack
```bash
docker stack ls
```

## List down all containers in stack
```bash
docker stack ps app
```

## List down services in stack
```bash
docker stack services app
```

## Remove Stack
```bash
docker stack rm app
```
