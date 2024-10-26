HUB ?= docker.io/peterpetrek#your dockerhub profile

.PHONY: docker-build
docker-build:
	docker build . -t ${HUB}/addnumber-client:latest

.PHONY: docker-push
docker-push:
	docker push ${HUB}/addnumber-client:latest
