# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
.PHONY: docs help test

# Use bash for inline if-statements in arch_patch target
SHELL:=bash
<<<<<<< HEAD
ARCH:=$(shell uname -m)
OWNER?=jupyter

# Need to list the images in build dependency order
ifeq ($(ARCH),ppc64le)
ALL_STACKS:=base-notebook
else
ALL_STACKS:=base-notebook \
=======
OWNER?=jupyter

# Need to list the images in build dependency order

# Images supporting the following architectures:
# - linux/amd64
# - linux/arm64
MULTI_IMAGES:= \
	base-notebook \
	minimal-notebook
# Images that can only be built on the amd64 architecture (aka. x86_64)
AMD64_ONLY_IMAGES:= \
	r-notebook \
	scipy-notebook \
	tensorflow-notebook \
	datascience-notebook \
	pyspark-notebook \
	all-spark-notebook
# All of the images
ALL_IMAGES:= \
	base-notebook \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
	minimal-notebook \
	r-notebook \
	scipy-notebook \
	tensorflow-notebook \
	datascience-notebook \
	pyspark-notebook \
	all-spark-notebook
<<<<<<< HEAD
endif

ALL_IMAGES:=$(ALL_STACKS)

# Dockerfile Linter
HADOLINT="${HOME}/hadolint"
HADOLINT_VERSION="v2.1.0"
=======
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

# Enable BuildKit for Docker build
export DOCKER_BUILDKIT:=1

<<<<<<< HEAD
help:
# http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@echo "jupyter/docker-stacks"
	@echo "====================="
	@echo "Replace % with a stack directory name (e.g., make build/minimal-notebook)"
	@echo
	@grep -E '^[a-zA-Z0-9_%/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

arch_patch/%: ## apply hardware architecture specific patches to the Dockerfile
	@if [ -e ./$(notdir $@)/Dockerfile.$(ARCH).patch ]; then \
		if [ -e ./$(notdir $@)/Dockerfile.orig ]; then \
               		cp -f ./$(notdir $@)/Dockerfile.orig ./$(notdir $@)/Dockerfile;\
		else\
                	cp -f ./$(notdir $@)/Dockerfile ./$(notdir $@)/Dockerfile.orig;\
		fi;\
		patch -f ./$(notdir $@)/Dockerfile ./$(notdir $@)/Dockerfile.$(ARCH).patch; \
	fi

build/%: DARGS?=
build/%: ## build the latest image for a stack
	docker build $(DARGS) --rm --force-rm -t $(OWNER)/$(notdir $@):latest ./$(notdir $@)
	@echo -n "Built image size: "
	@docker images $(OWNER)/$(notdir $@):latest --format "{{.Size}}"

build-all: $(foreach I,$(ALL_IMAGES),arch_patch/$(I) build/$(I) ) ## build all stacks
build-test-all: $(foreach I,$(ALL_IMAGES),arch_patch/$(I) build/$(I) test/$(I) ) ## build and test all stacks

check-outdated/%: ## check the outdated conda packages in a stack and produce a report (experimental)
	@TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest test/test_outdated.py

cont-clean-all: cont-stop-all cont-rm-all ## clean all containers (stop + rm)

cont-stop-all: ## stop all containers
	@echo "Stopping all containers ..."
	-docker stop -t0 $(shell docker ps -a -q) 2> /dev/null

=======


# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@echo "jupyter/docker-stacks"
	@echo "====================="
	@echo "Replace % with a stack directory name (e.g., make build-multi/minimal-notebook)"
	@echo
	@grep -E '^[a-zA-Z0-9_%/-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'



build/%: DARGS?=
build/%: ## build the latest image for a stack using the system's architecture
	@echo "::group::Build $(OWNER)/$(notdir $@) (system's architecture)"
	docker build $(DARGS) --rm --force-rm -t $(OWNER)/$(notdir $@):latest ./$(notdir $@) --build-arg OWNER=$(OWNER)
	@echo -n "Built image size: "
	@docker images $(OWNER)/$(notdir $@):latest --format "{{.Size}}"
	@echo "::endgroup::"
