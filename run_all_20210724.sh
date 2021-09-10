#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

# Run MC sample generation
./run.sh p/pset_SingleMuon_PosEnd_2GeV_Phase2HLTTDRSummer20_20210724.py ParticleGuns 1000
./run.sh p/pset_SingleMuon_NegEnd_2GeV_Phase2HLTTDRSummer20_20210724.py ParticleGuns 1000

# Run on published datasets
# Note: last argument is used for unitsPerJob (how many files per job), instead of njobs
./run.mc.sh p/pset_SingleNeutrino_PU200_Phase2HLTTDRSummer20_20210724.py /MinBias_TuneCP5_14TeV-pythia8/Phase2HLTTDRSummer20ReRECOMiniAOD-PU200_111X_mcRun4_realistic_T15_v1-v1/FEVT 40
./run.mc.sh p/pset_SingleNeutrino_PU200_ext1_Phase2HLTTDRSummer20_20210724.py /MinBias_TuneCP5_14TeV-pythia8/Phase2HLTTDRSummer20ReRECOMiniAOD-PU200_withNewMB_111X_mcRun4_realistic_T15_v1_ext1-v2/FEVT 40

./run.mc.sh p/pset_DoubleMuon_PU140_Phase2HLTTDRSummer20_20210724.py /DoubleMuon_gun_FlatPt-1To100/Phase2HLTTDRSummer20ReRECOMiniAOD-PU140_111X_mcRun4_realistic_T15_v1-v1/FEVT 30
./run.mc.sh p/pset_DoubleMuon_PU200_Phase2HLTTDRSummer20_20210724.py /DoubleMuon_gun_FlatPt-1To100/Phase2HLTTDRSummer20ReRECOMiniAOD-PU200_111X_mcRun4_realistic_T15_v1-v1/FEVT 30
./run.mc.sh p/pset_DoublePhoton_PU140_Phase2HLTTDRSummer20_20210724.py /DoublePhoton_FlatPt-1To100/Phase2HLTTDRSummer20ReRECOMiniAOD-PU140_111X_mcRun4_realistic_T15_v1_ext1-v2/FEVT 60
./run.mc.sh p/pset_DoublePhoton_PU200_Phase2HLTTDRSummer20_20210724.py /DoublePhoton_FlatPt-1To100/Phase2HLTTDRSummer20ReRECOMiniAOD-PU200_111X_mcRun4_realistic_T15_v1_ext1-v2/FEVT 60
./run.mc.sh p/pset_DoublePhoton_PU200_ext2_Phase2HLTTDRSummer20_20210724.py /DoublePhoton_FlatPt-1To100/Phase2HLTTDRSummer20ReRECOMiniAOD-PU200_111X_mcRun4_realistic_T15_v1_ext2-v3/FEVT 60
