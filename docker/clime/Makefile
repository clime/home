.PHONY : build build1 run run1 sh sh1 start start1 stop stop1 del del1

build:
	docker build -t clime-image .

run:
	docker run \
		--privileged \
		-dit \
		-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		-v /home/clime/copr:/home/clime/copr \
		-v /home/clime/beaker:/home/clime/beaker \
		--name="clime$(tag)" \
		-h testbox$(tag) \
		clime-image

sh:
	docker exec clime$(tag) rm -f /run/nologin
	docker exec -u clime -it clime$(tag) script -qc 'bash' /dev/null

start:
	docker start clime$(tag)

stop:
	docker stop clime$(tag)

del:
	docker rm -f clime$(tag)


build1: tag = 1
build1: build

run1: tag = 1
run1: run

sh1: tag = 1
sh1: sh

start1: tag = 1
start1: start

stop1: tag = 1
stop1: stop

del1: tag = 1
del1: del
