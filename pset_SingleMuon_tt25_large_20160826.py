# Auto generated configuration file
# using: 
# Revision: 1.20 
# Source: /local/reps/CMSSW/CMSSW/Configuration/Applications/python/ConfigBuilder.py,v 
# with command line options: SLHCL1TrackTriggerSimulations/Configuration/python/tower/SingleMuonFlatOneOverPt0p0005To0p5_tt27_cfi.py --conditions auto:upgradePLS3 --eventcontent RAWSIM -s GEN,SIM,DIGI:pdigi_valid,L1TrackTrigger --datatier GEN-SIM-DIGI-RAW --beamspot HLLHC --customise SLHCUpgradeSimulations/Configuration/combinedCustoms.cust_2023TTI,SLHCL1TrackTriggerSimulations/Configuration/customise_pgun.cust_useTrackerOnly --geometry Extended2023TTI --magField 38T_PostLS1 --mc --no_exec --processName RAWSIM -n 1000 --python_filename pset_SingleMuon_tt27.py --fileout SingleMuon_tt27.root
import FWCore.ParameterSet.Config as cms

process = cms.Process('RAWSIM')

# import of standard configurations
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('SimGeneral.MixingModule.mixNoPU_cfi')
process.load('Configuration.Geometry.GeometryExtended2023TTIReco_cff')
process.load('Configuration.Geometry.GeometryExtended2023TTI_cff')
process.load('Configuration.StandardSequences.MagneticField_38T_PostLS1_cff')
process.load('Configuration.StandardSequences.Generator_cff')
process.load('IOMC.EventVertexGenerators.VtxSmearedHLLHC_cfi')
process.load('GeneratorInterface.Core.genFilterSummary_cff')
process.load('Configuration.StandardSequences.SimIdeal_cff')
process.load('Configuration.StandardSequences.Digi_cff')
process.load('Configuration.StandardSequences.L1TrackTrigger_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(1000)
)

# Input source
process.source = cms.Source("EmptySource")

process.options = cms.untracked.PSet(

)

# Production Info
process.configurationMetadata = cms.untracked.PSet(
    version = cms.untracked.string('$Revision: 1.20 $'),
    annotation = cms.untracked.string('SLHCL1TrackTriggerSimulations/Configuration/python/tower/SingleMuonFlatOneOverPt0p0005To0p5_tt27_cfi.py nevts:1000'),
    name = cms.untracked.string('Applications')
)

# Output definition

process.RAWSIMoutput = cms.OutputModule("PoolOutputModule",
    splitLevel = cms.untracked.int32(0),
    eventAutoFlushCompressedSize = cms.untracked.int32(5242880),
    outputCommands = process.RAWSIMEventContent.outputCommands,
    fileName = cms.untracked.string('SingleMuon_tt25_large.root'),
    dataset = cms.untracked.PSet(
        filterName = cms.untracked.string(''),
        dataTier = cms.untracked.string('GEN-SIM-DIGI-RAW')
    ),
    SelectEvents = cms.untracked.PSet(
        SelectEvents = cms.vstring('generation_step')
    )
)

# Additional output definition

# Other statements
process.genstepfilter.triggerConditions=cms.vstring("generation_step")
process.mix.digitizers = cms.PSet(process.theDigitizersValid)
from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:upgradePLS3', '')

process.generator = cms.EDProducer("FlatRandomOneOverPtGunProducer",
    PGunParameters = cms.PSet(
        RandomCharge = cms.bool(True),
        MaxOneOverPt = cms.double(0.5),
        MinOneOverPt = cms.double(0.0005),
        PartID = cms.vint32(13),
        MaxEta = cms.double(+1.0),
        MaxPhi = cms.double(2.0),
        MinEta = cms.double(-0.4),
        MinPhi = cms.double(0.4),
        ReallyFlat = cms.bool(True)
    ),
    Verbosity = cms.untracked.int32(0),
    psethack = cms.string('single muon+/- 1/pt 0.0005 to 0.5 tower 25 large'),
    AddAntiParticle = cms.bool(False),
    firstRun = cms.untracked.uint32(1)
)


# Path and EndPath definitions
process.generation_step = cms.Path(process.pgen)
process.simulation_step = cms.Path(process.psim)
process.digitisation_step = cms.Path(process.pdigi_valid)
process.L1TrackTrigger_step = cms.Path(process.L1TrackTrigger)
process.genfiltersummary_step = cms.EndPath(process.genFilterSummary)
process.endjob_step = cms.EndPath(process.endOfProcess)
process.RAWSIMoutput_step = cms.EndPath(process.RAWSIMoutput)

# Schedule definition
process.schedule = cms.Schedule(process.generation_step,process.genfiltersummary_step,process.simulation_step,process.digitisation_step,process.L1TrackTrigger_step,process.endjob_step,process.RAWSIMoutput_step)
# filter all path with the production filter sequence
for path in process.paths:
	getattr(process,path)._seq = process.generator * getattr(process,path)._seq 

# customisation of the process.

# Automatic addition of the customisation function from SLHCUpgradeSimulations.Configuration.combinedCustoms
from SLHCUpgradeSimulations.Configuration.combinedCustoms import cust_2023TTI 

#call to customisation function cust_2023TTI imported from SLHCUpgradeSimulations.Configuration.combinedCustoms
process = cust_2023TTI(process)

# Automatic addition of the customisation function from SLHCL1TrackTriggerSimulations.Configuration.customise_pgun
from SLHCL1TrackTriggerSimulations.Configuration.customise_pgun import cust_useTrackerOnly 

#call to customisation function cust_useTrackerOnly imported from SLHCL1TrackTriggerSimulations.Configuration.customise_pgun
process = cust_useTrackerOnly(process)

# End of customisation functions


# Configure framework report and summary
process.options = cms.untracked.PSet(wantSummary = cms.untracked.bool(True))
process.MessageLogger.cerr.FwkReport.reportEvery = 10000
 
# Make CRAB recognize the correct output filename
process.RAWSIMoutput.fileName = process.RAWSIMoutput.fileName._value.replace(".root", "_ntuple.root")
 
# Dump the full python config
with open("dump.py", "w") as f:
    f.write(process.dumpPython())

