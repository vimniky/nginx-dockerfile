VERSION = v$(version)
NS = registry.cn-hangzhou.aliyuncs.com/vimniky
REPO = asean-ui
NAME = asean-ui
INSTANCE = default
PORT = 3001

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .
	@echo Build $(NS)/$(REPO):$(VERSION) successful

push:
	docker push $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)
	docker rm $(NAME)-$(INSTANCE)

run:
	docker run -d --name $(NAME)-$(INSTANCE) -p $(PORT):$(PORT) $(NS)/$(REPO):$(VERSION)

default: build
