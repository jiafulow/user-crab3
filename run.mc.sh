#!/bin/bash

customise() {
cat <<EOF >>crab.py
# Customise for running over MC datasets
config.JobType.pluginName = 'Analysis'
config.JobType.maxMemoryMB = 2500
config.JobType.maxJobRuntimeMin = 1315
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = njobs  # 'njobs' being used for unitsPerJob
#
config.Data.ignoreLocality = True
config.Site.whitelist = ['T2_US_*']
#config.Site.whitelist = ['T2_US_UCSD','T2_US_Wisconsin','T2_US_Florida','T2_US_MIT','T2_US_Nebraska', 'T2_US_Purdue', 'T3_US_FNALLPC']
#config.Site.ignoreGlobalBlacklist = True
#
## See https://twiki.cern.ch/twiki/bin/view/CMSPublic/CRAB3FAQ#What_is_glideinWms_Overflow_and
#config.section_('Debug')
#config.Debug.extraJDL = ['+CMS_ALLOW_OVERFLOW=False']
EOF
}


config=$1
dataset=$2
njobs=$3
label=`echo $config | sed "s@p/ntupler_\(.*\)_[0-9]\+\.py@ntupler_\1@"`
projdir=crab_${label}
echo "Run config=$config dataset=$dataset njobs=$njobs label=$label"

mkdir -p crab_projects crab_projects_old
rm -rf crab_projects_old/${projdir}/

if [ -d crab_projects/${projdir}/ ]; then
    taskname=`grep "Task name" crab_projects/${projdir}/crab.log | head -1 | sed "s/.*\s\+\([0-9]\+_[0-9]\+\):.*/\1/"`
    mv crab_projects/${projdir}/ crab_projects_old/${projdir}_${taskname}/
fi

sed "s@XX-LABEL-XX@$label@g ; s@XX-DATASET-XX@$dataset@g ; s@XX-CONFIG-XX@$config@g ; s@XX-NJOBS-XX@$njobs@g" crab_template.py > crab.py
sed -i "s@#config.Data.inputDataset@config.Data.inputDataset@g" crab.py
sed -i "s@#config.Data.inputDBS@config.Data.inputDBS@g" crab.py
sed -i "s@config.Data.outputPrimaryDataset@#config.Data.outputPrimaryDataset@g" crab.py
sed -i "s@config.Data.totalUnits@#config.Data.totalUnits@g" crab.py

customise

crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
