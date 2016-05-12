#!/usr/bin/env python2

import subprocess
import argparse
import sys
import os
import logging

sys.path.append(
    os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
)

from coprs import db, app


parser = argparse.ArgumentParser(description='Download PyPI packages')

parser.add_argument('-d', '--debug', action='store_true', default=False,
                   help='log to stdout (in addition to logging to a file)')
parser.add_argument('-v', '--version', action='version', version='1.0',
                   help='print program version and exit')

args = parser.parse_args()

logging.basicConfig(
    filename="/var/log/copr/pypi_pkg_downloader.log",
    format='[%(asctime)s][%(levelname)6s]: %(message)s',
    level=logging.DEBUG)
log = logging.getLogger(__name__)

if args.debug:
    stream_handler = logging.StreamHandler(sys.stdout)
    log.addHandler(stream_handler)

def run_cmd(cmd):
    """
    Run given command in a subprocess
    """
    log.info('Executing: '+' '.join(cmd))
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (stdout, stderr) = process.communicate()
    if process.returncode != 0:
        log.error(stderr)
        sys.exit(1)
    return stdout

if __name__ == '__main__':
    log.info('Hello world!')
