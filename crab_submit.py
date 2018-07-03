#!/usr/bin/env python

##############################################
# Why 'crab submit -c crab.py' doesn't work!??
##############################################

# Copied from /cvmfs/cms.cern.ch/crab3/slc6_amd64_gcc493/cms/crabclient/3.3.1805.patch1/bin/crab
#             /cvmfs/cms.cern.ch/crab3/slc6_amd64_gcc493/cms/crabclient/3.3.1805.patch1/lib/python2.7/site-packages/CRABClient/ClientUtilities.py

from CRABClient.CRABOptParser import CRABOptParser
from CRABClient.ClientUtilities import initLoggers, getAvailCommands
tblogger, logger, memhandler = initLoggers()
subCommands = getAvailCommands()
parser = CRABOptParser(subCommands)
(options, args) = parser.parse_args(['submit', '-c','crab.py'])

sub_cmd = subCommands['submit']
cmd = sub_cmd(logger, args[1:])
ret = cmd()
print ret
logger.info("Task name: %s" % ret['uniquerequestname'])
