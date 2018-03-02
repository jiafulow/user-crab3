#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

./run.sh pset_SingleMuon_Toy_20171004.py                       ParticleGuns 100
./run.sh pset_SingleMuon_Toy_0T_20171004.py                    ParticleGuns 100
./run.sh pset_SingleMuon_Toy_0M_20171004.py                    ParticleGuns 100
./run.sh pset_SingleMuon_Toy_5GeV_20171004.py                  ParticleGuns 2000
./run.sh pset_SingleMuon_Toy_3GeV_20171004.py                  ParticleGuns 2000
./run.sh pset_SingleMuon_Toy_2GeV_20171004.py                  ParticleGuns 2000
./run.sh pset_SingleMuon_Toy2_2GeV_20171004.py                 ParticleGuns 2000
