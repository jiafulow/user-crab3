#!/bin/bash

customise() {
cat <<EOF >>crab.py
# Customise for running over private input files
import os
import imp
configname = config.JobType.psetName
cfgBaseName = os.path.basename( os.path.abspath( configname ) ).replace(".py", "")
cfgDirName = os.path.dirname( os.path.abspath( configname ) )
if not cfgDirName:
    modPath = imp.find_module(cfgBaseName)
else:
    modPath = imp.find_module(cfgBaseName, [cfgDirName])
pset = imp.load_module(cfgBaseName, modPath[0], modPath[1], modPath[2])
fileNames = list(pset.process.source.fileNames)
#
config.JobType.pluginName = 'Analysis'
config.JobType.maxMemoryMB = 3000
config.JobType.maxJobRuntimeMin = 600
config.Data.userInputFiles = fileNames
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = njobs  # 'njobs' being used for unitsPerJob
config.Data.totalUnits = len(config.Data.userInputFiles)
#
config.Data.ignoreLocality = True
config.Site.whitelist = ['T3_US_FNALLPC']
#config.Site.whitelist = ['T3_US_Baylor','T2_US_Caltech','T3_US_Colorado','T3_US_Cornell','T3_US_FIT','T3_US_FIU','T1_US_FNAL','T3_US_FNALLPC','T2_US_Florida','T3_US_JHU','T3_US_Kansas','T2_US_MIT','T3_US_NotreDame','T2_US_Nebraska','T3_US_OSU','T3_US_Princeton_ICSE','T2_US_Purdue','T3_US_Rice','T3_US_Rutgers','T3_US_MIT','T3_US_NERSC','T3_US_PSC','T3_US_SDSC','T3_US_FIU','T3_US_FSU','T3_US_OSG','T3_US_TACC','T3_US_TAMU','T3_US_TTU','T3_US_UCR','T3_US_UCD','T2_US_UCSD','T3_US_UMD','T3_US_UMiss','T3_US_PuertoRico','T3_US_VC3_NotreDame','T2_US_Vanderbilt','T2_US_Wisconsin']
config.Site.ignoreGlobalBlacklist = True
#
## See https://twiki.cern.ch/twiki/bin/view/CMSPublic/CRAB3FAQ#What_is_glideinWms_Overflow_and
#config.section_("Debug")
#config.Debug.extraJDL = ['+CMS_ALLOW_OVERFLOW=False'
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

customise

crab submit -c crab.py
#crab submit -c crab.py --dryrun
cp crab.py crab_projects/${projdir}/
