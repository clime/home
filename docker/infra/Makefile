.PHONY : build run run1 sh sh1 start start1 stop stop1 del del1

build:
	docker build -t infra-image .

bld: build

run:
	docker run \
		--privileged \
		-dit \
		-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		-v /home/clime/copr:/home/clime/copr \
		-v /home/clime/infra:/home/clime/infra \
		-v /home/clime/triage:/home/clime/triage \
		-v /home/clime/rpmbuild:/home/clime/rpmbuild \
		-v /home/clime/infra:/srv/web/infra/ansible \
		-v /dev/vg:/dev/vg \
		--name="infra$(tag)" \
		-h infrabox$(tag) \
		infra-image

sh:
	docker exec infra$(tag) rm -f setup-runtime.sh
	docker exec -u clime -it infra$(tag) script -qc 'bash' /dev/null

start:
	docker start infra$(tag)

stop:
	docker stop infra$(tag)

del:
	docker rm -f infra$(tag)


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
