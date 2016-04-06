#!/bin/bash

cfg=pset_SingleMuon_PositiveEndCap_20160405.py
out=SingleMuon_PositiveEndCap.root

# SingleMuon_PositiveEndCap
./run.sh SingleMuon_PositiveEndCap  ParticleGuns  $cfg  $out

