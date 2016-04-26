#!/bin/bash

echo "Using CMSSW_BASE: $CMSSW_BASE"

./run2.sh SingleNeutrino_PU30  ParticleGuns  pset_SingleNeutrino_PU30_20160426.py  SingleNeutrino_PU30.root  200
