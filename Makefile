# ref. https://stackoverflow.com/questions/6273608/how-to-pass-argument-to-makefile-from-command-line/6273809#6273809
exec:
	docker-compose run --rm --service-ports web /bin/sh -c "$(filter-out $@,$(MAKECMDGOALS))"
%:
	@:

build:
	docker-compose build web
setup:
	make build
	make exec yarn install