build-all: $(foreach I, $(ALL_IMAGES), build/$(I)) ## build all stacks

# Limitations on docker buildx build (using docker/buildx 0.5.1):
#
# 1. Can't --load and --push at the same time
#
# 2. Can't --load multiple platforms
#
# What does it mean to --load?
#
# - It means that the built image can be referenced by `docker` CLI, for example
#   when using the `docker tag` or `docker push` commands.
#
# Workarounds due to limitations:
#
# 1. We always build a dedicated image using the current system architecture
#    named as OWNER/<stack>-notebook so we always can reference that image no
#    matter what during tests etc.
#
# 2. We always also build a multi-platform image during build-multi that will be
#    inaccessible with `docker tag` and `docker push` etc, but this will help us
#    test the build on the different platform and provide cached layers for
#    later.
#
# 3. We let push-multi refer to rebuilding a multi image with `--push`.
#
#    We can rely on the cached layer from build-multi now even though we never
#    tagged the multi image.
#
# Outcomes of the workaround:
#
# 1. We can keep using the previously defined Makefile commands that doesn't
#    include `-multi` suffix as before.
#
# 2. Assuming we have setup docker/dockerx properly to build in arm64
#    architectures as well, then we can build and publish such images via the
#    `-multi` suffix without needing a local registry.
#
# 3. If we get dedicated arm64 runners, we can test everything separately
#    without needing to update this Makefile, and if all tests succeeds we can
#    do a publish job that creates a multi-platform image for us.
#
build-multi/%: DARGS?=
build-multi/%: ## build the latest image for a stack on both amd64 and arm64
	@echo "::group::Build $(OWNER)/$(notdir $@) (system's architecture)"
	docker buildx build $(DARGS) --rm --force-rm -t $(OWNER)/$(notdir $@):latest ./$(notdir $@) --build-arg OWNER=$(OWNER) --load
	@echo -n "Built image size: "
	@docker images $(OWNER)/$(notdir $@):latest --format "{{.Size}}"
	@echo "::endgroup::"

	@echo "::group::Build $(OWNER)/$(notdir $@) (amd64,arm64)"
	docker buildx build $(DARGS) --rm --force-rm -t build-multi-tmp-cache/$(notdir $@):latest ./$(notdir $@) --build-arg OWNER=$(OWNER) --platform "linux/amd64,linux/arm64"
	@echo "::endgroup::"
build-all-multi: $(foreach I, $(MULTI_IMAGES), build-multi/$(I)) $(foreach I, $(AMD64_ONLY_IMAGES), build/$(I)) ## build all stacks



check-outdated/%: ## check the outdated conda packages in a stack and produce a report (experimental)
	@TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest test/test_outdated.py
check-outdated-all: $(foreach I, $(ALL_IMAGES), check-outdated/$(I)) ## check all the stacks for outdated conda packages



cont-clean-all: cont-stop-all cont-rm-all ## clean all containers (stop + rm)
cont-stop-all: ## stop all containers
	@echo "Stopping all containers ..."
	-docker stop -t0 $(shell docker ps -a -q) 2> /dev/null
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
cont-rm-all: ## remove all containers
	@echo "Removing all containers ..."
	-docker rm --force $(shell docker ps -a -q) 2> /dev/null

<<<<<<< HEAD
=======


>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
dev/%: ARGS?=
dev/%: DARGS?=-e JUPYTER_ENABLE_LAB=yes
dev/%: PORT?=8888
dev/%: ## run a foreground container for a stack
	docker run -it --rm -p $(PORT):8888 $(DARGS) $(OWNER)/$(notdir $@) $(ARGS)

dev-env: ## install libraries required to build docs and run tests
	@pip install -r requirements-dev.txt

