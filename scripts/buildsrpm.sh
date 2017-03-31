#!/bin/bash
rpmbuild --define "_topdir `pwd`" -bs $1
