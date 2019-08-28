#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh step1_SingleMuon_Displaced_2GeV_20190828.py                   ParticleGuns 1000
./run.sh step1_SingleMuon_Displaced2_2GeV_20190828.py                  ParticleGuns 1000
