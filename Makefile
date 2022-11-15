#create PHONY command up
.PHONY: up
up:
	docker-compose up -d

#create PHONY command down
.PHONY: down
down:
	docker-compose down


