docker build -t kkaushal09/multi-client:latest -t kkaushal09/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kkaushal09/multi-server:latest -t kkaushal09/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kkaushal09/multi-worker:latest -t kkaushal09/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push kkaushal09/multi-client:latest
docker push kkaushal09/multi-server:latest
docker push kkaushal09/mutli-worker:latest
docker push kkaushal09/multi-client:$SHA
docker push kkaushal09/multi-server:$SHA
docker push kkaushal09/mutli-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=kkaushal09/multi-server:$SHA
kubectl set image deployments/client-deployment client=kkaushal09/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=kkaushal09/multi-worker:$SHA
