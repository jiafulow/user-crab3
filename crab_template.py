from CRABClient.UserUtilities import config, getUsernameFromSiteDB
config = config()

config.General.requestName = 'XX-LABEL-XX'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

#config.JobType.pluginName = 'Analysis'
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'XX-CONFIG-XX'
#config.JobType.outputFiles = ['Output.root']
#config.JobType.pyCfgParams = []
config.JobType.maxMemoryMB = 4000
config.JobType.maxJobRuntimeMin = 1315*2
config.JobType.numCores = 4

#config.Data.inputDataset = 'XX-DATASET-XX'
#config.Data.inputDBS = 'global'
config.Data.outputPrimaryDataset = 'XX-DATASET-XX'
#config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 1
#config.Data.splitting = 'EventAwareLumiBased'
#config.Data.unitsPerJob = 10000
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 1000  # for ParticleGuns
#config.Data.unitsPerJob = 10000  # for MinBias
njobs = XX-NJOBS-XX
config.Data.totalUnits = config.Data.unitsPerJob * njobs
#config.Data.outLFNDirBase = '/store/user/jiafulow/L1MuonTrigger/P2_9_2_3_patch1/XX-LABEL-XX/'
config.Data.outLFNDirBase = '/store/group/l1upgrades/L1MuonTrigger/P2_9_2_3_patch1/XX-LABEL-XX/'
config.Data.publication = False
config.Data.outputDatasetTag = 'CRAB3'

#config.Site.storageSite = 'T2_US_Florida'
config.Site.storageSite = 'T3_US_FNALLPC'


test_run = False
if test_run:
    #config.Data.splitting = 'EventAwareLumiBased'
    config.Data.splitting = 'EventBased'
    config.Data.unitsPerJob = 10
    config.Data.totalUnits = config.Data.unitsPerJob * 1

