IMAGE_NAME=api-v1
IMAGE_TAG=latest

.PHONY: build-api run-api stop-api help links

build-api:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) -f ./src/api/Dockerfile .

run-api:
	docker run --rm -d --name $(IMAGE_NAME) -p 8000:8000 $(IMAGE_NAME):$(IMAGE_TAG)

stop-api:
	docker stop $(IMAGE_NAME)

start-project:
	docker compose -p mlops up -d --build

stop-project:
	docker compose -p mlops down -v

run-project:
	# run project
	@echo "Grafana UI: http://localhost:3000"

test-api:
	curl -X POST "https://localhost/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	 --user admin:admin \
     --cacert ./deployments/nginx/certs/nginx.crt;

help:
	@echo "build-api		: Construire l'image"
	@echo "run-api			: Lancer le conteneur"
	@echo "stop-api		: Arrêter/supprimer conteneur"
	@echo "test-api		: test de l'api"
	@echo "run-project		: run du projet"
	@echo "start-project		: Démmarer le projet"
	@echo "stop-project		: Arréter le projet"
