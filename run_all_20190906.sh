#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

## Running over private input files
## Last argument is used for unitsPerJob, instead of njobs
#./run.private.sh ntuple_MuMu_FlatPt_PU0_PhaseIITDRSpring19_20190906.py          ParticleGuns 5
#./run.private.sh ntuple_MuMu_FlatPt_PU200_PhaseIITDRSpring19_20190906.py        ParticleGuns 10
#./run.private.sh ntuple_SingleNeutrino_PU200_PhaseIITDRSpring19_20190906.py     ParticleGuns 20
#./run.private.sh ntuple_SingleNeutrino_PU200_PhaseIIMTDTDRAutumn18_20190906.py  ParticleGuns 20

## Running over published datasets
#./run.mc.sh ntuple_MuMu_FlatPt_PU0_PhaseIITDRSpring19_20190906.py          /Mu_FlatPt2to100-pythia8-gun/PhaseIITDRSpring19DR-NoPU_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW       5
#./run.mc.sh ntuple_MuMu_FlatPt_PU200_PhaseIITDRSpring19_20190906.py        /Mu_FlatPt2to100-pythia8-gun/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v2/GEN-SIM-DIGI-RAW      10
#./run.mc.sh ntuple_MuMu_FlatPt_PU300_PhaseIITDRSpring19_20190906.py        /Mu_FlatPt2to100-pythia8-gun/PhaseIITDRSpring19DR-PU300_106X_upgrade2023_realistic_v3_ext1-v2/GEN-SIM-DIGI-RAW 120

./run.mc.sh ntuple_SingleNeutrino_PU200_PhaseIITDRSpring19_20190906.py     /Nu_E10-pythia8-gun/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v3/GEN-SIM-DIGI-RAW      20
./run.mc.sh ntuple_SingleNeutrino_PU140_PhaseIITDRSpring19_20190906.py     /Nu_E10-pythia8-gun/PhaseIITDRSpring19DR-PU140_106X_upgrade2023_realistic_v3_ext3-v1/GEN-SIM-DIGI-RAW 20
./run.mc.sh ntuple_SingleNeutrino_PU250_PhaseIITDRSpring19_20190906.py     /Nu_E10-pythia8-gun/PhaseIITDRSpring19DR-PU250_106X_upgrade2023_realistic_v3_ext2-v1/GEN-SIM-DIGI-RAW 20
./run.mc.sh ntuple_SingleNeutrino_PU300_PhaseIITDRSpring19_20190906.py     /Nu_E10-pythia8-gun/PhaseIITDRSpring19DR-PU300_106X_upgrade2023_realistic_v3_ext1-v2/GEN-SIM-DIGI-RAW 20

#./run.mc.sh ntuple_SingleNeutrino_PU200_PhaseIIMTDTDRAutumn18_20190906.py  /NeutrinoGun_E_10GeV/PhaseIIMTDTDRAutumn18DR-PU200_103X_upgrade2023_realistic_v2-v1/FEVT              30

#./run.mc.sh ntuple_DoubleElectron_PU140_PhaseIITDRSpring19_20190906.py     /DoubleElectron_FlatPt-1To100/PhaseIITDRSpring19DR-PU140_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW 20
#./run.mc.sh ntuple_DoubleElectron_PU200_PhaseIITDRSpring19_20190906.py     /DoubleElectron_FlatPt-1To100/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW 20
#./run.mc.sh ntuple_DoublePhoton_PU140_PhaseIITDRSpring19_20190906.py       /DoublePhoton_FlatPt-1To100/PhaseIITDRSpring19DR-PU140_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW   20
#./run.mc.sh ntuple_DoublePhoton_PU200_PhaseIITDRSpring19_20190906.py       /DoublePhoton_FlatPt-1To100/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW   20
#./run.mc.sh ntuple_SingleElectron_PU200_PhaseIITDRSpring19_20190906.py     /SingleElectron_PT2to100/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW      10
#./run.mc.sh ntuple_SinglePhoton_PU200_PhaseIITDRSpring19_20190906.py       /PhotonFlatPt8To150/PhaseIITDRSpring19DR-PU200_106X_upgrade2023_realistic_v3-v1/GEN-SIM-DIGI-RAW           10

