
all:
	docker-compose -f ./src/docker-compose.yml up --build

down:
	docker-compose -f ./src/docker-compose.yml down

re:
	docker-compose -f ./src/docker-compose.yml up -d --build --force-recreate

clean:
	sudo rm -rf /home/fmanzana/data/wp/*
	sudo rm -rf /home/fmanzana/data/mdb/*

.PHONY: all down re clean
