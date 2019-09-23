#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Endcap_2GeV_PhaseIITDRSpring19_20190923.py     ParticleGuns 1000
./run.sh pset_SingleMuon_Endcap2_2GeV_PhaseIITDRSpring19_20190923.py    ParticleGuns 1000
./run.sh pset_SingleMuon_Displaced_2GeV_PhaseIITDRSpring19_20190923.py  ParticleGuns 1000
./run.sh pset_SingleMuon_Displaced2_2GeV_PhaseIITDRSpring19_20190923.py ParticleGuns 1000
