from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

config.General.requestName = 'ntuple_SingleMuon_Overlap2_3GeV'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

#config.JobType.pluginName = 'Analysis'
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'ntuple_SingleMuon_Overlap2_3GeV_20190305.py'
#config.JobType.outputFiles = ['Output.root']
#config.JobType.pyCfgParams = []
config.JobType.maxMemoryMB = 3600
config.JobType.maxJobRuntimeMin = 840
#config.JobType.numCores = 4

#config.Data.inputDataset = 'ParticleGuns'
#config.Data.inputDBS = 'global'
config.Data.outputPrimaryDataset = 'ParticleGuns'
#config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 1
#config.Data.splitting = 'EventAwareLumiBased'
#config.Data.unitsPerJob = 10000
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 1000  # for ParticleGuns
#config.Data.unitsPerJob = 10000  # for single MinBias
#config.Data.unitsPerJob = 100  # for PU200 events
njobs = -1
config.Data.totalUnits = config.Data.unitsPerJob * njobs
#config.Data.outLFNDirBase = '/store/user/jiafulow/L1MuonTrigger/P2_10_4_0/ntuple_SingleMuon_Overlap2_3GeV/'
config.Data.outLFNDirBase = '/store/group/l1upgrades/L1MuonTrigger/P2_10_4_0/ntuple_SingleMuon_Overlap2_3GeV/'
config.Data.publication = False
config.Data.outputDatasetTag = 'CRAB3'

#config.Site.storageSite = 'T2_US_Florida'
config.Site.storageSite = 'T3_US_FNALLPC'

test_run = False
if test_run:
    #config.Data.splitting = 'EventAwareLumiBased'
    config.Data.splitting = 'EventBased'
    config.Data.unitsPerJob = 100
    config.Data.totalUnits = config.Data.unitsPerJob * 1

# Customise for running over private input files
import os
import imp
cfgBaseName = config.JobType.psetName.replace('.py', '')
file, pathname, description = imp.find_module(cfgBaseName)
pset = imp.load_module(cfgBaseName, file, pathname, description)
#
config.JobType.pluginName = 'Analysis'
config.JobType.maxMemoryMB = 3000
config.JobType.maxJobRuntimeMin = 600
config.Data.userInputFiles = list(pset.process.source.fileNames)
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 50  # for ParticleGuns
#config.Data.unitsPerJob = 10   # for PU200
config.Data.totalUnits = len(config.Data.userInputFiles)
#
config.Data.ignoreLocality = True
config.Site.whitelist = ['T3_US_FNALLPC']
config.Site.ignoreGlobalBlacklist = True

# See https://twiki.cern.ch/twiki/bin/view/CMSPublic/CRAB3FAQ#What_is_glideinWms_Overflow_and
config.section_("Debug")
config.Debug.extraJDL = ['+CMS_ALLOW_OVERFLOW=False']

