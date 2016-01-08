#!/usr/bin/env python

import subprocess

def timeout(p):
    if p.poll() is None:
        try:
            p.kill()
            print 'Error: process taking too long to complete--terminating'
        except OSError as e:
            if e.errno != errno.ESRCH:
                raise

proc = subprocess.Popen(['/bin/echo', 'foo'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

t = threading.Timer(10.0, timeout, [proc])
t.start()
t.join()

t.cancel()
