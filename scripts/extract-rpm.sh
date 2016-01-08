#!/bin/bash

rpm2cpio $* | cpio -idmv
