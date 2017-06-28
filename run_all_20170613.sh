#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

#./run.sh pset_SingleMuon_PositiveEndCap_20170613.py                ParticleGuns 200

#./run.sh pset_MinBias_TuneCUETP8M1_14TeV-pythia8_20170613.py       MinBias      200

./run.sh pset_SingleNeutrino_20170613.py                       ParticleGuns 200
