import FWCore.ParameterSet.Config as cms

process = cms.Process('RAWSIM')

process.load('FWCore.MessageService.MessageLogger_cfi')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(1000)
)

# Input source
process.source = cms.Source("PoolSource",
    #fileNames = cms.untracked.vstring('file:/eos/uscms/store/user/jiafu/L1TrackTrigger/from_sviret/LHE/4tops_SM_10000_events.lhe')
    fileNames = cms.untracked.vstring('root://cmsxrootd.fnal.gov///store/mc/TTI2023Upg14D/PYTHIA6_Tauola_TTbar_TuneZ2star_14TeV/GEN-SIM-DIGI-RAW/PU200_DES23_62_V1-v1/110000/004C20AB-4D9E-E611-AE77-00266CFFBDAC.root')
)

process.options = cms.untracked.PSet(

)

## Geometry and Global Tags
process.load('Configuration.Geometry.GeometryExtended2023TTIReco_cff')
process.load('Configuration.Geometry.GeometryExtended2023TTI_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_PostLS1_cff')
process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_cff")
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:upgradePLS3', '')

process.load('Geometry.TrackerGeometryBuilder.StackedTrackerGeometry_cfi')

## Write the TTree
process.TFileService = cms.Service("TFileService",
    fileName = cms.string("ntuple.root")
)

process.load("SLHCL1TrackTriggerSimulations.NTupleTools.sequences_cff")
process.ntupleSequence_TTI.remove(process.ntupleGenParticlesExtra)
process.ntupleSequence_TTI.remove(process.ntupleMixedSimHits)
process.ntupleSequence_TTI.remove(process.ntupleTTTracks)


process.p = cms.Path(process.ntupleSequence_TTI)
process.schedule = cms.Schedule(process.p)

# Configure framework report and summary
process.options = cms.untracked.PSet(wantSummary = cms.untracked.bool(True))
process.MessageLogger.cerr.FwkReport.reportEvery = 10000

# Dump the full python config
with open("dump.py", "w") as f:
    f.write(process.dumpPython())
 
