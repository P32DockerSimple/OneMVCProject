docker compose up -d

docker exec -it front /bin/sh

exit 

docker compose down --volumes --rmi all

docker stop $(docker ps -aq)
 
docker rm $(docker ps -aq)
 

#Encoding files

# Run app
```
dos2unix build_and_push.sh
chmod +x build_and_push.sh
./build_and_push.sh
```

# image docker hub
```
docker compose pull
docker compose up -d
```