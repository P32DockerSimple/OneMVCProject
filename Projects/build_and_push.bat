@echo off

REM ==== WEB ====
cd my-transfer-ts
docker build -t transfer-react --build-arg VITE_API_BASE_URL=http://172.25.120.137:5898 .
docker tag transfer-react:latest novakvova/transfer-react:latest
docker push novakvova/transfer-react:latest

REM ==== API ====
cd ..\WebApiTransfer
docker build -t transfer-api .
docker tag transfer-api:latest novakvova/transfer-api:latest
docker push novakvova/transfer-api:latest

echo DONE
pause
