#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Overlap_3GeV_20190108.py                  ParticleGuns 1000
./run.sh pset_SingleMuon_Overlap2_3GeV_20190108.py                 ParticleGuns 1000

./run.sh pset_SingleMuon_Endcap_2GeV_20190108.py                   ParticleGuns 2000
./run.sh pset_SingleMuon_Endcap2_2GeV_20190108.py                  ParticleGuns 2000
