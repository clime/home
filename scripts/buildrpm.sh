#!/bin/bash
rpmbuild --define "_topdir `pwd`" -ba $1
