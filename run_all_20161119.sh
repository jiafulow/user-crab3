#!/bin/bash

echo "Using CMSSW_BASE: $CMSSW_BASE"
echo "Using crab_template_a.py. 'njobs' is ignored"

# PU0
./run_a.sh pset_TTI2023Upg14D_oc_tt25_PU0_20161119.py /PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-DES23_62_V1-v1/GEN-SIM-DIGI-RAW 40

# PU140
./run_a.sh pset_TTI2023Upg14D_oc_tt25_PU140_20161119.py /PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-PU140_DES23_62_V1-v1/GEN-SIM-DIGI-RAW 40

# PU200
./run_a.sh pset_TTI2023Upg14D_oc_tt25_PU200_20161119.py /PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/TTI2023Upg14D-PU200_DES23_62_V1-v1/GEN-SIM-DIGI-RAW 40
