#!/bin/bash
cd ~/copr/frontend/coprs_frontend
COPR_CONFIG="$(pwd)/config/copr_unit_test.conf" python -m pytest tests/test_views/test_coprs_ns/test_coprs_builds.py -s -k test_copr_allowed_user_can_add_build
