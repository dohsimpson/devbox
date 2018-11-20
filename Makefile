build:
	docker build --no-cache -t dohsimpson/devbox .

build1:
	docker build -t dohsimpson/devbox .

push:
	docker push dohsimpson/devbox
