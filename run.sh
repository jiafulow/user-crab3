#!/bin/bash

config=$1
dataset=$2
njobs=$3
label=`echo $config | sed "s@p/pset_\(.*\)_[0-9]\+\.py@\1@"`
projdir=crab_${label}
echo "Run config=$config dataset=$dataset njobs=$njobs label=$label"

mkdir -p crab_projects crab_projects_old
rm -rf crab_projects_old/${projdir}/

if [ -d crab_projects/${projdir}/ ]; then
    taskname=`grep "Task name" crab_projects/${projdir}/crab.log | head -1 | sed "s/.*\s\+\([0-9]\+_[0-9]\+\):.*/\1/"`
    mv crab_projects/${projdir}/ crab_projects_old/${projdir}_${taskname}/
fi

sed "s@XX-LABEL-XX@$label@g ; s@XX-DATASET-XX@$dataset@g ; s@XX-CONFIG-XX@$config@g ; s@XX-NJOBS-XX@$njobs@g" crab_template.py > crab.py
crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
