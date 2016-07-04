#!/bin/bash

DATE="20160512"
DIR="/home/jlow/L1MuonTrigger/CMSSW_7_6_1/src/L1TMuonSimulations/Configuration/test/"

#ls $DIR*.py | sed 's@'"$DIR"'\(.*\)\.py@cp -p "&" "\1_'"$DATE"'.py"@'
ls $DIR*.py | sed 's@'"$DIR"'\(.*\)\.py@cp -p "&" "\1_'"$DATE"'.py"@' | sh
