#!/bin/bash
rpmbuild --define "_sourcedir `pwd`" -ba $1
