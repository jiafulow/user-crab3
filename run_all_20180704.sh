#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.ntuple.sh ntuple_SingleNeutrino_PU140_20180704.py       ParticleGuns -1
./run.ntuple.sh ntuple_SingleNeutrino_PU200_20180704.py       ParticleGuns -1
./run.ntuple.sh ntuple_SingleMuon_PU140_20180704.py           ParticleGuns -1
./run.ntuple.sh ntuple_SingleMuon_PU200_20180704.py           ParticleGuns -1
./run.ntuple.sh ntuple_SingleElectron_PU140_20180704.py       ParticleGuns -1
./run.ntuple.sh ntuple_SingleElectron_PU200_20180704.py       ParticleGuns -1
./run.ntuple.sh ntuple_SinglePhoton_PU140_20180704.py         ParticleGuns -1
./run.ntuple.sh ntuple_SinglePhoton_PU200_20180704.py         ParticleGuns -1