<<<<<<< HEAD
docs: ## build HTML documentation
	make -C docs html

git-commit: LOCAL_PATH?=.
git-commit: GITHUB_SHA?=$(shell git rev-parse HEAD)
git-commit: GITHUB_REPOSITORY?=jupyter/docker-stacks
git-commit: GITHUB_TOKEN?=
git-commit: ## commit outstading git changes and push to remote
	@git config --global user.name "GitHub Actions"
	@git config --global user.email "actions@users.noreply.github.com"

	@echo "Publishing outstanding changes in $(LOCAL_PATH) to $(GITHUB_REPOSITORY)" 
	@cd $(LOCAL_PATH) && \
		git remote add publisher https://$(GITHUB_TOKEN)@github.com/$(GITHUB_REPOSITORY).git && \
		git checkout master && \
		git add -A -- . && \
		git commit -m "[ci skip] Automated publish for $(GITHUB_SHA)" || exit 0
	@cd $(LOCAL_PATH) && git push -u publisher master

hook/%: export COMMIT_MSG?=$(shell git log -1 --pretty=%B)
hook/%: export GITHUB_SHA?=$(shell git rev-parse HEAD)
hook/%: export WIKI_PATH?=../wiki
hook/%: ## run post-build hooks for an image
	BUILD_TIMESTAMP="$$(date -u +%FT%TZ)" \
	DOCKER_REPO="$(OWNER)/$(notdir $@)" \
	IMAGE_NAME="$(OWNER)/$(notdir $@):latest" \
	IMAGE_SHORT_NAME="$(notdir $@)" \
	$(SHELL) $(notdir $@)/hooks/run_hook

hook-all: $(foreach I,$(ALL_IMAGES),hook/$(I) ) ## run post-build hooks for all images

img-clean: img-rm-dang img-rm ## clean dangling and jupyter images

img-list: ## list jupyter images
	@echo "Listing $(OWNER) images ..."
	docker images "$(OWNER)/*"

img-rm:  ## remove jupyter images
	@echo "Removing $(OWNER) images ..."
	-docker rmi --force $(shell docker images --quiet "$(OWNER)/*") 2> /dev/null

=======


docs: ## build HTML documentation
	sphinx-build docs/ docs/_build/



hook/%: WIKI_PATH?=../wiki
hook/%: ## run post-build hooks for an image
	python3 -m tagging.tag_image --short-image-name "$(notdir $@)" --owner "$(OWNER)" && \
	python3 -m tagging.create_manifests --short-image-name "$(notdir $@)" --owner "$(OWNER)" --wiki-path "$(WIKI_PATH)"
hook-all: $(foreach I, $(ALL_IMAGES), hook/$(I)) ## run post-build hooks for all images



img-clean: img-rm-dang img-rm ## clean dangling and jupyter images
img-list: ## list jupyter images
	@echo "Listing $(OWNER) images ..."
	docker images "$(OWNER)/*"
img-rm: ## remove jupyter images
	@echo "Removing $(OWNER) images ..."
	-docker rmi --force $(shell docker images --quiet "$(OWNER)/*") 2> /dev/null
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
img-rm-dang: ## remove dangling images (tagged None)
	@echo "Removing dangling images ..."
	-docker rmi --force $(shell docker images -f "dangling=true" -q) 2> /dev/null

<<<<<<< HEAD
hadolint/%: ARGS?=
hadolint/%: ## lint the dockerfile(s) for a stack
	@echo "Linting Dockerfiles in $(notdir $@)..."
	@git ls-files --exclude='Dockerfile*' --ignored $(notdir $@) | grep -v ppc64 | xargs -L 1 $(HADOLINT) $(ARGS)
	@echo "Linting done!"

hadolint-all: $(foreach I,$(ALL_IMAGES),hadolint/$(I) ) ## lint all stacks

hadolint-build-test-all: $(foreach I,$(ALL_IMAGES),hadolint/$(I) arch_patch/$(I) build/$(I) test/$(I) ) ## lint, build and test all stacks

