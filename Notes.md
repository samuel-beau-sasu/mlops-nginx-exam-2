# Installation des librairie 
pip install joblib numpy fastapi scikit-learn uvicorn

pip freeze | grep -E "^(fastapi|scikit-learn|uvicorn|numpy|joblib)==" > requirements.txt

# Création du Dockerfile pour api_v1
# Définition du makefile

# création du container et run 
make build-api

make run-api

## test predict 
curl -X POST "http://localhost:8000/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}'

-> {"prediction value":"happiness"}

# Mise en place du Reverse Proxy

- nginx.conf
- /nginx/Dockerfile
- docker-compose.yml


## test predict 
make start-project

curl -X POST "http://localhost:8080/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was not cool!"}'

curl -s -X POST "http://localhost:8080/predict" \
     -H "Content-Type: application/json" \
     -H "X-Experiment-Group: debug" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' 

make stop-project

# 3. Load Balancing

/home/ubuntu/mlops-nginx-exam-2/docker-compose.yml
docker compose -f docker-compose.yml ps

- On pose : -p mlops comme nom du projet 
docker-compose -p mlops logs mlops-api-v1,


Test de validation

## Test v1 (localhost)
curl http://localhost:8080/predict -H "Host: localhost"

## Test v2 (header Host custom)
curl http://localhost:8080/debug -H "Host: X-Experiment-Group"

# Test v1 (sans header spécial)
curl http://localhost:8080/predict

# Test v2 (AVEC header X-Experiment-Group: debug)
curl http://localhost:8080/debug \
  -H "X-Experiment-Group: debug"

curl http://X-Experiment-Group:8080/debug \
  -H "X-Experiment-Group: debug"

# 4. Sécurité et Monitoring



