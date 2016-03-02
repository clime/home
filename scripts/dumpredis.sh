#!/bin/bash
redis-cli save &> /dev/null
rdb --command json /var/lib/redis/dump.rdb | python -mjson.tool
