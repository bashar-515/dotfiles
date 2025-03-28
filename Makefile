-include etc/.env
export

.PHONY: build run

build:
	docker build --build-arg USERNAME=${USERNAME} -t ${IMAGE_NAME} .

run:
	docker run --hostname=${HOSTNAME} --rm -it ${IMAGE_NAME}
