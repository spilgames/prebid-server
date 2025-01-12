# Makefile
APP=prebid-server


PROJECT-TYPE=other
CONTAINER_PORTS=-p 5000:8000/tcp
BUILD_CREDENTIALS=true

# overrides
.ME-postup=off
.ME-up=off
.ME-test=off


# Include common makefile
-include microservices-ext/make/Makefile-common.mk

# Or get it, if it's not there
GITURL:=$(shell git remote -v | awk '{sub("8/.*", "8/", $$2); print $$2}' | head -1)
$(.ME-ext)microservices-ext:
	git clone -q https://github.com/spilgames/microservices-ext
	-@test "`grep microservices-ext .gitignore`" || echo "microservices-ext/" >> .gitignore
	@make $(MAKECMDGOALS)


test:
	@curl -i '$(DOCKER_HOST_IP):5000' | grep 200
