.ONESHELL:
up:
	@read -p "Enter username: " USERNAME; \
	read -p "SSH Port: " SSH_PORT; \
	mkdir -p ./users/$$USERNAME/cred; \
	cp -n ./template/shadow ./users/$$USERNAME/cred/.; \
	docker network ls|grep $$USERNAME-network > /dev/null || docker network create $$USERNAME-network; \
	USERNAME=$$USERNAME SSH_PORT=$$SSH_PORT docker-compose --project-name $$USERNAME up --build -d

down:
	@read -p "Enter username: " USERNAME; \
	USERNAME=$$USERNAME SSH_PORT=1 docker-compose --project-name $$USERNAME down

ps:
	@docker ps | grep sshd-server