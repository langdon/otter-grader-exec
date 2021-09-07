BASE_IMAGE := fedora-minimal
IMAGE_NAME := otter-grader-exec
CONTAINER_FNAME := Containerfile

help:
	@echo "make build - Build and locally tag a new image."
	@echo "make build-force - Use a no-cache build"
	@echo "make run - will print the command to run $(IMAGE_NAME)"

build:
	@podman build -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) .

build-force:
	@podman pull $(BASE_IMAGE)
	@podman build  -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) --no-cache .

run: #you can't easily pass args to a make target
	@echo execute the following and add your parameter:
	@echo podman run --rm -it -v ${PWD}:/workdir:z $(IMAGE_NAME)
