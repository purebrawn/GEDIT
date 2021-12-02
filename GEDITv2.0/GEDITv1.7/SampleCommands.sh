#The most basic command is as follqws, and deposits the output file in the current working directory

python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/10XImmune.tsv


#one can also specify the output file

python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/10XImmune.tsv -outFile examples/Outputs/ImmCM_Ref1_10x.tsv

#If desired, the VisualizePredictions.R script produces pdf and png images of the predictions

Rscript VisualizePredictions.R examples/Outputs/ImmCM_Ref1_10x.tsv

#Advanced setting are also available

#write additional output files. These are the intermediate "scaled" matrices used for the regression
python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/10XImmune.tsv -outFile examples/Outputs/ImmCM_Ref1_10x.tsv -SaveFiles yes

#use 45 signature genes per cell type instead of 50
python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/10XImmune.tsv -NumSigs 45 -outFile examples/Outputs/ImmCM_Ref1_10x_45.tsv

#allow for more signature genes for some cell types than others (but a minumum of 30 for each, instead of the defualt 50
python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/ImmunoStates.csv -MinSigs 30 -outFile examples/Outputs/ImmCM_Ref2_ImmStat.tsv

#change the row scaling parameter from 0.0 to .2; this lessens the extent of the transformation
python2 scripts/GEDIT.py -mix examples/Mixes/ImmuneCellMix.tsv -ref ReferenceMatrices/LM22.tsv  -RowScaling .2 -outFile examples/Outputs/ImmCM_Ref3_LM22.tsv

#select signature genes by meanRatio score
python2 scripts/GEDIT.py -mix examples/Mixes/SkinDiseases.tsv -ref ReferenceMatrices/BlueCodeV1.0.tsv -SigMethod MeanRat -outFile examples/Outputs/Skin_Ref1_BC.tsv

#select signature genes using a hybrid meanRatio and Entropy score
python2 scripts/GEDIT.py -mix examples/Mixes/SkinDiseases.tsv -ref ReferenceMatrices/HPCAOrthogonalV1.0.csv -SigMethod MeanRat,Entropy -outFile examples/Outputs/Skin_Ref2_HPCA.tsv

#use multiple custom parameters
python2 scripts/GEDIT.py -mix examples/Mixes/SkinDiseases.tsv -ref ReferenceMatrices/SkinSignaturesV1.0.tsv -NumSigs 45 -SigMethod MeanRat -MinSigs 30 -RowScaling .2 -outFile examples/Outputs/Skin_Ref3_Skin.tsv

