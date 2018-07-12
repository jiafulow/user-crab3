#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Toy_2GeV_20180702.py                  ParticleGuns 2000
./run.sh pset_SingleMuon_Toy2_2GeV_20180702.py                 ParticleGuns 2000
