build:
	docker-compose -f ./src/docker-compose.yml up --build
	
create-volumes-dirs:
	mkdir -p /home/fmanzana/data
	mkdir -p /home/fmanzana/data/mdb
	mkdir -p /home/fmanzana/data/wp

down:
	docker-compose -f ./src/docker-compose.yml down

re:
	docker-compose -f ./src/docker-compose.yml up -d --build --force-recreate

clean:
	docker-compose -f ./src/docker-compose.yml down --volumes --remove-orphans
	chmod -R 777 /home/fmanzana/data
	rm -rf /home/fmanzana/data

.PHONY: build down re clean create-volumes-dirs
