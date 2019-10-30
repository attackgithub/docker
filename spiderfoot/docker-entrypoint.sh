#!/bin/bash
#
#
#
echo ${SPIDERFOOT_PASSWORD} > /home/spiderfoot/passwd
/usr/bin/python /home/spiderfoot/sf.py 0.0.0.0:8080
