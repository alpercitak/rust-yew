clean:
	docker-compose down -v

deploy: clean
	docker-compose up --build