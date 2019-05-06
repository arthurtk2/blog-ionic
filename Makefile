requirements:
	@docker -v > /dev/null 2>&1 || { echo >&2 "I require docker but it's not installed. See : https://www.docker.com/"; exit 127;}
	@docker-compose -v > /dev/null 2>&1 || { echo >&2 "I require docker-compose but it's not installed. See : https://docs.docker.com/compose/install/"; exit 127;}

###################
# DOCKER
###################

docker-build: requirements
	@docker-compose build

docker-up: requirements
	@docker-compose up -d

docker-stop: requirements
	@docker-compose stop

docker-start: requirements
	@docker-compose start

bash: requirements
	@docker exec -it ionic_pessoal_app_1 bash

###################
# IONIC
###################

ionic_help: requirements
	@docker exec -it ionic_app_1 sh -c "cd /www/app/ && ionic --help"

ionic_serve: requirements
	@docker exec -it ionic_app_1 sh -c "cd /www/app/ && ionic serve --no-open"

ionic_build: requirements
	@docker exec -it ionic_app_1 sh -c "cd /www/app/ && cordova build android --verbose"