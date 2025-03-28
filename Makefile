-include etc/.env
export

.PHONY: build run

build:
	docker build --no-cache --build-arg USERNAME=${USERNAME} -t ${IMAGE_NAME} .

run:
	docker run --hostname=${HOSTNAME} --rm -it ${IMAGE_NAME}
