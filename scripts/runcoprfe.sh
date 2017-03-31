#!/bin/bash
COPR_CONFIG=/etc/copr/copr-fe.conf ~/copr/frontend/coprs_frontend/manage.py runserver -h 0.0.0.0 -p 8080
