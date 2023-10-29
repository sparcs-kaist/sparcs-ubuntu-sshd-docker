up:
	@read -p "Enter username: " USERNAME; \
	mkdir -p ./users/$$USERNAME/cred; \
	cp -n ./template/shadow ./users/$$USERNAME/cred/.; \
	USERNAME=$$USERNAME docker-compose --project-name $$USERNAME up --build -d

down:
	@read -p "Enter username: " USERNAME; \
	USERNAME=$$USERNAME docker-compose --project-name $$USERNAME down