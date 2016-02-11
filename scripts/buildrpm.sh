#!/bin/bash
rpmbuild --define "_topdir `pwd`" -ba SPECS/$1.spec
