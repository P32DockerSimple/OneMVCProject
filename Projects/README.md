docker compose up -d

docker exec -it front /bin/sh

exit 

docker compose down --volumes --rmi all
