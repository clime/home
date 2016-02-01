#!/bin/bash
rpmbuild --define "_topdir /home/clime/$1/build/bdist.linux-x86_64/rpm" -bs SPECS/$1.spec
