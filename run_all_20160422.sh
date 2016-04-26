#!/bin/bash

echo "Using CMSSW_BASE: $CMSSW_BASE"

#./run.sh SingleMuon_PositiveEndCap  ParticleGuns  pset_SingleMuon_PositiveEndCap_20160422.py  SingleMuon_PositiveEndCap.root  200
#./run.sh SingleMuon_NegativeEndCap  ParticleGuns  pset_SingleMuon_NegativeEndCap_20160422.py  SingleMuon_NegativeEndCap.root  200
#./run.sh SingleMuon_PositiveEndCap_0T  ParticleGuns  pset_SingleMuon_PositiveEndCap_0T_20160422.py  SingleMuon_PositiveEndCap_0T.root  200
./run.sh SingleMuon_NegativeEndCap_0T  ParticleGuns  pset_SingleMuon_NegativeEndCap_0T_20160422.py  SingleMuon_NegativeEndCap_0T.root  200
#./run.sh SingleMuon_PositiveEndCap_flatPt  ParticleGuns  pset_SingleMuon_PositiveEndCap_flatPt_20160422.py  SingleMuon_PositiveEndCap_flatPt.root  200
#./run.sh SingleMuon_NegativeEndCap_flatPt  ParticleGuns  pset_SingleMuon_NegativeEndCap_flatPt_20160422.py  SingleMuon_NegativeEndCap_flatPt.root  200
