### Install

```
docker image build --no-cache -t docker-health-java-jar:latest .
```

```
docker stop <running container (if exists)>
```

```
docker run -d --restart unless-stopped --network host -p 8444:8444 docker-java-jar:latest
```

### Enter the container

```
docker exec -it elegant_swanson /bin/sh
```

### Test Api calls to

```
http://xxx.xxx.xxx.xxx:8444/
```
