#!/bin/bash
rpmbuild --define "_topdir `pwd`" -bb $1
