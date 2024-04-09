### Analysis of recruitment and primary production

nc.initial <- '/home/kc/git/mccannlab/atlantis_omnrf/P_model/LakeErieInit_NP.nc'
grp.csv     <- '/home/kc/git/mccannlab/atlantis_omnrf/P_model/LakeErieGroupsDem.csv'
prm.file    <- '/home/kc/git/mccannlab/atlantis_omnrf/P_model/Bio_LE_new08242023_NP.prm'
nc.current <- '/home/kc/git/mccannlab/atlantis_omnrf/outDocker_NP_30years_0319/outputLakeErie_NP.nc'
yoy.file <- '/home/kc/git/mccannlab/atlantis_omnrf/outDocker_NP_30years_0319/outputLakeErie_NPYOY.txt'

biom <- "/home/kc/git/mccannlab/atlantis_omnrf/outDocker_NP_30years_0319/outputLakeErie_NPBiomIndx.txt"
diet.file <- "/home/kc/git/mccannlab/atlantis_omnrf/outDocker_NP_30years_0319/outputLakeErie_NPDietCheck.txt"
bio.age <- "/home/kc/git/mccannlab/atlantis_omnrf/outDocker_NP_30years_0319/outputLakeErie_NPAgeBiomIndx.txt"

bgm.file <- "/home/kc/git/mccannlab/atlantis_omnrf/P_model/LakeErie_XY_updated.bgm"
cum.depths <- cumsum(c(0, 10, 6, 9, 38))


recruitment.cal(nc.initial, nc.current, yoy.file, grp.csv, prm.file)


## Predation 
predation(biom, grp.csv, diet.file, bio.age)

## predator-prey interactions from the initial conditions
feeding.mat(prm.file, grp.csv, nc.initial, bgm.file, cum.depths)

### Atlantis food web and trophic level composition
food.web(diet.file, grp.csv)
# food.web(diet.file, grp.file, diet.file.bypol)


growth.pp(nc.initial, grp.csv, prm.file, nc.current)