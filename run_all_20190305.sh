#!/bin/bash

echo "[INFO] Using CMSSW_BASE: $CMSSW_BASE"

# Using whitelists
rm -rf crab_projects/crab_ntuple_SingleMuon_Endcap_2GeV/
crab submit -c crab_ntuple_SingleMuon_Endcap_2GeV.py
cp crab_ntuple_SingleMuon_Endcap_2GeV.py crab_projects/crab_ntuple_SingleMuon_Endcap_2GeV/

rm -rf crab_projects/crab_ntuple_SingleMuon_Endcap2_2GeV/
crab submit -c crab_ntuple_SingleMuon_Endcap2_2GeV.py
cp crab_ntuple_SingleMuon_Endcap2_2GeV.py crab_projects/crab_ntuple_SingleMuon_Endcap2_2GeV/

rm -rf crab_projects/crab_ntuple_SingleMuon_Overlap_3GeV/
crab submit -c crab_ntuple_SingleMuon_Overlap_3GeV.py
cp crab_ntuple_SingleMuon_Overlap_3GeV.py crab_projects/crab_ntuple_SingleMuon_Overlap_3GeV/

rm -rf crab_projects/crab_ntuple_SingleMuon_Overlap2_3GeV/
crab submit -c crab_ntuple_SingleMuon_Overlap2_3GeV.py
cp crab_ntuple_SingleMuon_Overlap2_3GeV.py crab_projects/crab_ntuple_SingleMuon_Overlap2_3GeV/
