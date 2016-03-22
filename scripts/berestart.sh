#!/bin/bash
sudo systemctl restart copr-backend-jobgrab.service copr-backend-log.service copr-backend.service copr-backend-vmm.service redis.service
sudo journalctl -x -n 20 -u copr-backend
sleep 1
sudo systemctl list-units | grep copr
