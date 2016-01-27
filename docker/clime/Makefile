build:
	docker build -t clime-image .

run:
	docker run --privileged -dit -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name="clime" -h testbox clime-image

sh:
	docker exec -u clime -it clime script -qc 'bash' /dev/null

start:
	docker start clime

stop:
	docker stop clime

del:
	docker rm -f clime
