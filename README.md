### Requirements

Follow the CRAB3 tutorial: <https://twiki.cern.ch/twiki/bin/view/CMSPublic/WorkBookCRAB3Tutorial>.

For frequently asked questions, see: <https://twiki.cern.ch/twiki/bin/view/CMSPublic/CRAB3FAQ>.

### Getting Started

- Check out this repository:

``` shell
# Make sure to use the correct branch for the CMSSW version
git clone -b L1MuonTrigger-P2_11_1_7 git@github.com:jiafulow/UF-CRAB3.git CRAB3/P2_11_1_7
```

- Edit `crab_template.py` to specify:
  - `config.Data.outLFNDirBase`
  - `config.Site.storageSite`
  - `config.JobType.pluginName`, `config.Data.inputDataset`, `config.Data.outputPrimaryDataset`, etc

- Add psets to the directory `p`.

- Create a script `run_all_YYYYMMDD.sh` by following the examples in this repo, and run it.
  - `run.sh` should be used for MC sample generation.
  - `run.mc.sh` should be used when running over published datasets.
  - `run.private.sh` should be used when running over private (unpublished) datasets.
