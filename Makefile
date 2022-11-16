SHELL := /bin/zsh

include grpc-config.mk

migratedb:
	@echo "[${MS_GREEN}Migrating database...${MS_NC}]" && \
    npm run db:migrate

pushdb:
	@echo "[${MS_GREEN}Pushing database...${MS_NC}]" && \
	npm run db:push

up:
	@echo "[${MS_GREEN}Starting up containers${MS_NC}]" && docker-compose up -d


down:
	@echo "[${MS_GREEN}Stopping containers${MS_NC}]" &&  docker-compose down


# generate the TypeScript from proto files
.PHONY: build
build: check_file_existence
	@echo -e "[${MS_GREEN}Building the TypeScript files${MS_NC}]"
	@chmod +x proto-gen.sh && ./proto-gen.sh;
	@echo -e "[${MS_GREEN}Done Building the TypeScript files${MS_NC}]"

runserver:
	@echo -e "[${MS_GREEN}Starting server...${MS_NC}]"
	@npm run start:server


runclient:
	@echo -e "[${MS_GREEN}Starting client...${MS_NC}]"
	@npm run start:client

# if file doesn't exist exit
check_file_existence:
	@test -f proto-gen.sh || (echo -e "[${MS_RED}proto-gen.sh file does not exist${MS_NC}]" && exit 1)



