from CRABClient.UserUtilities import config
config = config()

config.General.instance = 'prod'
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
config.JobType.maxJobRuntimeMin = 720
#config.JobType.numCores = 4

#config.Data.inputDataset = 'XX-DATASET-XX'
#config.Data.inputDBS = 'global'
config.Data.outputPrimaryDataset = 'XX-DATASET-XX'
#config.Data.splitting = 'FileBased'
#config.Data.unitsPerJob = 1
#config.Data.splitting = 'LumiBased'
#config.Data.unitsPerJob = 20
#config.Data.lumiMask = 'https://cms-service-dqm.web.cern.ch/cms-service-dqm/CAF/certification/Collisions12/8TeV/Prompt/Cert_190456-208686_8TeV_PromptReco_Collisions12_JSON.txt'
#config.Data.runRange = '193093-194075'
config.Data.splitting = 'EventBased'
config.Data.unitsPerJob = 1000  # for ParticleGuns
#config.Data.unitsPerJob = 100  # for PU200 events
njobs = XX-NJOBS-XX
config.Data.totalUnits = config.Data.unitsPerJob * njobs
#config.Data.outLFNDirBase = '/store/user/jiafulow/L1MuonTrigger/P2_11_1_7/XX-LABEL-XX/'
config.Data.outLFNDirBase = '/store/group/l1upgrades/L1MuonTrigger/P2_11_1_7/XX-LABEL-XX/'
config.Data.publication = False
config.Data.outputDatasetTag = 'CRAB3'
#config.Data.allowNonValidInputDataset = True

#config.Site.storageSite = 'T2_US_Florida'
config.Site.storageSite = 'T3_US_FNALLPC'

test_run = False
if test_run:
    #config.Data.splitting = 'EventAwareLumiBased'
    config.Data.splitting = 'EventBased'
    config.Data.unitsPerJob = 100
    config.Data.totalUnits = config.Data.unitsPerJob * 1
