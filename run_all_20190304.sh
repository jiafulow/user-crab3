#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh step1_SingleMuon_Endcap_2GeV_20190304.py                   ParticleGuns 1000
./run.sh step1_SingleMuon_Endcap2_2GeV_20190304.py                  ParticleGuns 1000

./run.sh step1_SingleMuon_Overlap_3GeV_20190304.py                  ParticleGuns 1000
./run.sh step1_SingleMuon_Overlap2_3GeV_20190304.py                 ParticleGuns 1000

./run.sh step1_SingleMuon_FlatPt_Endcap_2GeV_20190304.py            ParticleGuns 50
./run.sh step1_SingleMuon_FlatPt_Endcap2_2GeV_20190304.py           ParticleGuns 50
