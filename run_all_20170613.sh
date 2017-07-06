#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

#./run.sh pset_SingleMuon_PositiveEndCap_20170613.py                ParticleGuns 200

#./run.sh pset_MinBias_TuneCUETP8M1_14TeV-pythia8_20170613.py       MinBias      200

#./run.sh pset_SingleNeutrino_PU50_20170613.py                       ParticleGuns 200
#./run.sh pset_SingleNeutrino_PU100_20170613.py                      ParticleGuns 200
#./run.sh pset_SingleNeutrino_PU140_20170613.py                      ParticleGuns 200
./run.sh pset_SingleNeutrino_PU200_20170613.py                      ParticleGuns 200
