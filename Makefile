all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

status:
	@docker ps -la
	@docker images

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	for network in $$(docker network ls --format "{{.Name}}" | grep -vE '^(bridge|host|none)'); do \
    	docker network rm $$network; \
    done

deepclean:
	yes | docker system prune

.PHONY: all re down clean
