#!/bin/bash

config=$1
dataset=$2
njobs=$3
label=`echo $config | sed "s/pset_\(.*\)_[0-9]\+\.py/\1/"`
projdir=crab_${label}
echo "Run config=$config dataset=$dataset njobs=$njobs label=$label"

mkdir -p crab_projects crab_projects_old
rm -rf crab_projects_old/${projdir}
[ -d crab_projects/${projdir} ] && mv crab_projects/${projdir} crab_projects_old
sed "s@XX-LABEL-XX@$label@g" crab_template_a.py | sed "s@XX-DATASET-XX@$dataset@g" | sed "s@XX-CONFIG-XX@$config@g" | sed "s@XX-NJOBS-XX@$njobs@g"  > crab.py
crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