hadolint-install: ## install hadolint
	@echo "Installing hadolint at $(HADOLINT) ..."
	@curl -sL -o $(HADOLINT) "https://github.com/hadolint/hadolint/releases/download/$(HADOLINT_VERSION)/hadolint-$(shell uname -s)-$(shell uname -m)"
	@chmod 700 $(HADOLINT)
	@echo "Installation done!"
	@$(HADOLINT) --version

pre-commit-all: ## run pre-commit hook on all files
	@pre-commit run --all-files

=======


pre-commit-all: ## run pre-commit hook on all files
	@pre-commit run --all-files || (printf "\n\n\n" && git --no-pager diff --color=always)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
pre-commit-install: ## set up the git hook scripts
	@pre-commit --version
	@pre-commit install

<<<<<<< HEAD
pull/%: DARGS?=
pull/%: ## pull a jupyter image
	docker pull $(DARGS) $(OWNER)/$(notdir $@)

push/%: DARGS?=
push/%: ## push all tags for a jupyter image
	docker push --all-tags $(DARGS) $(OWNER)/$(notdir $@)

push-all: $(foreach I,$(ALL_IMAGES),push/$(I) ) ## push all tagged images
=======


pull/%: DARGS?=
pull/%: ## pull a jupyter image
	docker pull $(DARGS) $(OWNER)/$(notdir $@)
pull-all: $(foreach I, $(ALL_IMAGES), pull/$(I)) ## pull all images

push/%: DARGS?=
push/%: ## push all tags for a jupyter image
	@echo "::group::Push $(OWNER)/$(notdir $@) (system's architecture)"
	docker push --all-tags $(DARGS) $(OWNER)/$(notdir $@)
	@echo "::endgroup::"
push-all: $(foreach I, $(ALL_IMAGES), push/$(I)) ## push all tagged images

push-multi/%: DARGS?=
push-multi/%: ## push all tags for a jupyter image that support multiple architectures
	@echo "::group::Push $(OWNER)/$(notdir $@) (amd64,arm64)"
	docker buildx build $(DARGS) --rm --force-rm $($(subst -,_,$(notdir $@))_EXTRA_TAG_ARGS) -t $(OWNER)/$(notdir $@):latest ./$(notdir $@) --build-arg OWNER=$(OWNER) --platform "linux/amd64,linux/arm64" --push
	@echo "::endgroup::"
push-all-multi: $(foreach I, $(MULTI_IMAGES), push-multi/$(I)) $(foreach I, $(AMD64_ONLY_IMAGES), push/$(I)) ## push all tagged images


>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

run/%: DARGS?=
run/%: ## run a bash in interactive mode in a stack
	docker run -it --rm $(DARGS) $(OWNER)/$(notdir $@) $(SHELL)

run-sudo/%: DARGS?=
run-sudo/%: ## run a bash in interactive mode as root in a stack
	docker run -it --rm -u root $(DARGS) $(OWNER)/$(notdir $@) $(SHELL)

<<<<<<< HEAD
test/%: ## run tests against a stack (only common tests or common tests + specific tests)
	@if [ ! -d "$(notdir $@)/test" ]; then TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest -m "not info" test; \
	else TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest -m "not info" test $(notdir $@)/test; fi

test-all: $(foreach I,$(ALL_IMAGES),test/$(I)) ## test all stacks
=======


test/%: ## run tests against a stack (only common tests or common tests + specific tests)
	@echo "::group::test/$(OWNER)/$(notdir $@)"
	@if [ ! -d "$(notdir $@)/test" ]; then TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest -m "not info" test; \
	else TEST_IMAGE="$(OWNER)/$(notdir $@)" pytest -m "not info" test $(notdir $@)/test; fi
	@echo "::endgroup::"
test-all: $(foreach I, $(ALL_IMAGES), test/$(I)) ## test all stacks
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
