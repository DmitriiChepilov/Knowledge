## run redis

```bash
docker run --restart=always -d --name redis_1 -p 127.0.0.1:6379:6379 redis redis-server
```

## show all images

```bash
& "C:\Program Files\docker\docker.exe" images
```

## Run docker without 'Docker Descktop'

1. download exe fiels (docker.exe & dockerd.exe)
1. add them to PATH
1. run commands

```bash
#Register Docker Daemon as service (as Administrator):
dockerd.exe --register-service

#Start the service:
Start-Service docker
```

## Import from a local archive

```bash
docker import /path/to/exampleimage.tgz
```


## Links
[Docker Containerization without Docker Desktop](https://medium.com/@polingtonalphonse/docker-containerization-without-docker-desktop-b65e35a1059c)