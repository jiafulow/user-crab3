#!/bin/bash

DATE="20160704"
DIR="/home/jlow/L1MuonTrigger/CMSSW_8_0_9/src/L1TMuonSimulations/Configuration/test/"

#ls $DIR*.py | sed 's@'"$DIR"'\(.*\)\.py@cp -p "&" "\1_'"$DATE"'.py"@'
ls $DIR*.py | sed 's@'"$DIR"'\(.*\)\.py@cp -p "&" "\1_'"$DATE"'.py"@' | sh
