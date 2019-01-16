#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Overlap_4GeV_20190108.py                  ParticleGuns 1000
./run.sh pset_SingleMuon_Overlap2_4GeV_20190108.py                 ParticleGuns 1000
