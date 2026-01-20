# Build Docker image in ubuntu
```
wsl --list --verbose
wsl -d Ubuntu-24.04
mc
ifconfig

git clone https://github.com/P32DockerSimple/OneMVCProject.git

cd OneMVCProject
ls
docker images

docker build -t malvina-mvc .
docker login

docker images

docker tag malvina-mvc:latest novakvova/malvina-mvc:latest
docker images

docker push novakvova/malvina-mvc:latest

docker rmi novakvova/malvina-mvc:latest
docker rmi malvina-mvc

docker ps -a
docker stop 
docker rm

```

#Pull and Run project ASP.NET Core with Docker Hub
```
docker images
docker pull novakvova/malvina-mvc
docker images
docker run -d --restart=always --name malvina-mvc_container -p 5898:8080 novakvova/malvina-mvc
docker ps -a
```

# Pull postgres image run container Ubuntu 24.04
```
docker pull postgres:17.7
docker images

docker run --name container-postgres \
	--restart=always \
	-e POSTGRES_PASSWORD=p%rSDj4Imds07djc**dmUntdOidd3dZ_#WTi4B9Zo \
	-e POSTGRES_USER=halosh \
	-p 5024:5432 \
	-d postgres:17.7

docker stop container-postgres
docker rm container-postgres
``` 

# Підключення до контейнера
```
docker exec -it 379a672d8f08 /bin/bash
apt update
exit
```

# Install dotnet server
sudo add-apt-repository ppa:dotnet/backports

sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-10.0

# Run server command
dotnet dev-certs https --clean
dotnet dev-certs https -ep cert.pfx -p StrongPassword123
dotnet dev-certs https --trust

copy to folder /volumes/pizushi-asp/certs

#opitons nginx /etc/nginx/sites-available/default

server {
    server_name   task.itstep.click *.task.itstep.click;
    client_max_body_size 200M;
    location / {
       proxy_pass         https://localhost:4179;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }


    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/task.itstep.click/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/task.itstep.click/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}