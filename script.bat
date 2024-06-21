echo "criando as imagens para projeto hubernetes"
docker build -t ro85pereira/projeto-backend:2.0 backend/.
docker build -t ro85pereira/projeto-database:2.0  database/.

echo "Realizando o push das imagens"

docker push ro85pereira/projeto-backend:2.0
docker push ro85pereira/projeto-backend:2.0

echo "Criando os servicos no cluster kubernetes"

kubectl apply -f ./services.yml

echo "Criando os deployments"

kubectl apply -f ./loadbalancer-deployment.yml
kubectl apply -f ./app-deployment.yml
kubectl apply -f ./mysql-deployment.yml --record


