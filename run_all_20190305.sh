#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

## Running over private input files
## Last argument is used for unitsPerJob, instead of njobs
./run.private.sh ntuple_SingleMuon_Endcap_2GeV_20190305.py      ParticleGuns 20
./run.private.sh ntuple_SingleMuon_Endcap2_2GeV_20190305.py     ParticleGuns 20
./run.private.sh ntuple_SingleMuon_Overlap_3GeV_20190305.py     ParticleGuns 20
./run.private.sh ntuple_SingleMuon_Overlap2_3GeV_20190305.py    ParticleGuns 20

./run.private.sh ntuple_SingleMuon_FlatPt_Endcap_2GeV_20190305.py      ParticleGuns 20
./run.private.sh ntuple_SingleMuon_FlatPt_Endcap2_2GeV_20190305.py     ParticleGuns 20
