#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Displaced_8GeV_20181106.py                  ParticleGuns 1000
./run.sh pset_SingleMuon_Displaced2_8GeV_20181106.py                 ParticleGuns 1000
