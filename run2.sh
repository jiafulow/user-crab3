#!/bin/bash

label=$1
dataset=$2
config=$3
output=$4
njobs=$5
projdir=crab_${label}

mkdir -p crab_projects crab_projects_old
rm -rf crab_projects_old/${projdir}
[ -d crab_projects/${projdir} ] && mv crab_projects/${projdir} crab_projects_old
sed "s@XX-LABEL-XX@$label@g" crab_template.py | sed "s@XX-DATASET-XX@$dataset@g" | sed "s@XX-CONFIG-XX@$config@g" | sed "s@XX-OUTPUT-XX@$output@g" | sed "s@XX-NJOBS-XX@$njobs@g"  > crab.py
echo "config.Data.unitsPerJob = 500" >> crab.py
echo "config.Data.totalUnits = config.Data.unitsPerJob * njobs" >> crab.py
crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
