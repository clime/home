#!/bin/bash
sudo -u apache COPR_CONFIG=/etc/copr/copr-fe.conf ~/copr/frontend/coprs_frontend/manage.py runserver -h localhost -p 8080
