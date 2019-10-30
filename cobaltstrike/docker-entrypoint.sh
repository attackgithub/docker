#!/bin/bash
#
#
#

IPADDRESS="$(ip address | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d''/)"

cd /opt/cobaltstrike
token=`curl -s https://www.cobaltstrike.com/download -d "dlkey=${COBALTSTRIKE_KEY}" | grep 'href="/downloads/' | cut -d '/' -f3`
curl -s https://www.cobaltstrike.com/downloads/${token}/cobaltstrike-trial.tgz -o /tmp/cobaltstrike.tgz
tar zxf /tmp/cobaltstrike.tgz -C /opt
echo $COBALTSTRIKE_KEY > ~/.cobaltstrike.license
/opt/cobaltstrike/update
/opt/cobaltstrike/teamserver $IPADDRESS ${COBALTSTRIKE_PASS} /opt/cobaltstrike/profiles/${COBALTSTRIKE_PROFILE}.profile ${COBALTSTRIKE_EXP}