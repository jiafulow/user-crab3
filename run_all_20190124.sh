#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

## Running over private input files
#./run.private.sh ntuple_SingleNeutrino_PU140_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleNeutrino_PU200_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleNeutrino_PU250_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleNeutrino_PU300_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleElectron_PU140_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleElectron_PU200_20190124.py  ParticleGuns -1
#./run.private.sh ntuple_SingleMuon_PU140_20190124.py      ParticleGuns -1
#./run.private.sh ntuple_SingleMuon_PU200_20190124.py      ParticleGuns -1
#./run.private.sh ntuple_SinglePhoton_PU140_20190124.py    ParticleGuns -1
#./run.private.sh ntuple_SinglePhoton_PU200_20190124.py    ParticleGuns -1
#./run.private.sh ntuple_SinglePion0_PU140_20190124.py     ParticleGuns -1
#./run.private.sh ntuple_SinglePion0_PU200_20190124.py     ParticleGuns -1
#./run.private.sh ntuple_SinglePion_PU140_20190124.py      ParticleGuns -1
#./run.private.sh ntuple_SinglePion_PU200_20190124.py      ParticleGuns -1
#./run.private.sh ntuple_SingleTau_PU140_20190124.py       ParticleGuns -1
#./run.private.sh ntuple_SingleTau_PU200_20190124.py       ParticleGuns -1

# Running over published datasets
#./run.mc.sh ntuple_SingleNeutrino_PU140_20190124.py  /SingleNeutrino/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SingleNeutrino_PU200_20190124.py  /SingleNeutrino/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SingleNeutrino_PU250_20190124.py  /SingleNeutrino/PhaseIIFall17D-L1TPU250_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SingleNeutrino_PU300_20190124.py  /SingleNeutrino/PhaseIIFall17D-L1TPU300_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SingleElectron_PU140_20190124.py  /SingleE_FlatPt-2to100/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SingleElectron_PU200_20190124.py  /SingleE_FlatPt-2to100/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SingleMuon_PU140_20190124.py      /SingleMu_FlatPt-2to100/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SingleMuon_PU200_20190124.py      /SingleMu_FlatPt-2to100/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SinglePhoton_PU140_20190124.py    /SinglePhoton_FlatPt-8to150/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
./run.mc.sh ntuple_SinglePhoton_PU200_20190124.py    /SinglePhoton_FlatPt-8to150/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SinglePion0_PU140_20190124.py     /SinglePion0_FlatPt-8to100/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SinglePion0_PU200_20190124.py     /SinglePion0_FlatPt-8to100/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SinglePion_PU140_20190124.py      /SinglePion_FlatPt-2to100/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SinglePion_PU200_20190124.py      /SinglePion_FlatPt-2to100/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SingleTau_PU140_20190124.py       /SingleTau_FlatPt-2to150/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1
#./run.mc.sh ntuple_SingleTau_PU200_20190124.py       /SingleTau_FlatPt-2to150/PhaseIIFall17D-L1TPU200_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW -1

## Using whitelists
#rm -rf crab_projects/crab_ntuple_SingleNeutrino_PU140/
#crab submit -c crab_ntuple_SingleNeutrino_PU140.py
#cp crab_ntuple_SingleNeutrino_PU140.py crab_projects/crab_ntuple_SingleNeutrino_PU140/
#
#rm -rf crab_projects/crab_ntuple_SingleNeutrino_PU200/
#crab submit -c crab_ntuple_SingleNeutrino_PU200.py
#cp crab_ntuple_SingleNeutrino_PU200.py crab_projects/crab_ntuple_SingleNeutrino_PU200/
#
#rm -rf crab_projects/crab_ntuple_SingleNeutrino_PU250/
#crab submit -c crab_ntuple_SingleNeutrino_PU250.py
#cp crab_ntuple_SingleNeutrino_PU250.py crab_projects/crab_ntuple_SingleNeutrino_PU250/
#
#rm -rf crab_projects/crab_ntuple_SingleNeutrino_PU300/
#crab submit -c crab_ntuple_SingleNeutrino_PU300.py
#cp crab_ntuple_SingleNeutrino_PU300.py crab_projects/crab_ntuple_SingleNeutrino_PU300/
