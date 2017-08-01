#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

#./run.ntuple.sh ntuple_SingleMuon_PositiveEndCap_20170720.py  ParticleGuns -1

./run.ntuple.sh ntuple_SingleNeutrino_r281707_20170720.py     ParticleGuns -1
./run.ntuple.sh ntuple_SingleNeutrino_PU50_20170720.py        ParticleGuns -1
./run.ntuple.sh ntuple_SingleNeutrino_PU100_20170720.py       ParticleGuns -1
./run.ntuple.sh ntuple_SingleNeutrino_PU140_20170720.py       ParticleGuns -1
./run.ntuple.sh ntuple_SingleNeutrino_PU200_20170720.py       ParticleGuns -1

