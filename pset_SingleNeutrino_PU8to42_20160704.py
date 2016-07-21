# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: L1TMuonSimulations/Configuration/python/HCA-RunIISummer15GS-00002-fragment.py --step GEN,SIM,DIGI:pdigi_valid,L1,DIGI2RAW,HLT:GRun,RAW2DIGI,L1Reco,RECO --mc --eventcontent RAWSIM --datatier GEN-SIM-RAW --processName RAWSIM --era Run2_2016 --conditions 80X_mcRun2_asymptotic_v14 --customise L1TMuonSimulations/Configuration/customise.cust_pileup --customise_commands process.mix.input.nbPileupEvents.probValue = cms.vdouble(0,0,0,0,0,0,0,0,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0,0,0,0,0,0,0) --beamspot Realistic50ns13TeVCollision --magField 38T_PostLS1 --python_filename pset_SingleNeutrino_PU8to42.py --fileout file:SingleNeutrino_PU8to42.root --no_exec -n 10
import FWCore.ParameterSet.Config as cms

from Configuration.StandardSequences.Eras import eras

process = cms.Process('RAWSIM',eras.Run2_2016)

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.Geometry.GeometrySimDB_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_PostLS1_cff')
process.load('Configuration.StandardSequences.Generator_cff')
process.load('IOMC.EventVertexGenerators.VtxSmearedRealistic50ns13TeVCollision_cfi')
process.load('GeneratorInterface.Core.genFilterSummary_cff')
process.load('Configuration.StandardSequences.SimIdeal_cff')
process.load('Configuration.StandardSequences.Digi_cff')
process.load('Configuration.StandardSequences.SimL1Emulator_cff')
process.load('Configuration.StandardSequences.DigiToRaw_cff')
process.load('HLTrigger.Configuration.HLT_GRun_cff')
process.load('Configuration.StandardSequences.RawToDigi_cff')
process.load('Configuration.StandardSequences.L1Reco_cff')
process.load('Configuration.StandardSequences.Reconstruction_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(10)
)

# Input source
process.source = cms.Source("EmptySource")

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    annotation = cms.untracked.string('L1TMuonSimulations/Configuration/python/HCA-RunIISummer15GS-00002-fragment.py nevts:10'),
    name = cms.untracked.string('Applications'),
    version = cms.untracked.string('$Revision: 1.19 $')
)

# Output definition

process.RAWSIMoutput = cms.OutputModule("PoolOutputModule",
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('generation_step')
    ),
    dataset = cms.untracked.PSet(
        dataTier = cms.untracked.string('GEN-SIM-RAW'),
        filterName = cms.untracked.string('')
    ),
    eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
    fileName = cms.untracked.string('file:SingleNeutrino_PU8to42.root'),
    outputCommands = process.RAWSIMEventContent.outputCommands,
    splitLevel = cms.untracked.int32(0)
)

# Additional output definition

# Other statements
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
process.mix.digitizers = cms.PSet(process.theDigitizersValid)
from HLTrigger.Configuration.CustomConfigs import ProcessName
process = ProcessName(process)

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '80X_mcRun2_asymptotic_v14', '')

process.generator = cms.EDProducer("FlatRandomEGunProducer",
    AddAntiParticle = cms.bool(False),
    PGunParameters = cms.PSet(
        MaxE = cms.double(10.01),
        MaxEta = cms.double(2.5),
        MaxPhi = cms.double(3.14159265359),
        MinE = cms.double(9.99),
        MinEta = cms.double(-2.5),
        MinPhi = cms.double(-3.14159265359),
        PartID = cms.vint32(12)
    ),
    Verbosity = cms.untracked.int32(0),
    firstRun = cms.untracked.uint32(1),
    psethack = cms.string('single Nu E 10')
)


# Path and EndPath definitions
process.generation_step = cms.Path(process.pgen)
process.simulation_step = cms.Path(process.psim)
process.digitisation_step = cms.Path(process.pdigi_valid)
process.L1simulation_step = cms.Path(process.SimL1Emulator)
process.digi2raw_step = cms.Path(process.DigiToRaw)
process.raw2digi_step = cms.Path(process.RawToDigi)
process.L1Reco_step = cms.Path(process.L1Reco)
process.reconstruction_step = cms.Path(process.reconstruction)
process.genfiltersummary_step = cms.EndPath(process.genFilterSummary)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.RAWSIMoutput_step = cms.EndPath(process.RAWSIMoutput)

# Schedule definition
process.schedule = cms.Schedule(process.generation_step,process.genfiltersummary_step,process.simulation_step,process.digitisation_step,process.L1simulation_step,process.digi2raw_step)
process.schedule.extend(process.HLTSchedule)
process.schedule.extend([process.raw2digi_step,process.L1Reco_step,process.reconstruction_step,process.endjob_step,process.RAWSIMoutput_step])
# filter all path with the production filter sequence
for path in process.paths:
	getattr(process,path)._seq = process.generator * getattr(process,path)._seq 

# customisation of the process.

# Automatic addition of the customisation function from L1TMuonSimulations.Configuration.customise
from L1TMuonSimulations.Configuration.customise import cust_pileup 

#call to customisation function cust_pileup imported from L1TMuonSimulations.Configuration.customise
process = cust_pileup(process)

# Automatic addition of the customisation function from HLTrigger.Configuration.customizeHLTforMC
from HLTrigger.Configuration.customizeHLTforMC import customizeHLTforFullSim 

#call to customisation function customizeHLTforFullSim imported from HLTrigger.Configuration.customizeHLTforMC
process = customizeHLTforFullSim(process)

# End of customisation functions

# Customisation from command line
process.mix.input.nbPileupEvents.probValue = cms.vdouble(0,0,0,0,0,0,0,0,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0,0,0,0,0,0,0)

# Customisation from command line
process.mix.input.nbPileupEvents.probValue = cms.vdouble(0,0,0,0,0,0,0,0,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0.02857143,0,0,0,0,0,0,0)

process.options = cms.untracked.PSet(SkipEvent = cms.untracked.vstring('CapacityExaustedException'))
