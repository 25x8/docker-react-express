init:
	@make down
	@make build
	@make api-install
	@make frontend-install
	@make up


init-clear:
	@make down
	@make build
	@make create-react-app
	@make create-express-app
	@make up

up:
	docker-compose up -d

build:
	docker-compose build --no-cache

down:
	docker-compose down --remove-orphans

frontend-install:
	docker-compose run --rm frontend-cli npm install

api-install:
	docker-compose run --rm api-cli npm install

create-react-app:
	docker-compose run --rm create-react-app create-react-app . --use-npm

create-express-app:
	docker-compose run --rm create-express-app npm init -y
	docker-compose run --rm create-express-app npm install express
	cp docker/development/create-express-app/server.js api/