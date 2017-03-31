#!/bin/bash
docker exec infra$(tag) cp /etc/resolv.conf /etc/resolv.conf.bak
docker exec infra$(tag) umount /etc/resolv.conf || true
docker exec infra$(tag) cp /etc/resolv.conf.bak /etc/resolv.conf
docker exec infra$(tag) rm -f /run/nologin
