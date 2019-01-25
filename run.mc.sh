#!/bin/bash

customise() {
cat <<EOF >>crab.py
# Customise for running over MC datasets
config.JobType.pluginName = 'Analysis'
config.JobType.maxMemoryMB = 3000
config.JobType.maxJobRuntimeMin = 600
config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 50  # for ParticleGuns
config.Data.unitsPerJob = 10   # for PU200
#
config.Data.ignoreLocality = True
config.Site.whitelist = ['T2_US_*']
#config.Site.ignoreGlobalBlacklist = True
EOF
}


config=$1
dataset=$2
njobs=$3
label=`echo $config | sed "s/ntuple_\(.*\)_[0-9]\+\.py/ntuple_\1/"`
projdir=crab_${label}
echo "Run config=$config dataset=$dataset njobs=$njobs label=$label"

mkdir -p crab_projects crab_projects_old
rm -rf crab_projects_old/${projdir}

if [ -d crab_projects/${projdir} ]; then
  taskname=`grep 'Task name' crab_projects/${projdir}/crab.log | head -1 | sed -e 's/.*\s\+\([0-9]\+_[0-9]\+\):.*/\1/'`
  mv crab_projects/${projdir} crab_projects_old/${projdir}_${taskname}
fi

sed "s@XX-LABEL-XX@$label@g" crab_template.py | sed "s@XX-DATASET-XX@$dataset@g" | sed "s@XX-CONFIG-XX@$config@g" | sed "s@XX-NJOBS-XX@$njobs@g"  > crab.py
sed -i "s@#config.Data.inputDataset@config.Data.inputDataset@g" crab.py
sed -i "s@#config.Data.inputDBS@config.Data.inputDBS@g" crab.py
sed -i "s@config.Data.outputPrimaryDataset@#config.Data.outputPrimaryDataset@g" crab.py
sed -i "s@config.Data.totalUnits@#config.Data.totalUnits@g" crab.py

customise

crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
