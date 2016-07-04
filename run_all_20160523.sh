#!/bin/bash

echo "Using CMSSW_BASE: $CMSSW_BASE"

#./run.sh DoubleMuon_PositiveEndCap_flatPt  ParticleGuns  pset_DoubleMuon_PositiveEndCap_flatPt_20160523.py  DoubleMuon_PositiveEndCap_flatPt.root  200
#./run.sh DoubleMuon_NegativeEndCap_flatPt  ParticleGuns  pset_DoubleMuon_NegativeEndCap_flatPt_20160523.py  DoubleMuon_NegativeEndCap_flatPt.root  200

./run.sh SingleMuon_sp0  ParticleGuns  pset_SingleMuon_sp0_20160523.py  SingleMuon_sp0.root  500
