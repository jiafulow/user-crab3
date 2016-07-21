# Auto generated configuration file
# using: 
# Revision: 1.19 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: L1TMuonSimulations/Configuration/python/sector/SingleMuonFlatOneOverPt2To7000_sp0_cfi.py --step GEN,SIM,DIGI:pdigi_valid,L1,DIGI2RAW,RAW2DIGI --mc --no_output --processName RAWSIM --era Run2_2016 --conditions 80X_mcRun2_asymptotic_v14 --customise L1TMuonSimulations/Configuration/customise.cust_pgun --customise L1TMuonSimulations/NtupleTools/customise.cust_ntuple --customise_commands process.p.remove(process.ntupleHLT)  \nprocess.p.remove(process.ntupleReco) --beamspot Realistic50ns13TeVCollision --magField 38T_PostLS1 --python_filename ntuple_SingleMuon_sp0.py --no_exec -n 100
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
process.load('Configuration.StandardSequences.RawToDigi_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(100)
)

# Input source
process.source = cms.Source("EmptySource")

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    annotation = cms.untracked.string('L1TMuonSimulations/Configuration/python/sector/SingleMuonFlatOneOverPt2To7000_sp0_cfi.py nevts:100'),
    name = cms.untracked.string('Applications'),
    version = cms.untracked.string('$Revision: 1.19 $')
)

# Output definition

# Additional output definition

# Other statements
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
process.mix.digitizers = cms.PSet(process.theDigitizersValid)
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, '80X_mcRun2_asymptotic_v14', '')

process.generator = cms.EDProducer("FlatRandomPtGunProducer2",
    AddAntiParticle = cms.bool(False),
    PGunParameters = cms.PSet(
        MaxEta = cms.double(2.5),
        MaxPhi = cms.double(1.308996939),
        MaxPt = cms.double(7000.0),
        MinEta = cms.double(1.0),
        MinPhi = cms.double(0.261799387799),
        MinPt = cms.double(2.0),
        PartID = cms.vint32(-13),
        PtSpectrum = cms.string('flatOneOverPt'),
        RandomCharge = cms.bool(True)
    ),
    Verbosity = cms.untracked.int32(0),
    firstRun = cms.untracked.uint32(1),
    psethack = cms.string('single muon+/- pt 2 to 7000 flat in 1/pt sector processor 0')
)


# Path and EndPath definitions
process.generation_step = cms.Path(process.pgen)
process.simulation_step = cms.Path(process.psim)
process.digitisation_step = cms.Path(process.pdigi_valid)
process.L1simulation_step = cms.Path(process.SimL1Emulator)
process.digi2raw_step = cms.Path(process.DigiToRaw)
process.raw2digi_step = cms.Path(process.RawToDigi)
process.genfiltersummary_step = cms.EndPath(process.genFilterSummary)
process.endjob_step = cms.EndPath(process.endOfProcess)

# Schedule definition
process.schedule = cms.Schedule(process.generation_step,process.genfiltersummary_step,process.simulation_step,process.digitisation_step,process.L1simulation_step,process.digi2raw_step,process.raw2digi_step,process.endjob_step)
# filter all path with the production filter sequence
for path in process.paths:
	getattr(process,path)._seq = process.generator * getattr(process,path)._seq 

# customisation of the process.

# Automatic addition of the customisation function from L1TMuonSimulations.Configuration.customise
from L1TMuonSimulations.Configuration.customise import cust_pgun 

#call to customisation function cust_pgun imported from L1TMuonSimulations.Configuration.customise
process = cust_pgun(process)

# Automatic addition of the customisation function from L1TMuonSimulations.NtupleTools.customise
from L1TMuonSimulations.NtupleTools.customise import cust_ntuple 

#call to customisation function cust_ntuple imported from L1TMuonSimulations.NtupleTools.customise
process = cust_ntuple(process)

# End of customisation functions

# Customisation from command line
process.p.remove(process.ntupleHLT)  
process.p.remove(process.ntupleReco)

# Customisation from command line
process.p.remove(process.ntupleHLT)  
process.p.remove(process.ntupleReco)