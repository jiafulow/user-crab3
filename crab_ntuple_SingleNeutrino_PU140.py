from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

config.General.requestName = 'ntuple_SingleNeutrino_PU140'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

#config.JobType.pluginName = 'Analysis'
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'ntuple_SingleNeutrino_PU140_20190124.py'
#config.JobType.outputFiles = ['Output.root']
#config.JobType.pyCfgParams = []
config.JobType.maxMemoryMB = 3600
config.JobType.maxJobRuntimeMin = 840
#config.JobType.numCores = 4

config.Data.inputDataset = '/SingleNeutrino/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW'
config.Data.inputDBS = 'global'
#config.Data.outputPrimaryDataset = '/SingleNeutrino/PhaseIIFall17D-L1TPU140_93X_upgrade2023_realistic_v5-v1/GEN-SIM-DIGI-RAW'
#config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 1
#config.Data.splitting = 'EventAwareLumiBased'
#config.Data.unitsPerJob = 10000
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 1000  # for ParticleGuns
#config.Data.unitsPerJob = 10000  # for single MinBias
#config.Data.unitsPerJob = 100  # for PU200 events
njobs = -1
#config.Data.totalUnits = config.Data.unitsPerJob * njobs
#config.Data.outLFNDirBase = '/store/user/jiafulow/L1MuonTrigger/P2_10_4_0/ntuple_SingleNeutrino_PU140/'
config.Data.outLFNDirBase = '/store/group/l1upgrades/L1MuonTrigger/P2_10_4_0/ntuple_SingleNeutrino_PU140/'
config.Data.publication = False
config.Data.outputDatasetTag = 'CRAB3'

#config.Site.storageSite = 'T2_US_Florida'
config.Site.storageSite = 'T3_US_FNALLPC'

test_run = False
if test_run:
    #config.Data.splitting = 'EventAwareLumiBased'
    config.Data.splitting = 'EventBased'
    config.Data.unitsPerJob = 100
    #config.Data.totalUnits = config.Data.unitsPerJob * 1

# Customise for running over MC datasets
config.JobType.pluginName = 'Analysis'
config.JobType.maxMemoryMB = 3000
config.JobType.maxJobRuntimeMin = 600
config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 50  # for ParticleGuns
config.Data.unitsPerJob = 10   # for PU200
#
config.Data.ignoreLocality = True
#config.Site.whitelist = ['T2_US_*']
#config.Site.whitelist = ['T2_US_UCSD','T2_US_Wisconsin','T2_US_Florida','T2_US_MIT','T2_US_Nebraska', 'T2_US_Purdue', 'T3_US_FNALLPC']
config.Site.whitelist = ['T2_US_MIT']
#config.Site.ignoreGlobalBlacklist = True
