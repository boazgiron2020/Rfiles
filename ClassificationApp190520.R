  if( TRUE ){
    
    rm(list  = ls())
    
  }
  
  library(e1071)
  library(MASS)
  library(ggplot2)
  library(mclust)
  library(gridExtra)
  library(pracma)
  library(sp)
  
  pdf(NULL)
  
  swversion     = "7.51.0011" 
  swversiondate = 20200519
  resultsoutinkpath = "L:/Personal/Boaz/Signature/GSKData/results00.txt"
  
  print( swversion )
  
  args<-commandArgs(TRUE) # CHANGE FOR TRUE Ver2.3
  
  #Global Vairables =======================
  
  GlobalRunWithH  = FALSE
  
  ScriptFilePath = ""
  
  bGlobalAssignErrorString = NULL
  
  bGlobalQC <<- 0
  
  GlobalQcPath = "c:/Accellix3/QC.txt"
  
  GlobalResultsPath = "C:/Accellix3/Results.txt"
  
  sourceLocation  = "c:/Accellix3/RSourceFiles"
  
  bfmoFlag  = FALSE
  
  # sourcefilelist = dir(sourceLocation,full.names = T )
  # if( length(sourcefilelist) ){
  # 
  #   sapply( sourcefilelist ,function(x){ source(x) } )
  # 
  # }
  
  #source( "C:/Accellix3/RSourceFiles/QC.R" )
  
  
           
  #=======================================
  
  if( GlobalRunWithH ) #RUN WITH h 
  { 
    
    bfmoFlag = TRUE
    bfmo = FALSE          
              
     #f = "L:/Quality System/04 Work Packages/WPL32 JCAR/Training set/washnowash/20181205_15-31-29_AX105_GP0_L20180904_C11059_18458-8-FMO no wash__30.020_SP_NAPG_Events.csv"
     #ScriptFilePath = "C:\\Accellix\\NewVScriptVerification\\ScriptFile_TC100newNamesFMO.txt"
              
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion210319\\QC\\Example\\DVS\\20180604_14-09-49_AX105_QC1_L001_C282_Device voltage setting__30.800_SP_ASXN_Events.csv",
     #          #_peak"L:\\Personal\\Boaz\\Signature\\currentVersion110319\\QC\\Example\\20190312_16-48-05_106176_URQ+JGB_SXXW_CH1_Events.csv",
     #          #"L:\\Personal\\Boaz\\Signature\\currentVersion110319\\QC\\Example\\20190312_16-48-05_106176_URQ+JGB_031E_FSC_Events.csv",
              
     # args = c("h",
              #"L:/Quality System/04 Work Packages/WPL32 JCAR/Training set/washnowash/20181205_15-31-29_AX105_GP0_L20180904_C11059_18458-8-FMO no wash__30.020_SP_NAPG_Events.csv",
              #"L:\\Personal\\Boaz\\Signature\\currentVersion110319\\QC\\QcSsript.txt")
              #"L:\\Personal\\Boaz\\Signature\\currentVersion210319\\QC\\QcSsript.txt" ) 
     
     # args = c("b1",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion060519\\TCL\\data\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          #"L:\\Quality System\\04 Work Packages\\WPL38 GSK TCR\\data1\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion060519\\TCL\\ScriptFile_TCR.txt" )  
     
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion160519\\DVS\\data\\example.csv",
     #          #"L:\\Quality System\\04 Work Packages\\WPL38 GSK TCR\\data1\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion160519\\DVS\\DvsSsript.txt" )  
     
     # args = c("h",
     #          "L:/Personal/Boaz/Signature/currentVersion020519/QC/Example/20190407_12-31-39_106236_URQC-JGB-New-AX102_BGTN_Events.csv",
     #          #"L:\\Personal\\Boaz\\Signature\\currentVersion290419\\data\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          #"L:\\Quality System\\04 Work Packages\\WPL38 GSK TCR\\data1\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          "L:/Personal/Boaz/Signature/currentVersion020519/QC/QcSsript.txt" )
     #          #"L:\\Personal\\Boaz\\Signature\\currentVersion290419\\ScriptFile_TCR.txt" )
     
     #QCExample
   
    
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\QC\\Example\\20181011_12-15-31_102547_qc_SP_8RFO_Events.csv",
     #          #"L:\\Quality System\\04 Work Packages\\WPL38 GSK TCR\\data1\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\QC\\QcSsript.txt" )  
     # 
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\QC\\Example\\20190407_12-31-39_106236_URQC-JGB-New-AX102_PUBV_Events.csv",
     #          #"L:\\Quality System\\04 Work Packages\\WPL38 GSK TCR\\data1\\20190318_16-50-00_AX110_GT0_L104_C102478_GSK 8__304_SP_U4UL_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\QC\\QcSsript.txt" )  
     # 
    
     # args = c("h",
     #          "L:/Personal/Boaz/Signature/QCdata/20190829_14-40-07_906_ax136QCjgb2_C6TN_Events.csv" ,
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion230919\\QC\\QcScript.txt" )
     # 
    
    
    
     # args = c("h",
     #          "L:/Quality System/04 Work Packages/WPL44 software validation data/QC/20190523_10-55-04_152_URQCax128JGBmc_AO4U_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion230919\\QC\\QcScript.txt" )
    
     # args = c("h",
     #          "L:/Quality System/04 Work Packages/WPL44 software validation data/QC/20190523_10-55-04_152_URQCax128JGBmc_AO4U_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion120919\\QC\\QcScript.txt" )
    
    
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\QCdata\\20190626_11-58-15_928_QC At 30_R0WN_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion120919\\QC\\QcScript.txt" )

     # args = c("h",
     #           "L:\\Personal\\Boaz\\Signature\\QCdata\\20190626_11-58-15_928_QC At 30_R0WN_Events.csv",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion310719\\QC\\QcSsript.txt" )
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\QCdata\\20190528_10-29-03_155_URQCax128MC_XYYS_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion050919\\QC\\QcScript.txt" )
    
    # args = c("h",
    #          "L:\\Personal\\Boaz\\Signature\\QCdata\\20190528_10-29-03_155_URQCax128MC_XYYS_Events.csv",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion181119\\QC\\QcScript.txt" )
    
    # args = c("h",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion181119\\QC\\data\\20191114_15-32-36_398_QC SJ JGB AX141_AHX9_Events.csv",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion181119\\QC\\QcScript.txt" )

    #bugs and enhancements 070120
    # args = c("h",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\data\\20191114_15-32-36_398_QC SJ JGB AX141_AHX9_Events.csv",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\QcScript.txt" )
    # 
    
    # #bugs 090120 CL-25
    # args = c("h",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\data\\20191219_14-13-56_103858_AX0141-JGB-URQC_E4P5_Events.csv",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\QcScript.txt" )
    
    #bugs 090120 CL-28
    # args = c("h",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\data\\20191226_12-34-16_339_AX124QCjgb_3GN4_Events.csv",
    #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\QC\\QcScript.txt" )
    
    
    
    
     #DSVExample
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion280519\\DVS\\data\\example\\20190521_12-55-39_152_test1_SQBV_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion280519\\DVS\\DvsSsript.txt" )
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\DVS\\data\\examples\\20190521_12-55-39_152_test1_SQBV_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\DVS\\DvsSsript.txt" )
     # 
     
     # args = c("h",
     #          #"L:\\Personal\\Boaz\\Signature\\DVSdata\\20190908_17-24-53_251_DVS AX136_Q3JU_Events.csv",
     #          "L:\\Scientific\\Raw Data\\Reader_Data\\Accellix 136\\DVS\\20190908\\DVS CID-100-251\\20190908_17-24-53_251_DVS AX136_Q3JU_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion230919\\DVS\\DvsScript.txt" )

    # args = c("h",
    #        "L:\\Scientific\\Raw Data\\Reader_Data\\Accellix-R&D2\\DVS\\20191121\\DVS CID-100-388\\20191121_14-51-02_388_DVS1 AXRnD2_IQLE_Events.csv",
    #        "L:\\Personal\\Boaz\\Signature\\currentVersion211119\\DVS\\DvsScript.txt" )
    # 
    
    #new DVS with multiVotage
    
     # args = c("h",
     #           "L:\\Scientific\\Raw Data\\Reader_Data\\Accellix-150\\DVS\\20191226\\DVS CID-100-000339\\20191226_11-57-20_000339_DVS2-AX150_87CY_Events.csv",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\DVS\\DvsScript.txt" )
     
     #DVS Error no multiError line
     
     # args = c("h",
     #          "L:/Scientific/Raw Data/Reader_Data/Accellix 113/DVS/20191222/DVS CID-100-000304/20191222_11-16-34_000304_DVS-AX113_H3V6_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion070120\\DVS\\DvsScript.txt" )
     
     
      
      
     #UnumExample
     # args = c("h",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion210519\\Unum\\data\\20190424_23-13-38_102058_ACTR-S3-003_EBRK_Events.csv",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion210519\\Unum\\ScriptFile_UN100.txt")
     
     
     #UnumExample
     # args = c("h",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\unum\\data\\20190418_12-20-57_103101_TGranNLTestACTR_6A1B_Events.csv",
     #           "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\Unum\\ScriptFile_UN100.txt")
     # 
    
     #UnumExample
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\unumWorking\\data3\\20190424_19-34-58_103900_ACTR-S1-001_17ZF_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100619\\unumWorking\\ScriptFile_UN100.txt")
    
     # args = c("h",
     #          #"L:\\Personal\\Boaz\\Signature\\UnumData\\data6\\20190611_19-14-29_102103_ACTR-1X-02_K4QR_Events.csv",
     #          #"L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190611_21-29-45_102054_ACTR-4X-02_8YTQ_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190430_20-20-39_103899_ACTR-S5-002_SIHN_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion100919\\Unum\\ScriptFile_UN100.txt")

     # args = c("b1",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190424_19-34-58_103900_ACTR-S1-001_17ZF_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion080719\\Unum\\ScriptFile_UN100.txt") 

  
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data2\\20190424_22-22-03_103901_ACTR-S2-004_EV01_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion180619\\Unum\\ScriptFile_UN100.txt")
     
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\check\\20190418_12-20-57_103101_TGranNLTestACTR_SJG5_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion020719\\Unum\\ScriptFile_UN100.txt")
     
     
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\unum\\data\\20190424_21-57-49_104306_ACTR-S2-003_5Y2X_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\Unum\\ScriptFile_UN100.txt")
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\unum\\data\\20190424_22-46-26_103102_ACTR-S3-001_0QUQ_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion030619\\Unum\\ScriptFile_UN100.txt")
     
     
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190424_21-57-49_104306_ACTR-S2-003_HXS5_Events.csv",
     #          
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion170719\\Unum\\ScriptFile_UN100.txt")
     
     #GS100
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion060619\\GS100\\data\\20190417_13-42-43_11300009_GSK BL clone R1_K35K_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion060619\\GS100\\ScriptFile_GS100.txt")
      
      
    
     # args = c("h",
     #          "L:\\Quality System\\04 Work Packages\\WPL44 software validation data\\GS100\\20190501_10-18-40_10700044_ProdigyA-TCTtrial1-day7_AT4E_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion230919\\GS100\\ScriptFile_GS100.txt")
     # 
     # args = c("h",
     #          "L:\\Quality System\\04 Work Packages\\WPL44 software validation data\\GS100\\20190621_14-41-34_10700058_21June19-PCS3-s2_0GO7_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion230919\\GS100\\ScriptFile_GS100.txt")
     # 
     
     #TCR
     # args = c("h",                                     
     #          "L:\\Personal\\Boaz\\Signature\\TCRData\\20190501_11-25-22_11300041_ProdigyA-TCTtrial1-NYESOGen2a_MCSR_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion020719\\tcr\\ScriptFile_TCR.txt")
     
     #GSK
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\GSKdata_viability\\Events_CSV\\20190610_15-06-22_10700025_10June2019-TES-Part2-Donor1-Day12-35C-run1_NOXP_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion220719\\GSK\\ScriptFile_GS100.txt")
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190424_21-57-49_104306_ACTR-S2-003_HXS5_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion220719\\Unum\\ScriptFile_UN100.txt")
     
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\UnumData\\data4\\20190424_22-46-26_103102_ACTR-S3-001_977L_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion290719\\Unum\\ScriptFile_UN100.txt")
     
     # args = c("h",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion041019\\data\\20190430_20-20-39_103899_ACTR-S5-002_SIHN_Events.csv",
     #          "L:\\Personal\\Boaz\\Signature\\currentVersion041019\\ScriptFile_UN100.txt")
    
    # #TC100 verification with error
    
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion230120/TC100/data/error20200119_10-04-03_000442_Ax114-TC100JGB-WET-20200119-IT7186_68YD_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion230120/TC100/ScriptFile_ATP5.txt")

    #TC100  good example
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion230120/TC100/data/20191230_18-06-40_000305_CDChex-9301-AX149_17X5_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion230120/TC100/ScriptFile_TC101.txt")
    # 
    # #debug reg QC
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/QC/20191226_17-03-54_000334_QC1-AX150_EMYT_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/QC/QcScript.txt")
     
    #debug 
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/data/20191127_11-54-18_10700011_AX129 Diff 1 FS + Day 0 cells_2U0D_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/ScriptFile_G171.txt")
    
    #debug 
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/data/20191126_11-08-57_10700017_AX128-cartridge1-GSKactivation-RSP-Day7cells_1UWU_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/ScriptFile_ACT201.txt")
     
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/AllEventsFiles/2020_01_28_17_28_11_20191126_11_08_57_10700017_AX128_cartridge1_GSKactivation_RSP_Day7cells_1UWU_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/Scripts/ScriptFile_ACT201.txt")
    
    # args = c("h",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/AllEventsFiles/20191126_11-08-57_10700017_AX128-ACT201_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/Scripts/ScriptFile_ACT201.txt" )
     
    #debug
    # args =  c("h",
    #          "L:/Scientific/Raw Data/Reader_Data/Accellix 113/QC/20200205/QC CID-100-000530/20200205_17-09-45_000530_113-QC-RSP_COFU_Events.csv",
    #          "L:/Personal/Boaz/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =  c("h",
    #           "L:/Scientific/Raw Data/Reader_Data/Accellix 150/QC/20200303/QC CID-102-000029/20200303_08-27-56_000029_QC-AX150_UTQS_Events.csv",
    #           "L:/Personal/Boaz/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")

    # args =  c("h",
    #           "L:/Scientific/Raw Data/Reader_Data/Accellix 152/QC/20200309/QC CID-102-000027-failed low JGB event count/20200309_13-25-33_000027_QC1-AX152_DDIM_Events.csv",
    #           "L:/Personal/Boaz/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/QCdata100320/20200219_14-27-18_000044_RnD-QC-RSP-th_XSBW_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/QCdata100320/20200122_11-26-32_000001_RnD1-QC-2NDTRY_NGR3_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/Qcfailures/20200329_12-00-21_000529_QC-AX112_3ZLO_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/Qcfailures/20200329_11-00-51_000528_QC-AX110_U6FU_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
      
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/Qcfailures/20200219_14-29-30_000042_150-QC-RSP-th_G4RQ_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/QCdataset/20190612_13-51-23_557_1_XVID_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =  c("h",
    #           "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200303_08_25_42_000031_QC_AX140_EOAU_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #           "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200303_08-25-42_000031_QC-AX140_EOAU_Events.csv",
    #           "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20191210_12-28-44_000351_qcafteruvglue_k12q_events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200223_12-38-41_107732_RnD2-3um-RCP-8p_EAHT_Events-gated fsc.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20190923_18-09-52_993_QC AX114_FMTI_2Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20191120_11-43-03_000384_123_89K2_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/Ax128_SC101/20200420_10-46-46_11700047_AX128-StemCellCD3-R200420A-CDChexCD34-Level1_YNMM_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_SC101.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200324_15-17-55_000514_QC-AX110_SP_EDv38URQCv10.events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20190915_16-46-45_929_QC AX114_3SI3_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20191127_15-02-43_379_11_6WA4_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/X20190911_12_11_05_106821_URQC_AX137_SP_EDv38URQCv10_events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200329_17-32-01_000527_QC1-AX156_6CKS_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200315_08-46-59_000024_QC-AX152_DG3O_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20191219_11-06-51_336_AX147 QC_PLUC_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20191215_15-15-50_325_QC SJ AX147_6S3P_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    
    # args =   c("h",
    #            "C:/Nas/Signature/currentVersion270120/QCdataset/files/20200329_16-59-40_000516_QC1-AX156_U2X4_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
    

    # args =   c("h",
    #            "C:\\Nas\\Signature\\currentVersion270120\\QC\\20200511_09-58-35_0000336_QC-bubbles-AX158_HZ92_Events.csv",
    #            "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_QC.txt")
     
    # args =     c("h",
    #              "C:\\Nas\\Signature\\currentVersion270120\\ForContures\\TC100_1\\20191212_10-32-54_J.E6-1 CD4+ 100_Events.csv__Events.csv",
    #              "C:/Nas/Signature/currentVersion270120/Scripts/ScriptFile_TC100_03.txt")
    
    
    args =     c("h",
                 "C:/Nas/Signature/currentVersion270120/QCdataset/20190910_17-09-48_973_QC AX137_PTMZ_Events_small.csv",
                 "C:/Nas/Signature/currentVersion270120/ScriptFile_QC.txt")
    
    
    
    
    #20200329_17-32-01_000527_QC1-AX156_6CKS_Events.csv
  }
  
  lengthArgs = length(args)
  
  bScriptInCommand =  lengthArgs > 1
  
  #switchv:
  #b - batch get only switch
  #s - one run with out scriptpath
  #w - one run with  scriptpath 
  #sq - sequnce with  scriptpath get only switch
  #h use  to debdug
  #l - list with  scriptpath
  
  print(paste0("length arg -> " , lengthArgs ))
  switchv <- args[1]
  print(paste0("first Arg ->", switchv ))
  
  
  #"When there is no switch only file name
  if( lengthArgs >= 1 ){
    
    #The first argument is switch  
    if( switchv %in% c("b","b1" ,"s","w","sq","fmo","h","l", "sf" ) ){
      
      print(paste0("switchv -> " , switchv ))
      
      if(switchv == "s"){
      
        f <- args[2]
        switchv = "s"
        print(paste0("run default s , f -> ", f ) )  
      }
    
      #No switch   
    } else {
      
      f <- args[1]
      switchv = "s"
      print(paste0("run default s , f -> ",f ) )
      
    } 
    
  } 
  
  
  
  #Pre Define=============================

  DEBUG = FALSE 
  bUseSrciptName = FALSE
  DebugFilePath = "L:\\Personal\\Boaz\\Signature\\currentVersion080719__"
  DebugLevel = 1000
  
  
  fileListName = "Cartridges.txt"
  logName = "log.txt"
  
  
  

  # Global Functions======================
  rotboundary <- function(v,type , angle ){
    
    rotangel <- function(angle) matrix( rbind( c( cos( angle ) ,sin( angle ) ) ,c( -sin( angle ) ,cos( angle ) ) ),2,2)
    
    if( type == 1 ){
      
      re = matrix( c( v , 0 , v , 1 ),2,2,byrow = T ) %*% rotangel( angle )  
      
    } else {
      
      re = matrix( c( 0 , v , 1 , v ),2,2,byrow = T ) %*% rotangel( angle )  
    }
    
    
    dx = diff(re[,1])  
    dy = diff(re[,2])  
    
    b = v
    
    if(dx != 0){
      
      sl  = dy / dx  
      b = re[1,2]   - sl * re[1,1]  
      return(c( b, sl ) )
      
    } else {
      
      b = v
      return( c( b ) )
    }
    
  }
  
  
  addCounturs <- function( df ,cl ,cols , bNewPlot = FALSE,n = 200 ,NumberOfLines = 15,lowper = 0.05)
  {
    
    
    df = data.frame(df)
    # cl = df[,3]
    r1 = range( df[,1] )
    r1  = r1  + c( -1 , 1 )
    
    r2 = range( df[,2] )
    r2  = r2  + c( -1 , 1 )
    
    sp = split(df ,cl )
    
    
    if( bNewPlot ){
      
      plot( df[,1:2] ,pch = ".",col = cols[ cl ]  ,type = "n" ) 
      
    }
    
    # i = 0
    # #bl1 = length( cl ) == 1
    # buzseq = NULL
    #   
    # for( spi in sp){
    #   
    #   i= i + 1
    #   h <- kde2d( spi[,1], spi[,2], n = n, lims = c( r1, r2  ) )
    #   q = quantile(h$z,c( 0.05 , 0.9999 ) ) 
    #   #zseq = seq(lowper,q,length.out = NumberOfLines) # orginal 200 date100320
    #   zseq = seq(q[1],q[2],length.out = NumberOfLines) # orginal 200 date100320
    #   buzseq = c( buzseq , zseq ) 
    #   
    # }
    # zseq = buzseq
    
    h <- kde2d( df[,1], df[,2], n = n, lims = c( r1, r2  ) )
    q = quantile(h$z,c( 0.01 , 0.9999 ) ) 
    zseq = seq(q[1],q[2],length.out = NumberOfLines ) # orginal 200 date100320
    reo = contourLines(x = min(h$x) + diff(range(h$x))*seq(0, 1, length.out = nrow(h$z)),
                       y = min(h$y) + diff(range(h$y))*seq(0, 1, length.out = ncol(h$z)),
                       h$z, nlevels = nlevels,
                       #levels = pretty(range(z, na.rm = TRUE), nlevels),
                       levels = zseq)
    
    for(reoi in reo ){
      
      points( reoi$x , reoi$y ,col = 1 , "l" ) 
      
    } 
    
    
    # i = 0
    # for( spi in sp){
    #   
    #   i= i + 1
    #   h <- kde2d( spi[,1], spi[,2], n = n, lims = c( r1, r2  ) )
    #   q = quantile(h$z,c( 0.9999 ) )
    # 
    #   zseq = seq(lowper,q,length.out = NumberOfLines) # orginal 200 date100320
    #   
    #   #find contour
    #   reo = contourLines(x = min(h$x) + diff(range(h$x))*seq(0, 1, length.out = nrow(h$z)),
    #                      y = min(h$y) + diff(range(h$y))*seq(0, 1, length.out = ncol(h$z)),
    #                      h$z, nlevels = nlevels,
    #                      #levels = pretty(range(z, na.rm = TRUE), nlevels),
    #                      levels = zseq)
    #   for(reoi in reo) points( reoi$x , reoi$y ,col = cols[ i ] , "l" )
    #   
    # }
    
  }  
  
  
  getGussainfit <- function(dfin){
    
    mu = colMeans(dfin)
    dfin[,1] = dfin[,1] - mu[1]
    dfin[,2] = dfin[,2] - mu[2]
    Sigma = cov(dfin)
    return( list( mu = mu , sigma = Sigma ) )  
    
  }
  
  ellipse <- function(mu, sigma, alpha=.05, npoints=100,
                      newplot=FALSE, draw=TRUE, ...) {
    es <- eigen(sigma)
    e1 <- es$vec%*%diag(sqrt(es$val))
    r1 <- sqrt(qchisq(1-alpha,2))
    theta <- seq(0,2*pi,len=npoints)
    v1 <- cbind(r1*cos(theta),r1*sin(theta))
    pts=t(mu-(e1%*%t(v1)))
    return( pts )
  }
  
  
  findClusters <- function( da ,
                            m0step = 0.3 , 
                            m0std  = 0.8 ,
                            dfle   = 200 ,
                            max_m0_factor = 10,
                            NumOfCluster = 7,
                            MinNumberforClauster = 50 ,
                            minp0 = 1e-5,
                            maxSample = 1e4, 
                            buseplot = FALSE   )
  {  
    #load functions 
    if(TRUE){
      
      FineClustering <- function( kmcluster , df1 , minp0 ){
      
        
        sp1 = split( df1, kmcluster )  
        
        fitspar <- lapply(sp1[-1] , getGussainfit )
        
        #dmvnorm( mm[1:2,] , fitspar[[1]]$mu, fitspar[[1]]$sigma ) #remove
        
        #mm  = as.matrix(df1)
        b0 = kmcluster != 0
        
        df0 = df1[!b0 , ]
        mm0  = as.matrix( df0 )
        p = sapply( fitspar , function( x ) dmvnorm( mm0 , x$mu, x$sigma ) )
        
        p = data.frame(p)       
        
        p = sapply(p , function(x) x / max( x ) )
        
        #p = data.frame(p)
      
        cluster0 = apply( p , 1 , which.max )
        p0 = apply( p , 1 , max )
        
        cluster0[ p0 <  minp0  ] = 0
        
        #cluster = ifelse( pc < 1e-5 , 0, cluster  )
        
        kmcluster[ !b0 ]  = cluster0
        
        # cluster = apply( p , 1 , function(x) {
        # 
        #   w = which.max(x) 
        #   return( c( w ,p[w] )  )
        # 
        # } ) 
        
        return( kmcluster )
        
      }
      
      createNormalMatrix <- function(step = 0.5 , std = 1 ) 
      {
        #std = 0.5
        se = seq(-3,3, step )
        le = length( se )
        gi = expand.grid(se,se)
        
        df = data.frame( x = gi[,1], y = gi[,2] , dis = dnorm( apply ( gi , 1 , function(x) sqrt( sum(x^2)/std^2 ) ) ) ,stringsAsFactors = F)
        
        m = matrix( 0 , le , le )
        
        k = 0
        for( j in 1:le ) {
          
          for( i in 1:le ) {
            
            k = k + 1
            m[i,j] <- df[ k, 3 ] 
            
            
          }
        }
        
        return( m /sum( m ) )
        
      }
      
      createSubMatrix <- function(m0 ,  i , j , maxx , maxy ) 
      {
        
        di  = dim( m0 )[1]
        nh = ( di - 1 ) / 2
        
        
        mout = matrix(0, maxx + 2 * nh  ,maxy + 2 * nh  )
        
        ii  = i + nh
        jj  = j + nh
        
        mout[ (ii - nh):( ii + nh ) , ( jj - nh ):( jj + nh ) ] <- m0
        
        do = dim(mout)
        
        mout =  mout[(nh+1):(do[1] -nh),(nh+1):(do[2] -nh) ]
        
        return( mout )
        
      }
      
      creatIndexlocation_ <- function( point_in , range1 = c( 0, 10 ) , range2 = c( 0, 10 ) , le = 200  ){
        
        dx  = diff( range1 ) / le
        dy  = diff( range2 ) / le
        
        ex  = seq( range1[1] , range1[2] , dx )
        ey  = seq( range2[1] , range2[2] , dy )
        
        pxi = sapply( point_in[,1] , function( xin ) return( which.max( ex > xin ) - 1 ) )
        pyi = sapply( point_in[,2] , function( xin ) return( which.max( ey > xin ) - 1 ) )
        
        pxi = sapply( pxi, max, 1 ) 
        pxi = sapply( pxi, min, le ) 
        pyi = sapply( pyi, max, 1 ) 
        pyi = sapply( pyi, min, le ) 
        
        
        df = data.frame( pxi = pxi , pyi  = pyi , stringsAsFactors = F )
        
        return( df )
        
      }
      
      creatIndexlocation <- function( point_in , range1 = c( 0, 10 ) , le = 200  ){
        
        dx  = diff( range1 ) / le
        
        ex  = seq( range1[1] , range1[2] , dx )
        
        pxi = sapply( point_in[,1] , function( xin ) return( which.max( ex > xin ) - 1 ) )
        pyi = sapply( point_in[,2] , function( xin ) return( which.max( ex > xin ) - 1 ) )
        
        pxi = sapply( pxi, max, 1 ) 
        pxi = sapply( pxi, min, le ) 
        pyi = sapply( pyi, max, 1 ) 
        pyi = sapply( pyi, min, le ) 
        
        
        df = data.frame( pxi = pxi , pyi  = pyi , stringsAsFactors = F )
        
        return( df )
        
      }
      
      creat2Ddensity0 <-  function( df , nx = 100 , ny = 100 , n =  13 , m0in ){
        
        #width = 7
        #n = 13
        #d1 = diff( range1 )
        #dx = d1 / nx
        #nh = ( n -1 )/ 2
        #ex  = seq( 0 , diff( range1 ) , dx )
        
        m1 = matrix( 0 , nx, ny )
        
        for(i in 1:length( df$pxi )){
          
          m1 = m1 + createSubMatrix( m0in, df$pxi[ i ], df$pyi[ i ], nx , ny )  
          
        }
        
        return( m1 )
        
      }
      
      getCenters <- function(df1 , m1){
        
        exns = NULL
        for( n in 1:nrow(df1) ){
          
          #points( df[n,]/100 ,pch = 19 ,cex = 1 ,col =2)
          
          p1 = df1[n,1]
          p2 = df1[n,2]
          
          
          i = 0 
          for(i in 1:5){
            
            ex = expand.grid( p1 + (-1:1 ), p2 + (-1:1 ) )
            dm  = m1[p1 + (-1:1) ,  p2 + (-1:1)  ]  - m1[p1,p2]
            
            if( max(dm) != 0 ){
              
              exn = ex[dm == max(dm)]  
              
            } else {
              
              dx  = sample(-1:1,1)
              dy  = sample(-1:1,1) 
              exn[1] = exn[1]  + dx
              exn[2] = exn[2]  + dy
              
            }
            
            #points( exn[1]/100, exn[2]/100 ,pch = 19 ,cex =  ,col =2)
            
            p1= exn[1]
            p2= exn[2]
            
          }
          
          
          #points( (exn[1] - 0 )/100, ( exn[2] - 0)/100 ,pch = 19 ,cex = 1 ,col =3)
          
          exns = rbind(exns ,exn )
          
          
        }
        
        return( exns )
        
      }
      
      ConnectedComponents <-function(imagein){
        
        si = dim(imagein)
        
        mout = imagein 
        conflict = NULL
        cnum = 0
        for(yi in 1:si[2]){
          
          #yi = 3
          
          for(xi in 1:si[2]){
            
            #print( mout[yi,xi])
            
            if( mout[yi,xi] == 1 ){
              
              #print( paste0( yi ,"--" , xi ) )
              
              if( xi > 1 ){
                
                cp = mout[ yi ,  xi - 1 ]
                
              } else {
                
                cp = 0 
                
              }
              
              if( xi < si[2] ){
                
                ch = mout[ yi ,  xi + 1 ]
                
              } else {
                
                ch = 0 
                
              }
              
              if( yi > 1 ){
                
                cu = mout[ yi - 1 , xi ]
                
              } else {
                
                cu = 0 
                
              }
              
              if( yi < si[1] ){
                
                cd = mout[ yi + 1 , xi ]
                
              } else {
                
                cd = 0 
                
              }
              
              if( cu == 0 & cp == 0  &  cd == 0 & ch == 0 ){
                
                mout[yi,xi] = 0
                
              } else if(cu == 0 & cp == 0 ){
                
                cnum = cnum + 1
                
                mout[ yi  , xi  ] = cnum
                
                #print( cnum )
                
              } else if( cu != 0 & cp != 0 ){
                
                mout[ yi  , xi  ] = min( cp , cu )
                
                if( cu != cp ) { conflict = rbind( conflict ,c( max(cp,cu) , min( cp , cu ) ) ) }
                
              } else if( cu == 0 & cp != 0 ){
                
                mout[ yi  , xi  ] = cp
                
              } else if( cu != 0 & cp == 0 ){
                
                mout[ yi  , xi  ] = cu
                
              }
              
            }
            
          }
          
        }
        
        if(! is.null( conflict ) & TRUE ){
          
          for( i in  1:nrow( conflict ) ){
            
            mout[ mout == conflict[ i , 1 ] ]  <- conflict[ i , 2 ]    
            
          }
          
        }
        
        
        return( mout )
        
      }
      
    }
    
    xRange = range( da[,1] )
    yRange = range( da[,2] )
    
    #set wide y range if need 
    if( diff( yRange ) <  1 ) {

      yRange = c( yRange[1] - 0.4 , yRange[2]  + 0.4 )

    }
    
    #locationRange = c( min( xRange[1] ,yRange[1] ) , max( xRange[2] ,yRange[2] )  )
    
    m0 = createNormalMatrix(step = m0step , std = m0std ) 
    
    if(!is.null( NumOfCluster ) ){
      
      NumOfCluster = NumOfCluster + 1
      
    }
    
    #dfo = creatIndexlocation(da,locationRange,le = dfle )
    
    dfo = creatIndexlocation_(da,range1 = xRange , range2 = yRange ,le = dfle )
    
    if( nrow(dfo) > maxSample ){
      
      df = dfo[ sample( nrow( dfo ) , maxSample ), ] 
      
      fc = nrow( dfo ) / maxSample
      
    } else {
      
      fc = 1
      
      df = dfo
    }
    

    m1 = creat2Ddensity0( df ,dfle,dfle,  nrow( m0 ) , m0in = m0 )
    m11 = m1 / diff(range(m1) )
    
    if( buseplot ){
      
      par( mfrow = c( 1 , 3 ) )
      #image( m11,col = gray.colors(100) )  
      image( m11,col = hcl.colors(100, "YlOrRd", rev = TRUE )  )
      
    }
    
    seqfactors  = max_m0_factor + seq( -25 , 50 ,length.out = 100 )
    
    # if(!is.null( NumOfCluster ) ){
    #   
    # } else {
    #   
    #   seqfactors = max_m0_factor
    #   
    # }
    
    #k = 0
    #last_acceptable_mo = NULL
    
    
    buparm = NULL
    
    for( vfactor in seqfactors )
    {
      m11t  = m11  
      m11t[ m1 < max( m0 ) * vfactor ] = 0
      m11t[ m11t > 0 ]   = 1
      mo = ConnectedComponents( m11t )
      table_mo = table( mo )
      currentNumberOfclusters = length( table_mo )
      
      if( currentNumberOfclusters > 1 ){
      
        minClusterSize = min( table_mo[ 2:length( table_mo )])
        
        if( minClusterSize > MinNumberforClauster / fc  ){
        
          buparm = rbind( buparm , c( currentNumberOfclusters , vfactor , minClusterSize  ) )  
          
        }
      }
      
    } 
    
   
    
    vfactor_s = NULL
    if(!is.null( buparm ) )
    {
      
      if( !is.null( NumOfCluster ) )
      {
        
        buparms = buparm[ buparm[,1] == NumOfCluster , ] 
        
        le = length(buparms)
        
        if( le > 0  ){
          
          if( le == 2 ){
            
            vfactor_s  = buparms[ 2 ]
            
          } else {
            
            me = abs( median( buparms[,3]  ) - buparms[,3] )
            rown = which( min(me) == me )[1] 
            #rown = min(nrow( buparms ),3 ) 
            vfactor_s  = buparms[ rown , 2 ]
            
          }
          
        } 
        
      }
      
      #get the maximum 
      if(is.null( vfactor_s ) ){
        
        ta = table( buparm[,1] )
        tas = ta[ which( max(ta) == ta ) ]
        numClass = as.numeric(names(tas))
        buparms = buparm[ buparm[,1] == numClass , ]
        vfactor_s  = buparms[ min(nrow( buparms ),5 ), 2 ]
        
      }
      
      
      
    } else {
      
      return( clusters = rep( 0, nrow( da ) ) )
      
    }
    
    
    if( !is.null( vfactor_s ) )
    {
      
      
      m11[ m1 < max( m0 ) * vfactor_s ] = 0
      m11[ m11 > 0 ] = 1
      mo = ConnectedComponents( m11 )
      table_mo = table( mo )
      currentNumberOfclusters = length( table_mo )
      
      numsClass = as.numeric( names(table_mo ) )
      numberofClass = length( numsClass )
      
      # Change cluster number 
      di = 0
      for( ni in numsClass ){
        
        mo[mo == ni] = di
        di = di + 1 
        
      }
      
      table_mo = table( mo )
      names_table_mo = names(table_mo )
      
      if( buseplot ){ image( m11,col = gray.colors(100) ) }
      
      re = apply(dfo, 1, function(x){ mo[x[1],x[2]] } )
      
      bFineClustering = TRUE
      if( !is.null( NumOfCluster ) ){
      
        if( numberofClass != NumOfCluster ) {
        
            bFineClustering = FALSE
          
        } 
        
      }
      
      if( bFineClustering ){
        
        re = FineClustering( re , dfo , minp0 )
        
      }
      
      #View(mo)
      #par(mfrow = c(1,1))
      #image(mo)
      #table(re)
      
      if( buseplot ) 
      { 
        legendCols = rainbow(10)[ c(1:8) ]
        #legendCols = rainbow(100)[ c(1,10,20,30,50,60,70,80)]
        cols = legendCols[ factor(re) ]
        cexs = c( 1 ,0.01 )[ factor( re == 0 ) ]
        
        #sp = split(da,re)
        #sapply(sp, colMeans)
        
        plot( da,
              pch = c(19 ,1)[ factor( re == 0 ) ] ,
              col = cols , 
              main = "Clustering", #paste0( "Sizes ", paste0(table(re),collapse = ",") ) , 
              cex =  cexs  )
        
        legend("topleft", paste0( names_table_mo , " - ", table(re) ) , col = legendCols , pch = 19 , pt.cex = c( 0.5 , rep( 1 , 7 ) ) )
        
      }
      
      
      
      return( clusters = re )
      
      
      
    } else {
      
      return( clusters = rep( 0, nrow( da ) ) )
      
    }
    
  }
  

  flatten.dataframe <- function( df ,bWithStart = FALSE , bEnd = FALSE)
  {
    headstring = paste0("@" , deparse(substitute( df ) ) ,";")
    startString = ifelse( bWithStart , paste0("@Start","@Time;",Sys.time()), "")
    stringOut = paste0(startString, paste0( paste0( headstring , apply( df,1,paste0,collapse = ";")),collapse = "") )
    
    if(bEnd){
      
      stringOut = paste0(stringOut ,"@End")
      
    }
    
    
    return( stringOut )
    
  }
  
  #prepare summary adata for log  
  flattenSummary <- function( Summary.path ){
    
    #Summary.path = runResult$Summarypath

    if( ( file.exists( Summary.path ) &&  ( file.info( Summary.path )$isdir == FALSE  ) ) )
    {
      
      
      lines1 <- NULL
      con  <- file(Summary.path, open = "r")
      while ( length( oneLine <- readLines(con, n = 1, warn = FALSE) ) > 0 ){
        
        oneLine <- gsub("\t" , "," , oneLine )
        lines1 = c( lines1 , oneLine )
      }
      close(con)
      
      li = lines1[97]
      
      outString <- NULL
      for( li in lines1 ){
        
        if( li != ""){
          
          stts <- strsplit( li ,",")[[1]]
          outString = paste0( outString , paste0("@",paste0( stts ,collapse = ";" ) ) ,"")
           
        }
      }
      
      outString  = paste0( "@Start@Time;",Sys.time(), outString , "@End\n" )
      return( list( dirpath = dirname( Summary.path )  , strings = outString ))
      
    } else { 
      
      print("Unable To fined Summary Path")  
      return( list( dirpath = NULL  , strings = NULL )) 
      
    }
  }
      
      
  #     da = read.delim2(Summary.path , header=FALSE, comment.char="#",stringsAsFactors = F ,sep = "\t")
  #     da = read.delim2(Summary.path , header=FALSE, comment.char="#",stringsAsFactors = F ,sep = c(","))
  #     
  #     if( nrow(da) == 0 ){
  #       
  #       strings  = "Error:,Empty File"  
  #       return( list( dirpath = dirname( Summary.path )  , strings = strings ) )
  #       
  #     }
  #     
  #     bu = NULL
  #     
  #     #i = 3
  #     for( i in 1:nrow( da ) ){
  #       
  #       #da[ i , ] = da[ i , ]
  #     
  #       b = da[i,] != ""
  #       
  #       le = sum(b)
  #       
  #       if( da[i,1] != "" ){
  #         
  #         if(  le >= 2 ) { 
  #           
  #           print(paste0( c( paste0( "@",da[i,1]) ,da[i,] ) , collapse = ";" ))
  #             
  #               bu  = c( bu , paste0( c( paste0( "@",da[i,1]) ,da[i,] ) , collapse = ";" ) )    
  #               #bu  = c( bu , paste0( c( paste0( "@",da[i,1]) ,da[i,2] ) , collapse = ";" ) ) #remove
  #               
  #         } else if( le == 1 ){
  #   
  #             bu  = c( bu , paste0( "@",da[i,1]) )
  #         }
  #       }
  #     }
  #       
  #     strings = paste0( bu, collapse = "")
  #     #strings = gsub(";;",";",strings)
  #     
  #     return( list( dirpath = dirname( Summary.path )  , strings = strings )) 
  #     
  #   } else { 
  #     
  #     print("Unable To fined Summary Path")  
  #     return( list( dirpath = NULL  , strings = NULL )) 
  #     
  #   }
  #   
  # }
  
  get1var <- function( sf1 , x , bNumeric ){
    
    re = sf1$type[grepl( x, sf1$type )]
    
    if( length(re) > 0 ){
    
      return ( ifelse( bNumeric , as.numeric(strsplit( re , "=")[[1]][2] )  , strsplit( re  , "=")[[1]][2]  )   )
      
    } else {
    
      return( NULL )
    }
    
    
  } 
  
  createGenralData <-  function( swversion , swversiondate , scriptversion, basefilename , scriptdate  )  
  {
    generalData = c( "SW Version", paste0( swversion ))
    generalData = c( "SW Version Date", paste0( swversiondate ))  
    generalData = rbind( generalData , c( "Script Version", paste0( scriptversion ) ) )
    generalData = rbind( generalData , c( "Script Date"   , paste0( scriptdate    ) ) )
    generalData = rbind( generalData , c( "File Name", basename( f ) ) )
    generalData = data.frame( generalData )
    colnames( generalData ) = c( "Variable" , "Value" )
    return( generalData )
  }
  
  FatalErrorFunction <-function( ErrorTable ,generalData ,filepath ){
    
    FirstLine  = data.frame(col1 = "Error", col2 = "" )
    ErrorTable = data.frame(col1 = ErrorTable[1], col2 = ErrorTable[2] )
    
    sink( filepath )
    
    write.table( FirstLine ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
    cat("\n")
    write.table( ErrorTable ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
    cat("\n")
    write.table(generalData,row.names = F,sep  = "\t",quote=FALSE,col.names = T)
    
    sink()      
    
  }
  
  as.numeric0 <-  function(x) {
    if (suppressWarnings(all(!is.na(as.numeric(as.character(x)))))) {
      o = as.numeric(as.character(x))
    } else {
      o = x
    }
    
    return(o)
  }
  
  debugf <- function( s1, s2 , DebugFilePath, debugLevel,dl  ){
    
    if( file.exists( DebugFilePath ) ){
    
      if( debugLevel > dl )
      {
        if( class( s2 ) %in%  c("data.frame","matrix","list" ) ){
          
          fp = file.path( DebugFilePath , paste0( s1 ,".csv" ) ) 
          
          sink( fp )
          
            write.csv( s2 , fp )
          
          sink()
          
        } else {
          
          fp = file.path( DebugFilePath , "debug.txt" ) 
          
          callingFun = as.list(sys.call(-1))[[1]]
          
          sink( fp , append = T  )
          
            cat( paste(Sys.time(),callingFun,s1,s2,"\n",collapse = ";" ) )
        
          sink()
        }
      }
    }
  }
  
  findMinBetweenMaxs <- function( da , ms  ) {
    
    d = density(da)
    
    b = d$x > ms[1] &  d$x < ms[2]
    x = d$x[ b ]
    y = d$y[ b ]
    
    mx = x[which( min(y) == y ) ]
    
    return( mx )
    
  }
  #correct the brim of wide distribution
  meansBrimCluster <- function(dat, me, clNum )
  {
    tv = ( dat[,1] - me[2] ) / ( me[1] - me[2] )
    dat[ tv < 0,2 ]  = clNum[2]
    dat[ tv > 1,2 ]  = clNum[1]
    return( dat )
    
  }
  
  # Extract Test Number
  getCartNum <- function(filename)
  {  
    s = (strsplit(filename,"_")[[1]])[6]
    s = strsplit(s, "\\D+")[[1]]
    if(length(s)>=1)
    {
      return(as.numeric(s[2]))
    }
    else
    {
      return(0)
    }
  }
  
  loadScriptFile <- function( ScriptFilePath , efilepath ,WorkingDir ){
    
    sf = NULL
    
    result = tryCatch( { 
      
      if( ( exists( "ScriptFilePath" ) && file.exists( ScriptFilePath ) && file.info( ScriptFilePath )$isdir != TRUE ) ){ 
        
        
        sf = read.csv(ScriptFilePath,header = T,stringsAsFactors = F,row.names = NULL,sep = ";",quote = "")
        #Copy the Script File to the result directory
        file.copy( ScriptFilePath , file.path(WorkingDir, basename(ScriptFilePath) ) )
        0
        
      } else {
        
        if( exists( "ScriptFilePath" ) ) {
          
          ErrorTable1  = c("ERROR:"  , paste0( "Read file : Unable to read file NO Script File Path " , ScriptFilePath ) )
          #Copy the Script File to the result directory
          file.copy( ScriptFilePath , file.path(WorkingDir, basename(ScriptFilePath) ) )
          
        } else {
          
          ErrorTable1  = c("ERROR:"  , "Read file : Unable to read file NO Script File Path" )
          
        }
        
        print( ErrorTable1 )
        FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
        1
        
      }
      
      
    }, warning = function( w ) { 0 }, error = function(e) { 
      
      #Unable to read file
      if( exists( "ScriptFilePath" ) ) {
        
        ErrorTable1  = c("ERROR:"  , paste0( "Read file : Unable to read Script file ", ScriptFilePath ) )
        
      } else {
        
        ErrorTable1  = c("ERROR:"  , "Read file : Unable to read Script file "  )
        
      }
      
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      1
      
    }, finally = { })
    
    
    return( list( result = result , sf = sf ) )
    
  }
  
  #bfmo = FALSE
  runScript <- function( finput , ScriptFilePath  , bfmo , FMOpath = NULL )
  {
    
    print("Read File:")
    print( finput )
    print( paste0 ( "swversion =" ,swversion  )  )
    print( paste0( "sw version date = ", swversiondate ) ) 
    
    debugf("FILENAME" , basename( finput ) , DebugFilePath, DebugLevel , 100 )
    debugf( "eVersion", as.character( swversion) , DebugFilePath , DebugLevel , 100 ) 
    
    
    #Load Functions
    if( TRUE )
    {  
      
      #Prepare Script File Name
      if( bfmo )
      {
        
        ScriptFileName = "ScriptFileNameFMO.txt"
        
        
      } else {   
     
        ScriptFileName = "ScriptFileName.txt"
        
      }
      
      #Read Scirpt  file
      if( is.null( ScriptFilePath ) ) 
      {
        
        arg1 <- commandArgs(trailingOnly = FALSE )
        
        if( TRUE )
        {
          if( class(arg1) != "function" ) {
            
              scriptPath <- dirname(sub("--file=","",arg1[grep("--file",arg1)]))
              ScriptFileNamePath = file.path( scriptPath,ScriptFileName )
              con <- file( ScriptFileNamePath,"r"  )
              ScriptName <- readLines( con ,n = 1  )
              close(con)
              ScriptFilePath = file.path( scriptPath , ScriptName )
            
            }
          }
     
      }
      
      print(ScriptFilePath)
    
  #Functions
  
      BoundarFunctionLoad = TRUE
      
      if( BoundarFunctionLoad ){ 
        
        is.integer <- function (x) {x%%1==0} 
        
        #handle 2d and 1d array length
        length_ <- function(array , di = NULL ){
          
          le = length( array )
          
          if( is.null(di)){
            
            di = Inf
            
          }
          
          if( le > di ){
            
            #return( dim( array )[1] )
            return( nrow( array ) )
            
          } else if ( le == di) {
            
            return(1)
            
          } else { 
            
            return( length(array) )
          }
          
        } 
        
        #find the value of y for the colset x
        findy <- function(d,x){
          
          dx = abs ( d$x - x )
          return( d$y[ which( min(dx) == dx ) ] ) 
          
        }  
        
        
        #find the colset index for x
        findIndex <- function(d,x){
          
          dx = abs ( d$x - x )
          return( which( min(dx) == dx ) ) 
          
        } 
        
        # finded peaks
        find_peaks01 <- function (x, m){
          
          shape <- diff(sign(diff(x, na.pad = FALSE)))
          pks <- sapply(which(shape < 0), FUN = function(i){
            z <- i - m + 1
            z <- ifelse(z > 0, z, 1)
            w <- i + m + 1
            w <- ifelse(w < length(x), w, length(x))
            if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
          })
          pks <- unlist(pks)
          pks
          
        }
        
        #for array o list return all th minimums
        findMins <- function( d , maxx ){
          
          #pointx = c( d$x[1],maxx,dim(d)[1] )
          pointx = c( d$x[1], maxx , nrow( d ) )
          
          minx = NULL
          for( i in 1:( length( pointx ) - 1 ) ){
            
            stp  = findIndex(d,pointx[i])
            enp  = findIndex(d,pointx[i+1])
            y = d$y[stp:enp]
            x = d$y[stp:enp]
            mini = d$x[ stp + which( min(y) == y ) - 1 ]
            mini  = c( mini, d$y[ c(stp,enp) ] ) 
            minx = rbind( minx , mini )
          }
          
          if(!is.null(minx)){
            
            mini  = c( d$x[ length(d$y ) ], d$y[ enp ] , d$y[ length(d$y ) ] ) 
            minx = rbind( minx , mini )
            
          }
          
          
          return( minx )
          
        }
        
        
        
        # for list of max value and density return the half width location
        # use the cal_side to locate in the boudary_side the half with * factor location  
        findHalfWidth <- function(d, 
                                  maxx,
                                  maxindex, 
                                  boudary_side = "right" , 
                                  alpha_factor = 0.5 ,
                                  fc  = 2 ,
                                  cal_side = "left" )
        { 
          
          output = NA
          
          d = data.frame(x = d$x , y = d$y )
          
          maxXlocation = maxx[ maxindex ]
          
          maxValue = d$y[ findIndex( d , maxXlocation ) ] 
          
          runNum = 0
          continue = TRUE
          
          while( continue & ( runNum < 2 )  )
          {
            
            continue = FALSE
            
            maxInTheWay =  NULL 
            
            if( cal_side == "left" ){
              
              if( maxindex > 1 ){
                
                maxInTheWay =  maxx[ maxindex - 1 ] 
                
              }
              
              bs = d$x < maxXlocation
              
            } else {
              
              le_maxx =length_(maxx)
              
              if( maxindex <  le_maxx ){
                
                maxInTheWay =  maxx[  maxindex + 1 ] 
                
              }
              
              bs = d$x > maxXlocation
              
              #plot(d$x[bs],d$y[bs])
              #abline(h = alpha_factor  * maxValue )
            }  
            
            w = which( ( d$y < alpha_factor  * maxValue   ) & bs  )
            
            if( length( w ) > 0 ){
              
              xv = ifelse( cal_side == "left" , d$x[ max( w ) ], d$x[ min( w ) ] )
              
            } else {
              
              xv =  ifelse( cal_side == "left" , d$x[1], d$x[ length( d$x ) ] )                        
              
            }
            
            width  = abs( xv - maxXlocation )    
            
            dxx = ifelse( boudary_side == "right" , 1, -1 ) * fc * width 
            
            if( !is.null( maxInTheWay ) ){
              
              if( cal_side == "left" ){
                
                continue = maxXlocation - dxx < maxInTheWay 
                
              } else{
                
                continue = maxXlocation  + dxx  > maxInTheWay 
                
              }
              
              if( continue ){
                
                runNum = runNum + 1
                cal_side = ifelse( cal_side == "left","right","left" )
                
              }
            }
            
            output = maxXlocation + dxx 
            
          }
          
          
          return( output  )
          
        } 
        
        
        
        #  
        findBoundary0 <- function( d                      , # density table (d$x,d$y)
                                  maxx                   , # array of the max locaation
                                  minx                   , # array of the min locaation
                                  maxindex               , # the index of the maximum to use for the half width algorithm
                                  defineside             , # the direction of the boundary   
                                  default_bounadry       , # when no boudary has found
                                  alpha_factor     = 0.5 , # use factor use ( replacing the 0.5) in the with calculation 
                                  fc               = 2   , # the factor mutiplier ofth  half width
                                  ratio_boundary   = 3 )   # The limit for the max( ratio , 1/ ratio) 
          # where ratio is the ratio between the two maximum peaks arround the detected boundary 
        {   
          
          
          
          leMax =  length_(maxx)
          leMin =  length_(minx, 3 )
          led = length(d$x)
          
          if(leMax == 0 ){
            
            return( default_bounadry )
            
          } 
          
          if( leMax >= maxindex ){
            
            maxXlocation = maxx[ maxindex ] 
            
            if( leMax >= ( maxindex  + 1 ) ){
              
              rightx = minx[ maxindex  + 1, 1 ]
              righty = yBoundary = findy( d , rightx )
              #ratio = leMax[ maxindex  + 1, 2 ]/leMax[ maxindex  + 1, 3 ]
              ratio = findy( d , maxx[ maxindex  + 1 ] )  /  findy( d ,maxx[ maxindex ] )
              maxRatioRight = max(ratio , 1 / ratio )
              brightRatio = maxRatioRight  <  ratio_boundary
              print(paste0(  "bleftRatio = " , brightRatio , " maxRatioRight = ", round( maxRatioRight , 3 )  ) )
              bUseRightMin = TRUE
              print("findBoundary: bUseRightMin " )
              
            } else {
              
              rightx  = d$x[ led ]
              maxRatioRight = 9999
              brightRatio = FALSE
            }
            
            #if( leMin >= ( maxindex ) ){
            if( maxindex > 1 ){
              
              leftx = minx[ maxindex  ,1 ]
              lefty = findy( d , leftx )
              #ratio = minx[ maxindex , 2 ]/minx[ maxindex , 3 ]
              ratio = findy( d , maxx[ maxindex ] )  /  findy( d ,maxx[ maxindex - 1 ] )
              maxRatioleft = max(ratio , 1 / ratio )
              bleftRatio = maxRatioleft  <  ratio_boundary
              print(paste0(  "bleftRatio = " , bleftRatio , " maxRatioleft = ", round( maxRatioleft  , 3 ) ) )
              
              bUseLeftMin = TRUE
              print("findBoundary: bUseLeftMin " )
              
            } else {
              
              leftx = d$x[ 1 ]
              maxRatioleft = 9999
              bleftRatio = FALSE
              
            } 
          } else {
            
            print("findBoundary: Default Bounadry " )
            
            return( default_bounadry )
            
          }
          
          
          
          boudary_side = ifelse( defineside  > maxXlocation, "right" ,"left" )
          cal_side = ifelse( !defineside  > maxXlocation, "right" ,"left" )
          
          print(paste0(  "boudary_side = "   , boudary_side ) )
          print(paste0(  "cal_side     = "   , cal_side     ) )
          print(paste0(  "bleftRatio   = " , bleftRatio   ) )
          print("-------")
          
          
          if( ( boudary_side == "right" )  & brightRatio ){
            
            boudaryout  = rightx
            print(paste0( "Use rightx ", round( boudaryout , 2 ) ) )
            
          } else if ( ( boudary_side == "left" )  & bleftRatio ) {
            
            
            boudaryout  = leftx
            print(paste0( "Use leftx ", round(boudaryout,2) ) ) 
            
          } else {
            
            boudaryout  = findHalfWidth(d, maxx = maxx , maxindex = maxindex , boudary_side = boudary_side , alpha_factor = alpha_factor ,fc  = fc ,cal_side = cal_side )
            print(paste0( "Use half width ", round( boudaryout , 2 ) ) )
          }
          
          if( ( boudary_side == "right" ) ){
            
            
            boudaryout = ifelse( boudaryout > rightx , rightx , boudaryout )  
            
            if(  boudaryout > rightx ){
              
              print( paste0( "Cut boudaryout by rightx ", rightx ) )
            }
            
          } else if ( ( boudary_side == "left" ) ){
            
            
            boudaryout = ifelse( boudaryout < leftx , leftx , boudaryout )  
            
            if( boudaryout < leftx ){
              
              print( paste0( "Cut boudaryout by leftx ", leftx ) )
              
            }
            
          }
          
          return( as.double( boudaryout ) )
          
        }  
        
        
        find_Boundary <- function( da                     ,
                                   default_bounadry       ,
                                   maxindex         = 1   ,
                                   defineside             ,
                                   ratio_boundary   = 3   ,
                                   fc               = 2   ,
                                   alpha_factor     = 0.5 ,
                                   peaklength       = 30  ,
                                   peakhight        = 0.01,
                                   inString = NULL,
                                   minNumberOfpoints = 10
        )
        { 
          
          
          if( length( da ) < minNumberOfpoints ){
            
            
            bGlobalAssignErrorString <<- paste0( "Num of points ",length( da ), " < " , minNumberOfpoints )
            
          }
          
          
          
          
          if(!is.null( inString ) ){
            
            print( inString )
            
          } else {
            
            print( "inString in find_Boundary is NULL" )
            
          }
          
          # if( maxindex  == 11.1 ){
          #   
          #   browser()
          #   
          # }
          
          
          #use for debug
          Use_find_Boundary_plot = FALSE
          
          #create density 
          d = density(da)  
          
          #find maximum
          maxx = d$x[ find_peaks01( d$y , peaklength ) ]
          
          
          
          
          #if there are maximums
          if( length( maxx ) > 0  ){
            
            maxy = sapply(maxx,function(x){findy(d ,x)})
            
            #Check hight only  if ther is more than one
            if( length( maxx ) > 1 ){
              
              maxx = maxx[ maxy > peakhight  ]
              
            } 
            
            
            if( length( maxx ) >= 1 ) {
              
              #if maxindex is no integer use it as location and check which maximum is the colset        
              if ( !is.integer( maxindex ) ){
                
                dnaxx = abs( maxindex - maxx )
                maxindex = which(  dnaxx == min( dnaxx ) )
                
              }
              
            }
            
            
            # find the minumums betweens tha maximu with addition start and end points
            minx = findMins( d , maxx )
            
            if( Use_find_Boundary_plot ){
              
              plot(d)
              abline( v = maxx )
              abline( v = minx[,1] ,col =2 ) 
              
            }
            
            boudaryout =  findBoundary0( d                                   , 
                                         maxx             = maxx             , 
                                         minx             = minx             , 
                                         maxindex         = maxindex         , 
                                         defineside       = defineside       ,
                                         default_bounadry = default_bounadry ,
                                         ratio_boundary   = ratio_boundary   ,
                                         fc               = fc               ,
                                         alpha_factor     = alpha_factor )
            
            if( Use_find_Boundary_plot ){
              
              if( length( maxx ) >= maxindex ) {
                
                x1 = maxx[maxindex]
                y1 = findy(d, maxx[maxindex] )
                
                points( x1 , y1 , pch = 19 ,col = 2 , cex =3  ) 
                
              }
              abline( v = boudaryout ,col = 5 ,lwd = 2, lty = 2) 
              
            }
            
          } else {
            
            boudaryout = default_bounadry
            
          }
          
          return( as.double( boudaryout ) )
          
        }
        
        find_Boundary11 <- function( da                     ,
                                   default_bounadry       ,
                                   maxindex         = 1   ,
                                   defineside             ,
                                   ratio_boundary   = 3   ,
                                   fc               = 2   ,
                                   alpha_factor     = 0.5 ,
                                   peaklength       = 30  ,
                                   peakhight        = 0.01
        )
        { 
          
          # if( maxindex  == 11.1 ){
          #   
          #   browser()
          #   
          # }
          
          print( "function( find_Boundary )" )
          print( paste0(  "default_bounadry = ",default_bounadry,
                          ", maxindex = "       ,maxindex        , 
                          ", defineside = "     ,defineside      , 
                          ", ratio_boundary = " ,ratio_boundary  , 
                          ", fc = "   ,fc              , 
                          ", alpha_factor = "   ,alpha_factor    , 
                          ", peaklength = "     ,peaklength      , 
                          ", peakhight = "      ,peakhight      ) ) 
                
          
          
          #use for debug
          Use_find_Boundary_plot = FALSE
          
          #create density 
          d = density(da)  
          
          #find maximum
          maxx = d$x[ find_peaks01( d$y , peaklength ) ]
          
          #if there are maximums
          if( length( maxx ) > 0  ){
            
            print("Max Location", maxx )
            print( maxx )
            
            
            maxy = sapply(maxx,function(x){findy(d ,x)})
            
            print("Max Location", maxy )
            print( maxy )
            
            #Check hight only  if ther is more than one
            if( length( maxx ) > 1 ){
              
              maxx = maxx[ maxy > peakhight  ]
              print( paste0( "Max Location maxy < ", peakhight ) )
              print( maxx )
            } 
            
            
            if( length( maxx ) >= 1 ) {
              
              #if maxindex is no integer use it as location and check which maximum is the colset        
              if ( !is.integer( maxindex ) ){
                
                print(paste0( "Use floating boundary " , maxindex ) )
                dnaxx = abs( maxindex - maxx )
                maxindex = which(  dnaxx == min( dnaxx ) )
                print(paste0( "The boundary is = " , maxindex ) )
                
              }
              
            }
            
            
            # find the minumums betweens tha maximu with addition start and end points
            minx = findMins( d , maxx )
            
            if( Use_find_Boundary_plot ){
              
              plot(d)
              abline( v = maxx )
              abline( v = minx[,1] ,col =2 ) 
              
            }
            
            
            if(is.null( minx ) ){
              
              print(paste0( "Minimum Locations" , minx[,1] ) )
              
            }
            
            boudaryout =  findBoundary0(d                                   , 
                                        maxx             = maxx             , 
                                        minx             = minx             , 
                                        maxindex         = maxindex         , 
                                        defineside       = defineside       ,
                                        default_bounadry = default_bounadry ,
                                        ratio_boundary   = ratio_boundary   ,
                                        fc               = fc               ,
                                        alpha_factor     = alpha_factor )
            
            if( Use_find_Boundary_plot ){
              
              if( length( maxx ) >= maxindex ) {
                
                x1 = maxx[maxindex]
                y1 = findy(d, maxx[maxindex] )
                
                points( x1 , y1 , pch = 19 ,col = 2 , cex =3  ) 
                
              }
              abline( v = boudaryout ,col = 5 ,lwd = 2, lty = 2) 
              
            }
            
          } else {
            
            boudaryout = default_bounadry
            
          }
          
          return( as.double( boudaryout ) )
          
        }
        
        clusterconture <- function( df ){ 
          
          #loadFunctions
          
          use_plot_clusterconture = FALSE
          
          if( TRUE) {
            
            contourCircumfrence <- function(cont, yScale = 1){
              sum(sqrt(diff(cont$x)^2+diff(cont$y/yScale)^2))
              
            }
            
            closeOpen <- function(rein){
              
              #rein = re
              rout = rein
              if(!isclose(rein)){
                
                
                if( ( abs( rout$y[1] - rout$y[ length( rout$y ) ] ) > 0.1  ) &  
                    ( abs( rout$x[1] - rout$x[ length( rout$x ) ] ) > 0.1  )    )
                {
                  
                  rout$x = c( rout$x , rout$x[1] ) 
                  rout$y = c( rout$y,  rout$y[ length( rout$y ) ] ) 
                  
                } else {
                  
                  rout$x = c(rout$x,rout$x[1]) 
                  rout$y = c(rout$y,rout$y[1]) 
                  
                }
                
              }
              
              rout
              
            }
            
            closeopen1 <- function(x) {
              
              conx = x$x[1] != x$x[length(x$x)]
              cony = x$y[1] != x$y[length(x$x)]
              
              if( ( conx  & !cony  ) | ( !conx  & cony  ) )
              {
                
                x$x = c( x$x , x$x[ 1 ] )
                x$y = c( x$y , x$y[ 1 ] )
                
                
              } else if ( conx  & cony  ){
                
                x$x = c( x$x , x$x[ length(x$x) ], x$x[ 1 ] )
                x$y = c( x$y , x$y[ length(x$y)  ] , x$y[ 1 ] )
                
                
              }
              
              return( x )
              
            }
            
            GetDifferentCounter <- function(re){
              #re = reo
              #ORDER CONTURE 
              containing1 <- function(g1,g2){
                
                #sum( g2 %in% g1 )/length(g1) > 0.95
                sum(point.in.polygon(g2$x, g2$y, g1$x, g1$y, mode.checked=FALSE) == 1)/length(g2$x) > 0.5
                
              }
              
              onlyUnique <- function(l,n1,n2){
                
                #list (gou = g1[!(g1 %in% g2)] , Stranger = sum((g1 %in% g2)) == 0)
                g1 = l[[n1]]
                g2 = l[[n2]]
                g1[!(g1 %in% g2)]
                
              }
              
              is.stragers <- function(lin,n1,n2){
                #list (gou = g1[!(g1 %in% g2)] , Stranger = sum((g1 %in% g2)) == 0)
                g1  = lin[[n1]]
                g2  = lin[[n2]]
                sum(g1 %in% g2)  == 0
                
              }
              
              
              
              #re = length
              gix = 1:length(re)
              
              if(length(gix) > 1 ){
                
                #prepare indexes 
                gix  = expand.grid(gix,gix)
                gix = gix[gix[,"Var1"] != gix[,"Var2"],]
                
                # check order contain
                gi = within(gix,containing <- unlist(apply(gix,1,function(x)containing1(re[[x[1]]],re[[x[2]]]))))
                
                #select only strage high level 
                bu = NULL
                for( i in 1:length(re) ) {
                  
                  if(!any(gi[gi$Var1 == i,"containing"]))
                  {
                    bu = c(bu,i)
                  }  
                }  
                
                
                #fine hierarchy in group
                l = NULL
                i =0
                for(u in bu){
                  i=i+1
                  l[[i]] = c( gi[gi[,2] == u[1] & gi[,"containing" ] == TRUE, 1 ], u[1] ,-1)
                  l[[i]] = l[[i]][1:(length(l[[i]])-1)]
                }
                
                
                if(length(l) > 1 ){
                  
                  gii = 1:length(l)
                  gii  = expand.grid(gii,gii) 
                  gii = as.matrix(gii[gii[,"Var1"] != gii[,"Var2"],])
                  
                  
                  selOverlap = !apply(gii,1,function(x) is.stragers(l,x[1],x[2]) )
                  
                  if( ( any(selOverlap) == TRUE )   & FALSE ){
                    
                    v = unique(as.vector(gii[selOverlap,]))
                    l1 =  l[!(1:length(l) %in% v)]
                    #le = length(l1)
                    
                    # gii = gii[selOverlap,]
                    # 
                    # for(  i in 1:dim(gii)[1]){
                    #   l1[[le + i]] = onlyUnique(l,gii[i,1],gii[i,2])
                    # }
                    
                    l = l1
                  }
                  
                  
                }
              }else{
                
                l = gix
              }
              
              l
            }
            
            flec <- function(x){length(x$x)}
            
            isclose <- function(rein){
              
              x1 = c(1,length(rein$x))
              de = sqrt(diff(rein$x[x1])^2 + diff(rein$y[x1])^2)
              out = de == 0
              out
            }
            
            # remove low close Strage peaks 
            removeDublicatePeaks <- function( l )
            {
              lo = l
              
              le = sapply( l ,function(x) length(x))
              maxv = max( sapply( l ,function(x) max(x))  ) 
              
              for( maxi in 1:maxv ){
                
                w = sapply( lo, function( x ) { which( x %in% maxi ) } )
                
                if( length(w) > 1) {
                  
                  b = sapply( w, function(x) { length( x ) > 0   } )
                  
                  if( sum(b) > 1 ){
                    
                    lnum = (1:length(w))[b]
                    wo = sapply( w[b], function(x) x[1])
                    wi  = ( le[b] - wo  )
                    bi = wi <  4 
                    
                    if( sum(bi) > 1 ){ 
                      
                      wh = which(wi[bi] == min(wi[bi]))[1]
                      lo[[ lnum[  wh ] ]] <- NULL
                      #print(lnum[  wh ])
                    }
                  }
                }
                
              }  
              
              return( lo )
              
            }
            
            maxStrange <- function( UpStrangeCountor ){
              
              le = length( UpStrangeCountor )
              
              maxv = max( sapply( UpStrangeCountor,max) )
              
              for( i in 1:maxv){
                
                s = sapply( UpStrangeCountor, function (x) { i %in% x  } )
                
                if( sum( s ) > 1 ){
                  
                  UpStrangeCountor = lapply( UpStrangeCountor, function (x) { x[x != i] }    )
                  
                }
                
              }
              
              return( UpStrangeCountor )
              
            }
            
            lowlevels <- function( x ){
              
              sapply(x,function(y) length(reo[[y]]$level) < 2 )
            }
            
            levelreduction <- function( x ){
              
              levs = sapply(x,function(y) reo[[y]]$level )
              
              le = length( levs)
              
              if( le > 20 ){
                
                fc = 5
                
              } else if ( le > 8 ){
                
                fc = 2
                
              }
              
              if( le > 10 ){
                
                se  = seq(1,le , le/ fc )
                
                if( !( le  %in% se ) ){
                  
                  se = c( se , le )
                  
                }
                
                return(x[ se ] ) 
                
                
              } else {
                
                return(x)
                
              }
              
            }
            
            is.sidetoside <- function(x) {
              
              return( ( x$x[1] != x$x[ length(x$x) ] )  & ( x$y[1] != x$y[ length(x$y) ]  ) )
            }
            
            area <-function(x) {diff(range(x$x)) * diff(range(x$y))}
            
            
            
          }
          
          r1 = range(df[,1] )
          r1  = r1  + c(-1,1)
          
          r2 = range(df[,2] )
          r2  = r2  + c(-1,1)
          
          #h <- kde2d(df[,1], df[,2], n = 50, lims = c( min(df[,1] ), max(df[,1]) , quantile(df[,2],c( 0.01,0.9999 ) ) ) )
          #h <- kde2d( df[,1], df[,2], n = 50, lims = c( range(df[,1] ), range( df[,2] ) ) )
          h <- kde2d( df[,1], df[,2], n = 200, lims = c( r1, r2  ) )
          
          q = quantile(h$z,c(0.5,0.9999)) 
          zseq = seq(0.01,q[2],length.out = 100) # orginal 200 date100320
          
          #find contour
          reo = contourLines(x = min(h$x) + diff(range(h$x))*seq(0, 1, length.out = nrow(h$z)),
                             y = min(h$y) + diff(range(h$y))*seq(0, 1, length.out = ncol(h$z)),
                             h$z, nlevels = nlevels,
                             #levels = pretty(range(z, na.rm = TRUE), nlevels),
                             levels = zseq)
          
          
          #Remove small conture
          reo = reo[ sapply( reo , function(x){length(x$x)}) > 2 ] 
          reo = reo[ !sapply( reo , is.sidetoside ) ]
          reo = lapply( reo , closeopen1 )
          l = GetDifferentCounter(reo)
          l = l[ sapply( l , function(x){ length(x) } ) > 2 ] 
          
          l = removeDublicatePeaks(l)
          l1 = maxStrange(l)
          
          l2 = l1[ sapply( l1 , function(x) length(x) >= 2 )]
          l3 = sapply(l2,function(x){x[1]})
          
          outlist = NULL
          for( ll in l3){
            
            outlist = c(outlist,ll )
            
          }
          
          reo1 = reo[outlist]
          
          #cl = rep( 0, dim(df)[1] )
          cl = rep( 0, nrow( df ) )
          
          for( i in 1:length(reo1)){
            
            indexcl  = which( point.in.polygon( df[,1], df[,2] , reo1[[i]]$x , reo1[[i]]$y, mode.checked= FALSE ) == 1 )
            if( length( indexcl ) > 0 ){
              
              if( length( indexcl ) > 100 ){
                
                cl[ indexcl ] = i
                
              }
              
            }
          }
          
          
          ta = table( cl )
          clta = as.numeric(names(ta))
          sdta = sd(ta[ clta != 0 ] )
          meanta = mean( ta[ clta != 0 ] )
          
          min_size_of_cluster = min( min_size_of_cluster ,  meanta - 2 * sdta )
          
          print( paste0(  "min_size_of_cluster  = " , min_size_of_cluster ) )
          
          i = 0 
          for( ti in ta ){
            i= i+ 1
            if( ti < min_size_of_cluster ){
              
              print( paste0( "Cluster " , clta[i] , "size is " , ti , "< "  , min_size_of_cluster  )  )
              
              cl[ cl  ==  clta[i] ] = 0 
              
            }  
          } 
          
          
          if( use_plot_clusterconture ){
            
            plot( df ,pch = "." ,type = "n")
            n = 1
            points(reo1[[n]]$x,reo1[[n]]$y,"l",col = 3 , xlim = c(-1,3.5),ylim = c(-1,3e3))#,col = cl$cluster[1])
            
            if(length(reo1) > 1){  
              # i =0  
              for(re1 in reo1[2:length(reo1)]){
                #i=i+1
                #i
                #re1 = reo1[[i]]
                #re1
                #points(re[[i]]$x,re[[i]]$y,"l",col = ifelse(isclose(re[[i]]),2,1))
                points(re1$x,re1$y,col = 3,"l" )# pch= 19
              }
              
            }
            
            points( df[cl != 0 ,] ,col = rainbow( length( unique( cl[cl != 0 ] ) ) )[factor( cl[cl != 0 ] )],pch = "." )
            
          }
          
          return( list( clusters = cl, contures = reo1 )   )
          
        }
        
       }
      
      qc_clusterconture <- function( df ,colindex = 1 ){ 
        
        use_plot_qc_clusterconture = FALSE
        
        
        #numOfEvents  = dim( df )[1]
        numOfEvents  = nrow( df )
        
        if( numOfEvents < count_min_number  ){
          
          #Not enough event after FSC filter Error !!!!
          print( paste0(" Number of events is " , numOfEvents ," is below count_min_number " ,  count_min_number ) ) 
          
        }
        
        out = clusterconture(df)
        sp = split( df[ out$clusters != 0, ],out$clusters[ out$clusters != 0 ] ) 
        cl = out$clusters
        
        # if the two low lcuster are one
        b1 = NULL
        if( length( sp ) == 6){
          
          msp = sapply( sp ,function(x){ mean( x[ , 1 ] ) })
          gw = which( min( msp) == msp )
          clusterNumber = as.numeric( names(sp)[gw] )
          ds = sp[[ clusterNumber ]][ , 1 ]
          #hist(  ds )
          
          maxindex = 7.1
          default_bounadry = 0
          defineside = 0
          ratio_boundary = 20
          fc  = 2
          alpha_factor = 0.5
          
          b1 = find_Boundary(   ds ,
                                default_bounadry,
                                maxindex = maxindex ,
                                defineside = defineside,
                                ratio_boundary = ratio_boundary,
                                fc  = fc,
                                alpha_factor = alpha_factor,NULL )
          
          
          ckw  = which(cl == clusterNumber)
          b7 = df[ckw , colindex ] >  b1
          
          cl[ ckw[ b7 ] ] = 7
          if( use_plot_qc_clusterconture ) {
            
            plot( df ,pch = "." ,type = "n",main = "QC clustering Results" )
            points( df[cl != 0,] ,col = rainbow( max( max( cl ) , 7 ) )[factor( cl[cl != 0] )],pch = "." )
            abline( v = b1 ,col = 3 , lwd = 2, lty = 2 )
          }
          
          
        } else{
          
          print( paste0( "only " , length( sp ), " clusters !!!!" ) )
          
        } 
        
        return( list( classification = cl , b1 = b1 ) )
        
       }
      
      
      find2widthi <- function(d, maxIndex  , bSide = TRUE , alpha = 0.5 )
      {
        
        output = NA
        d = data.frame(x = d$x , y = d$y )
        
        maxValue = d$y[ maxIndex ]
        maxXlocation = d$x[ maxIndex ]
        
        if( bSide ){# right side
          
          w = which( ( d$y < alpha  * maxValue   ) & ( d$x > maxXlocation ) )
          
          if( length( w ) > 0 ){
            
            w_min = min( w )  
            width  = d$x[ w_min ] - maxXlocation
            output = maxXlocation + 2* width
          }          
          
        } else { #left side
          
          w = which( ( d$y < alpha  * maxValue   ) & ( d$x < maxXlocation ) )
          
          if( length(w) > 0 ){
            
            w_max =  max( w )     
            width  = d$x[ max( w ) ] - maxXlocation
            output = maxXlocation + 2* width 
            
          }          
          
        }
        
        return( output  )
        
      }
        
                                  
      #Type = 0,levels1 = 100,minV  = 0.01 ,n1 = 512, maxpin = NULL ,pre = 0, defaultThreshold , minWidth = 5 , minPeak = 0.05 , buseside = TRUE, fc = 2 )
        
      #find_threshold <- function( re ,Type = 0,levels1 = 100,minV  = 0.01 ,n1 = 512, maxpin = NULL ,pre = 0, defaultThreshold , minWidth = 5 , minPeak = 0.05 , buseside = TRUE, fc = 2 )
      find_threshold <- function( d1data , Type = 1 , m = 40 , miny = 0.01 , pre = 0 , defaultThreshold = NULL , fc = 2 ,minx = NULL , alpha = 0.5 , positive_boundary = NULL , selbyindex = NULL ,min_max_min_diff , debugfunction = "FALSE" )
      {
      
        #stop  for debuging
        if( debugfunction  ==  "TRUE"){
          
          browser()
        }
        
        # finded peaks
        find_peaks01 <- function (x, m){
          
          shape <- diff(sign(diff(x, na.pad = FALSE)))
          pks <- sapply(which(shape < 0), FUN = function(i){
            z <- i - m + 1
            z <- ifelse(z > 0, z, 1)
            w <- i + m + 1
            w <- ifelse(w < length(x), w, length(x))
            if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
          })
          pks <- unlist(pks)
          pks
          
        }
        
        #fined accepted peaks and minimums 
        find_peaks02 <- function(da,m = 40,miny = 0.01 ,default_location = NULL, minx = NULL , selbyindex = NULL , min_max_min_diff )
        { 
          
          if( !is.null ( selbyindex ) ) {
            
            #browser()
          }
          
          d = density(da)
          
          #extract peaks 
          maxw = find_peaks01(d$y, m = m)
          
          #filter max by high
          maxw = maxw[ d$y[maxw] > miny ]
          
          #filter max by location 
          if( !is.null( minx ) ){
            
            maxw = maxw[ d$x[maxw] > minx ]
            
          }
          
          xminLocation = NULL
          yminLocation = NULL
          
          
          #hold number of peaks
          lemax = length(maxw)
          
          removeMaxIndexs =  NULL
          #more than one peak fined mininums location
          
          
          #initation 
          leftsidex = NULL
          leftsidey = NULL
          
          rightsidex = NULL
          rightsidey = NULL
          
          if( lemax > 1 )
          {
            xminLocation = NULL
            yminLocation = NULL
            
            for(i in 1:(length(maxw) - 1 )  ){
              
              #Get minimum between two maximums
              ymin = min(d$y[maxw[i]:maxw[i+1]])
              
              #remove Shallow minimum 
              leftSideDiff   = ( d$y[maxw[ i   ] ] -  ymin ) / d$y[ maxw[ i ] ]
              rightSideDiff  = ( d$y[maxw[ i+1 ] ] -  ymin ) / d$y[ maxw[ i + 1 ] ]  
              iLowIndex = ifelse( rightSideDiff <=  leftSideDiff , i + 1  , i  )
              #check if the minimum is shallow
              fMinRatio = ( d$y[ maxw[ iLowIndex ] ] - ymin ) / d$y[ maxw[ iLowIndex ] ]
              bMinIsLow = fMinRatio  <  min_max_min_diff
              
              print( paste0("fMinRatio ", fMinRatio ," bMinIsLow ", bMinIsLow ) ) 
              
              #if shallow rmove minimum and the the low maximum if the maximum are the same remove the right maximum 
              if(  bMinIsLow ){
                
                w = which(FALSE)
                removeMaxIndexs  = c(removeMaxIndexs , iLowIndex )
                print(paste0("Remove max index ", iLowIndex ," in Location ", d$x[ maxw[  iLowIndex ] ] ) ) 
                
                
              } else {
                
                #find minimum index
                w = which( ymin == d$y )  
                
              }
              
              if(  length(w) != 0 ){
              
                if(length(w) > 1 ){
                  
                  xminLocation = c( xminLocation , mean(d$x[ w ] ) )
                  yminLocation = c( yminLocation , mean(d$y[ w ] ) )
                  
                } else {
                  
                  xminLocation = c( xminLocation, d$x[ w ])
                  yminLocation = c( yminLocation, d$y[ w ])
                  
                }
              }
            }
            
            #remove maximums that are close to shallow minimum
            if( length( removeMaxIndexs ) > 0  ){
              
              maxw = maxw[ -removeMaxIndexs ]
              
            }
            
           
            
            if( !is.null(selbyindex) && length( maxw ) >= selbyindex ){
            
              maxw = maxw[ selbyindex ]
              
              if( !is.null( xminLocation ) )
              {
                
                #Min with selbyindex exist
                if(  length( xminLocation ) >= selbyindex )
                {
                  
                 rightsidex = xminLocation[ selbyindex ]
                 rightsidey = yminLocation[ selbyindex ]
                
                 #Min with selbyindex - 1  exist
                 if( selbyindex > 1 )
                 {
                  
                  leftsidex = xminLocation[ selbyindex - 1 ]
                  leftsidey = yminLocation[ selbyindex - 1 ]
                  
                 } 

                } 
                  
              }
              
              #remove min's
              xminLocation = NULL
              yminLocation = NULL
                
            }
            
          }
          
          
          #abline(v = d$x[maxw], col = 3)
          #abline(v = xminLocation, col = 2)
          
          finalmin = NULL
          
          ##min location has been found add to all locations
          if( !is.null( xminLocation ) ){
          
            all_x = c( d$x[maxw], xminLocation ) 
            all_y = c( d$y[maxw], yminLocation ) 
            
          } else {
            
            all_x = d$x[ maxw ] 
            all_y = d$y[ maxw ] 
            
          }
          
          or = order(all_x)
          
          if(is.null( rightsidex ) ){
            
            rightsidex = d$x[ length(d$x) ]
            rightsidey = d$x[ length(d$y) ]
            
            
          }
          
          if(is.null( leftsidex ) ){
            
            leftsidex = d$x[ 1 ]
            leftsidey = d$y[ 1 ]
            
          }
          
          all_x = c( leftsidex , all_x[ or ], rightsidex )
          all_y = c( leftsidey , all_y[ or ], rightsidey )
          
          return(list( d = d, all_x  = all_x , all_y = all_y ,max_x = d$x[maxw],max_y = d$y[maxw] , min_x = xminLocation , min_y = yminLocation , finalmin = finalmin ) )
          
        }
        
        
        reo = find_peaks02(d1data, m , miny, minx = minx , selbyindex = selbyindex ,min_max_min_diff = min_max_min_diff )
        
        if( !is.null ( selbyindex ) ){
          
          #browser()
          
        }
        
          #reo = findpeak1(re , levels1 ,minV ,n1 ,maxpin , minWidth , minPeak )
        
        #No minimum value only one peak has been found       
        if( is.null( reo$min_x[1] ) ){
          
          print("No Mininum Value !!!!")
          
          if( !is.na( reo$max_x )){
            
            maxXlocation  = reo$max_x
          
          #use Knee method
            if( Type == 0 ){ 
            
            print("Use Knee Method")
            
            #load Knee function 
            findKnee <- function(reo, pre = 0)
            { 
              
              d =  reo$d
              x1 = reo$max_x[1]  
              x2 = reo$all_x[ length( reo$all_x ) ]
              y1 = reo$max_y[1]
              y2 = reo$all_y[ length( reo$all_x ) ] 
              
              s = (y2-y1)/(x2-x1)
              b  = y2 - s*x2
              
              selx  = (d$x > x1) & (d$x < x2)
              ys = d$y[selx]
              xs = d$x[selx]
              
              ls1 = s*xs + b
              ds =  ls1 - ys
              #par(mfrow = c(1,2))
              #plot(xs ,ys,type = "l" ,col = 1)
              #abline(v = c(x1,x2) ,lwd = 2 ,lty =2,col =3)
              #points(xs ,ls1 ,type = "l" ,col = 2)
              kneev = xs[which(max(ds)==ds)]
              
              if(pre != 0){
                
                kneev = kneev + ( kneev - x1 ) * pre
                
                # yc = ys[which(max(ds)==ds)] * ( 1-pre )
                # ycm = abs(ys - yc)
                # wii = which( min(ycm) == ycm )
                # 
                # if(length(wii) > 1){
                #   
                #   wii = wii[1]
                #   
                # }
                # 
                # kneev = xs[wii]
              }
              
              #abline(v = kneev)
              if(FALSE){
                
                plot(d,type = "l" ,col = 1)
                abline(v = kneev ,col = 3 , lwd = 2  )
                
              }
              
              denugString2 = paste( round(c(x1, y1, x2, y2 ),2 ), collapse = ";"  )
              debugf( "KneeNum", denugString2 , DebugFilePath, DebugLevel , 100 )
              
              return( kneev )
            }
            
            #fined knee location
            outThreshold = findKnee( reo , pre )
            print( paste0("Knee Result  = ",outThreshold) )
            debugf( "Knee outThreshold ", outThreshold , DebugFilePath, DebugLevel , 100 )
            
             } else {  
              
              print( " USE Max Half Width Method  " )
              
              #Use Half Max Width method loda function
              find2width <- function(d, maxXlocation , maxValue  , bSide = TRUE , alpha = 0.5 ,fc  = 2 ,buseside = TRUE )
              { 
                
                output = NA
                
                d = data.frame(x = d$x , y = d$y )
                
                if( buseside ){
                  
                  bs = d$x < maxXlocation
                  
                } else {
                  
                  bs = d$x > maxXlocation
                  
                }  
                
                w = which( ( d$y < alpha  * maxValue   ) & bs  )
                
                if( length( w ) > 0 ){
                  
                  xv = ifelse( buseside , d$x[ max( w ) ], d$x[ min( w ) ] )
                    
                } else {
                    
                  xv =  ifelse( buseside , d$x[1], d$x[ length( d$x ) ] )                        
                    
                }
                
                width  = abs( xv - maxXlocation )    
                
                output = maxXlocation + ifelse( bSide , 1, -1 ) * fc * width 
                  
                return( output  )
                
               }
              
              #check maximum value location is in the positive location
              
              if( !is.null( positive_boundary ) ){
                
                bMaxLocation =  reo$max_x < positive_boundary
                print( paste0( " In find2width: max = ", reo$max_x ," -> bMaxLocation = ",  bMaxLocation ) ) 
      
              } else {
                
                
                print( "In find2width: positive_boundary is NULL use left ( bMaxLocation = FALSE ) right side boudary !!!!!" ) 
                
                bMaxLocation = FALSE
                
              }
              
              denugString2 = paste( round(c( maxXlocation, reo$max_y ),2 ), collapse = ";"  )
              debugf( "find2width function:", denugString2, DebugFilePath, DebugLevel , 100 )
              
              # If  bMaxLocation is positive the max is the FALSE population. the boundary is in the left side
              outThreshold = find2width( reo$d, maxXlocation = maxXlocation , maxValue = reo$max_y,bSide  = bMaxLocation ,buseside = bMaxLocation ,fc = fc )
              debugf( "find2width outThreshold", outThreshold , DebugFilePath, DebugLevel , 100 )
              
              bTypeString = ifelse(bMaxLocation , "left" , "right")
              print( paste0( "In find2width: use ", bTypeString ," side boudary  = " , outThreshold ) ) 
                

             }  
            
          } else {
            
            print( " No max values !!!!")
            outThreshold = defaultThreshold
            print("In find2width: Use default threshold !!!! ")
            debugf( "defaultThreshold:", outThreshold , DebugFilePath, DebugLevel , 100 )
            
          }
          
        } else {
          
          
          td = abs(  reo$min_x - defaultThreshold  )
          
          w = which(td == min(td))
        
          outThreshold = reo$min_x[w]
          
          numofmins = length( reo$min_x )
          
          print(paste0("Find from ", numofmins ," miniimums the closest to default threshold = ", outThreshold ))
          
          debugf("Min boundary selected value",paste( round(outThreshold,2),collapse = ";"),DebugFilePath,DebugLevel ,100)
          
        }
        
        return( outThreshold )
      }
      
      if( TRUE ) 
      {
        
        qc_function <- function( ArrIn , cvar , minfilter , maxfilter = NULL )
        { 
          QCVer = 1.12
          QCdata  = 2020518
          
          assign( "bGlobalQC" , 1,envir = .GlobalEnv )
          
          generalData = createGenralData( swversion , swversiondate , scriptversion, basename( f ) , scriptdate  )   
          
          if( is.null( maxfilter ) ){
            
            maxfilter = minfilter
            
          }
          
          #Default plot----------------------------
          
          # ---------------------------------------
          
          #Functions ------------------------------
          #handle FATAL Errors 
          QCErrorFunction <-function( ErrorTable ,generalData ,filepath ){
            
            FirstLine  = data.frame(col1 = "Error", col2 = "" )
            ErrorTable = data.frame(col1 = ErrorTable[1], col2 = ErrorTable[2] )
            
            sink( filepath )
            
            write.table( FirstLine ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            cat("\n")
            write.table( ErrorTable ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            cat("\n")
            write.table(generalData,row.names = F,sep  = "\t",quote=FALSE,col.names = T)
            
            sink()      
            
          }
          
          ErrorPlots <- function( ArrIn ,cnp ,WorkingDir, inputFileName ){
            
            #remove unused devs
            while(!is.null(dev.list())){
              dev.off()
            }
            
            #create col names
            cng = c(cnp , "FSC_area" )
            g = ArrIn[,cng ]   
            
            #flatten array
            r  = data.frame( preparePlot(g,cng,"FSC_area", "Type","value" ),stringsAsFactors = F )
            
            #conver to numeric
            r[,2:3] <- data.frame( sapply(r[,2:3],as.numeric) )
            
            
            p1 = ggplot( data  = r, aes(x = FSC_area, y = value ) )  + 
              geom_point(alpha = 1/10, size = 0.1) + 
              geom_smooth( method = "lm", fill = NA, size = 0.1 , alpha = 0.5 , linetype  = 2 ) +  
              facet_grid(. ~ Type ) + # ,scales='free_x', space='free_x' ) + 
              theme(panel.spacing = unit(1, "lines")) +
              scale_x_continuous(trans='log10') +
              scale_y_continuous(trans='log10', limits = c(10, 1e5) ) + theme_bw() + ggtitle("URCP beads")
            #scale_colour_manual( values = cols ) + 
            
            
            p2 = ggplot( data  = r, aes(x= FSC_area, y=value) ) +  
              #geom_point() + 
              scale_x_continuous(trans='log10') + 
              scale_y_continuous(trans='log10',limits = c(10, 1e5)) +
              geom_bin2d(binwidth = c(0.01,0.01)) + 
              facet_grid(. ~ Type ) + #, scales='free_x', space='free_x' ) + 
              theme(panel.spacing = unit(1, "lines")) + 
              #scale_fill_gradient(low = "#FFFFBB", high = "#FC3E07")
              scale_fill_gradient(low = heat.colors(2)[1], high = heat.colors(2)[2] ) + theme_bw()
            
            #grid.arrange( p1 , p2 , nrow = 2 )
            
            g1 <- arrangeGrob(p1, p2, nrow=2)
            
            #"URCP_beads.png"
            f_name = paste0( inputFileName,".png" ) 
            
            #ggsave(file= file.path( dirPath , gsub( "Events.csv" , "QCplots1.png",dirf ) ) , g )
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename3 = gsub( "Events.csv" , "QCplots1.png" , dirf )
              pngfilename3 = gsub( "Events.csv" , "QCplots1.png" , pngfilename3 )
              
            } else {
              
              pngfilename3 = gsub( ".csv" , "QCplots1.png" , dirf )
              
            }
            
            
            ggsave(file= file.path( WorkingDir , pngfilename3 ) , g1 )
            
          }
          
          cutMinus <- function(x) { 
            y = ifelse( x > 1,x,1 )  
            return(y)
          } 
          
          nonMinus <- function( x ){ all( x[2:length(x)] >=  0 ) }
          
          #----------------------------------------
          
          ErrorTable = NULL
          
          
          #No 7 classes
          
          #use for QC
          #calculate Rsqr
          # ch1  = c( 3531,  11373,  34643,  107265, 324936)
          # 
          # ch2  = c( 2785,   9525,  28421,  90313,  275589)
          # 
          # ch3  = c( 1158,   4161,  12528,  41140,  130347)
          # 
          # ch5  = c( 6501,  20302,  59517, 183870,  550645)
          # 
          # ch8  = c( 4490,  10967,  30210,  87027,  283621)
          
          
          
          #g5values = c( 6748 ,9148 ,6077 , 5283 , 2846 ,1812 , 1079 , 1395 , 2712 , 1002 , 820 )
          G7valuesHigh20  = 1.2 * g7values
          G7valuesLow20  =  0.8 * g7values
          G7valuesHigh10  = 1.1 * g7values
          G7valuesLow10  =  0.9 * g7values
          
          
          xAxis     = data.frame(ch1,ch2,ch3,ch5,ch8)
          xAxisName = c("ch1","ch2","ch3","ch5","ch8")
          acceptedName  = paste0(xAxisName,"_pass.fail")
          
          chNum = as.character(c(1,2,3,5,8))
          
          we = NULL
          for(xAi in paste0( xAxisName , "_" ) ){
            
            we = c( we,which( grepl(xAi,ResultsCycle) ) ) 
            
          }
          
          we = unique(we)
          cn = ResultsCycle[we]
          cnp = cn
          
          use_ch = NULL
          i = 0 
          for(ch in chNum ){
            
            i = i + 1
            w = which(grepl(ch,ResultsCycle))
            
            if(length(w) > 0 ){
              
              use_ch  = rbind( use_ch, c( xAxisName[i], paste0( ResultsCycle[w[1]],".median" ) ) )
              
            } else {
              
              use_ch  = rbind( use_ch, c( xAxisName[i], "Empty" ) )
              
            }
          }
          
          
          nrow_ArrIn = nrow( ArrIn )
          
          if( exists( "min_num_of_events"  ) ) {
            
            if( nrow_ArrIn <  min_num_of_events ) {
              
              ErrorTable1  = c( "Error2"  , paste0( "Number of events : Number of events ", nrow_ArrIn ," < " , min_num_of_events  ) )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
              
              #plot data to debug
              ErrorPlots( ArrIn ,cnp ,WorkingDir, "Error_URCP_beads" )
              
              return(1)
              
            }
          } else {
            
            print( "No min_num_of_events defined !")
            
          }  
          
          GroupData = ArrIn[ ArrIn[ ,"FSC" ] , ]
          
          nrow_GroupData = nrow( GroupData )
          
          if( exists( "min_num_of_postfiter_events"  ) ) {
            
            if( nrow_GroupData <  min_num_of_postfiter_events ) {
              
              ErrorTable1  = c( "Error3"  , paste0( "Number of events post filter : Number of events after filter ", nrow_GroupData ," < " , min_num_of_postfiter_events  ) )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
              
              #plot data to debug
              ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" )
              
              return(1)
              
            }
          } else {
            
            print( "No min_num_of_postfiter_events defined !")
            
          }
          
          bGroupData =  apply( cbind( dumy = 1,GroupData[ , filter_minus_ch ] ), 1 , nonMinus  ) 
          
          GroupData  <- GroupData[ bGroupData , ] 
          
          #No addition cluster or empty addition cluster
          if( FALSE){ #NOT WORKING !!!!!
            
            # check if there is addition cluster
            colnamesGroupData = colnames( GroupData )
            additionClusterNames =  colnamesGroupData[ grepl("addition_cluster", colnamesGroupData )]
            
            
            if( length( additionClusterNames ) > 0 )
            {
              
              bApplyCluster =  apply( data.frame( GroupData[,additionClusterNames] ) , 2 , any )
              bApplyElements = apply( data.frame( GroupData[,additionClusterNames] ) , 1 , any )
              numberofAddtionClusters = sum(bApplyCluster)
              
              #ag = 1:dim(GroupData)[1]
              ag = 1:nrow(GroupData)
              
              wa = ag[ bApplyElements ]
              wkm = ag[ !bApplyElements ]
              #kmcluster = rep(0,dim(GroupData)[1])
              kmcluster = rep(0, nrow( GroupData ) )
              
              
              #no addition cluster
            } else {
              
              numberofAddtionClusters = 0
              
            }
            
            buse7 = FALSE
            
            #if high number of ch9 above boudary use 7 cluster 
            if( max_autoclastring_boundary != 0 ){
              
              buse7 =  sum( GroupData[, varCycle[2] ] > autoclastring_boundary ) > max_autoclastring_boundary
              
            } 
            
            if(  buse7 ){
              
              clusternum = 7
              
            }
            
            
            if( numberofAddtionClusters > 0 )
            {
              
              #logGroupData = log(GroupData[ , varCycle ])
              km = kmeans( scale( GroupData[ !bApplyElements , varCycle ],center = TRUE ),clusternum - numberofAddtionClusters , iter.max = 150, nstart = 150)
              km$cluster = km$cluster + numberofAddtionClusters
              kmcluster[wkm] = km$cluster
              
            } else {
              
              df <-  GroupData[ , varCycle ]
              
              #df[ , varCycle[ 2 ] ] <- df[ , varCycle[ 2 ] ]/2
              #km = kmeans( GroupData[ , varCycle ],center = TRUE ,clusternum , iter.max = 150, nstart = 150 )
              #mc = Mclust( scale( GroupData[ , varCycle ] )  ,G = clusternum )
              #mc = Mclust( df , G = clusternum )
              
              tryCatchR  <- tryCatch( {
                
                #mc =  qc_clusterconture(df)
                #kmcluster = mc$classification
                kmcluster = findClusters( df , max_m0_factor = 26  , NumOfCluster  = 7 )
                0
                
              }, error = function(e) { print (  paste0( "findClusters(df) Error", e )  ) ; 1 }, finally = 0 ) #eee remove
              
              
              if( tryCatchR == 1 ){
                
                #vvv remove
                ErrorTable1  = c( "Error5"  , "Unable to perform conture clustering " )
                efilepath = file.path( WorkingDir , 'Summary Results.txt' )
                QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
                
                #plot data to debug
                ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" )
                
                # sink( GlobalQcPath ,append = T )
                # 
                #   ErrorTable1 = data.frame(string = ErrorTable1 )
                #   #insert to Qclog file
                #   ErrorTable1 = flatten.dataframe( ErrorTable , TRUE , TRUE )
                #   write.table( ErrorTable1 ,row.names = F,sep  = ",",quote=FALSE,col.names = F)
                # 
                # sink()
                
                bGlobalAssignErrorString <<- " , Clustering Problem"
                
                return(1)
                
              }
              
              
              #km = kmeans( scale( GroupData[ , varCycle ],center = TRUE ),clusternum , iter.max = 150, nstart = 150) 
              #km = kmeans( scale( df,center = TRUE ),clusternum , iter.max = 150, nstart = 150) #Change 300719
              #kmcluster = mc$classification
              #kmcluster = km$cluster
              
            }
          }
          
          
          
          #Build 2D data.frame for conture cluster 
          df <-  GroupData[ , varCycle ]
          #confure clustering
          #mc =  qc_clusterconture(df)
          #kmcluster = mc$classification
          
          
          kmcluster = findClusters( df , max_m0_factor = 26  , NumOfCluster  = 7 )
          
          if( length( varCycle ) == 2 ){
            
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename2 = gsub( "Events.csv" , "Beads.png",dirf ) 
              pngfilename2 = gsub( "events.csv" , "Beads.png",pngfilename2 ) 
              
            } else {
              
              pngfilename2 = gsub( ".csv" , "Beads.png",dirf ) 
              
            }
            
            #browser() #280420
            
            if( nrow( df ) == length( kmcluster ) ) {
              
              png( file.path( WorkingDir , pngfilename2 ), width = 1920, height = 1080 ) 
              
              cl_names = names( table( kmcluster ) )
              
              legendCols = rainbow(10)[ c(1:8) ]
              #legendCols = rainbow(100)[ c(1,10,20,30,50,60,70,80)]
              cols = legendCols[ factor(kmcluster) ]
              cexs = c( 1 ,0.01 )[ factor( kmcluster == 0 ) ]
              
              plot( df,
                    pch = c(19 ,1)[ factor( kmcluster == 0 ) ] ,
                    col = cols , 
                    main = "Clustering", #paste0( "Sizes ", paste0(table(re),collapse = ",") ) , 
                    cex =  cexs  )
              
              legend("topleft", paste0( cl_names , " - ", table(kmcluster) ) , col = legendCols , pch = 19 , pt.cex = c( 0.5 , rep( 1 , 7 ) ) )
              
              dev.off()
              
            }
            
          }
          
          
          #remove zero cluster point that are not part of any cluster
          GroupData0 =  GroupData[ kmcluster == 0, ]
          GroupData  =  GroupData[ kmcluster != 0, ]
          kmcluster  =  kmcluster[ kmcluster != 0  ]
          
          le = length( ResultsCycle )
          
          sp = split(GroupData[, ResultsCycle ] , kmcluster )
          
          
          
          #No 7 classes
          if( length( sp ) != 7   ){
            
            ErrorTable1  = c( "Error0"  , paste0( "Number of Classes: Number of Classes ", length( sp ) ," != 7 " ) )
            efilepath = file.path( WorkingDir , 'Summary Results.txt' )
            QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
            
            # sink( GlobalQcPath ,append = T )
            # 
            #   ErrorTable1 = data.frame(string = ErrorTable1 )
            #   #insert to Qclog file
            #   ErrorTable1 = flatten.dataframe( ErrorTable , TRUE , TRUE )
            #   write.table( ErrorTable1 ,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            #   
            # sink()
            
            bGlobalAssignErrorString <<-  "Number of class != 7"
            
            
            ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" ) #yyy
            
            return(1)
            
          }
          
          
          #Count = sapply( sp , function(x) { dim(x)[1] } )
          Count = sapply( sp , function(x) { nrow(x) } )
          numberofcounts =  sum(Count)
          
          clusterMean  =   data.frame(t( round( sapply( sp , colMeans ) , 2 ) ) )
          colnames( clusterMean ) <- paste0(ResultsCycle,".mean" )
          clusterMedian  = t(sapply( sp , function(x)  round(sapply(x,median) , 2 ) ) )
          colnames( clusterMedian ) <- paste0(ResultsCycle,".median" )
          clusterSTD  =    t(sapply( sp , function(x)  round( sapply(x,sd) , 2 ) ) )
          colnames( clusterSTD ) <- paste0(ResultsCycle,".STD" )
          clusterRSD  =    t(sapply( sp , function(x)  round( sapply(x,rsd) , 2 ) ) )
          
          clusterCh1FSCCorrelations = round(sapply( sp , function(x){ cor( x[,ch1corrname ],x[, FSCcorrname ] ) } ) , 2 )
          
          colnames( clusterRSD ) <- paste0(ResultsCycle,".RSTD" )
          
          dfout = cbind(Count,
                        clusterMedian ,
                        clusterRSD   ,
                        clusterMean  , 
                        clusterSTD ) 
          
          
          
          clusterCV  =   data.frame(round(100* dfout[,paste0(ResultsCycle,".STD" )]/dfout[ , paste0(ResultsCycle,".mean" )],2))
          clusterRCV  =  data.frame(round(100* dfout[,paste0(ResultsCycle,".RSTD" )]/dfout[,paste0(ResultsCycle,".median" )],2))
          
          colnames(clusterCV) <-  gsub(".STD",".CV",colnames(clusterCV))
          colnames(clusterRCV) <-  gsub(".RSTD",".RCV",colnames(clusterRCV))
          
          dfout = cbind(Count,clusterMedian,clusterRCV,clusterMean,clusterCV,clusterSTD,clusterRSD)
          
          
          # we = NULL
          # for(xAi in paste0( xAxisName , "_" ) ){
          #   
          #   we = c( we,which( grepl(xAi,ResultsCycle) ) ) 
          #   
          # }
          # 
          # we = unique(we)
          # cn = ResultsCycle[we]
          # cnp = cn
          
          cn = paste0( cn , ".median" ) 
          cnh = paste0(cn ,".log")
          
          
          
          whi = which( sapply(dfout[,cn], max ) < 250000 )
          
          if(length(whi) > 0 ){
            
            min_whi = min( whi )
            cn = cn[ min_whi ] 
            cnh = cnh[ min_whi] 
            
          } else {
            
            print("ERROR: all channels above 65000 !!!!! " )
            
          }
          
          
          or7 = order(dfout[,"ch9_peak.median"],decreasing = T )[1]
          
          #fined high ch9 group
          G7 = dfout[or7 , ]
          dfout = dfout[-or7 , ]
          
          #oreder group by channel 1
          OrderGroups = order(dfout[,cn])
          dfout = dfout[ OrderGroups ,]
          
          # add group 7
          dfout = rbind( dfout , G7 ) 
          
          print("DIM")
          print(dim(dfout))
          #rownames(dfout) = NULL
          #dfout = cbind(Group = paste0("G",1:dim(dfout)[1]), dfout ) 
          dfout = cbind(Group = paste0( "G" , 1:nrow( dfout ) ), dfout ) 
          
          # ch2.rstd.g4.max  = 22
          # ch4.rstd.g2.max = 13
          # fsc.rstd.g4.max = 10
          
          colnames_dfout  = colnames( dfout )
          
          
          traditionParVarName  =  c( "Ch2_RCV_G4","Ch4_RCV_G2","FSC_RCV_G4" )
          
          ch2.RCV.g4.string    = colnames_dfout[ grepl("ch2" ,colnames_dfout ) & grepl(".RCV"    , colnames_dfout ) ]
          ch2.median.g4.string = colnames_dfout[ grepl("ch2" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          #ch2.RCV.g4.string    = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          #ch2.median.g4.string = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          ch4.RCV.g2.string    = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          ch4.median.g2.string = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          fsc.RCV.g4.string   = colnames_dfout[ grepl("FSC" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          fsc.median.g4.string = colnames_dfout[ grepl("FSC" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          ch2.RCV.g4 =  dfout[ dfout$Group == "G4" , ch2.RCV.g4.string   ] #/ dfout[ dfout$Group == "G4" , ch2.median.g4.string ]
          ch4.RCV.g2 =  dfout[ dfout$Group == "G2" , ch4.RCV.g2.string   ] #/ dfout[ dfout$Group == "G2" , ch4.median.g2.string ]
          fsc.RCV.g4 =  dfout[ dfout$Group == "G4" , fsc.RCV.g4.string   ] #/ dfout[ dfout$Group == "G4" , fsc.median.g4.string ]
          
          ch2.RCV.g4.passfail  =  ifelse( ch2.RCV.g4  < ch2.rcv.g4.max , "PASS", "FAIL" )
          ch4.RCV.g2.passfail  =  ifelse( ch4.RCV.g2  < ch4.rcv.g2.max , "PASS", "FAIL" )
          
          fsc.RCV.g4.passfail  =  ifelse( fsc.RCV.g4  < fsc.rcv.g4.min , "PASS", "SUS" )
          
          if( fsc.RCV.g4.passfail == "SUS" ){
            
            fsc.RCV.g4.passfail  =  ifelse( fsc.RCV.g4  < fsc.rcv.g4.max , "WARNING", "FAIL" )
            
          }
          #fsc.Rstd.g4.passfail  =  ifelse( fsc.Rstd.g4  < fsc.rstd.g4.max , "PASS", "FAIL" )
          
          traditionParVarValue  =  c( ch2.RCV.g4,ch4.RCV.g2,fsc.RCV.g4)
          traditionParpassfail  =  c( ch2.RCV.g4.passfail,ch4.RCV.g2.passfail,fsc.RCV.g4.passfail)
          
          traditionParDataframe = data.frame( Names = traditionParVarName,
                                              Value = traditionParVarValue,
                                              Accepted = traditionParpassfail )
          
          
          
          if( remove_from_count == 0 ){
            
            CountRatioValue =  round( 100 * ( mean( dfout$Count ) - min( dfout$Count ) ) / mean( dfout$Count ) , 0 )
            
          } else {
            
            groupOut  = paste0( "G" , remove_from_count )
            
            wout = which( dfout$Group ==  groupOut ) 
            
            if( length( wout ) > 0 ){
              
              CountRatioValue =  round( 100 * ( mean(dfout$Count[ -wout ]) - min(dfout$Count[ -wout ]) ) / mean(dfout$Count[ -wout ] ) , 0 )
              
            } else {
              
              CountRatioValue =  round( 100 * ( mean( dfout$Count ) - min( dfout$Count ) ) / mean( dfout$Count ) , 0 )
              
            }
            
          }
          
          
          CountRatio  = c("Counts: (Average-Minimum)/Average % ", CountRatioValue )
          
          
          #prepare table with G3 ratio results
          G3d = unlist( dfout[ dfout$Group == "G3", 4:14 ] ) 
          ratioG3d = G3d / G3d[1]
          ratioG3d = data.frame( "Name" = names(ratioG3d) , "RatioValueVs.Ch1"  =  round(ratioG3d,2) ) 
          
          use_ch = use_ch[use_ch[,2] != "Empty",]
          
          use_ch_replace_mean = gsub("median","mean", use_ch ) 
          
          rss = c("Channel","Rsq","LOD","Accepted")
          
          #for( i in 1:dim(use_ch)[1] ) 
          for( i in 1:nrow( use_ch ) ) 
          {
            
            #upAcceptedLodValue  = eval( parse( text = acceptedName[i] ) ) #remove
            x = log( xAxis[,use_ch[i,1]] )
            #y = log( dfout[ 2:( length(x) + 1 ), use_ch[ i , 2 ] ] )
            y = log( dfout[ c(2 , 3 , 4 , 5 , 6 ) , use_ch[ i , 2 ] ] )
            model = lm( y ~ x )
            rs = round(summary(model)$r.squared,3)
            
            if ( dfout[1,use_ch[i,2]] <= 1 ){
              
              yp = 1
              
            } else {
              
              yp = log( dfout[1,use_ch[i,2]] )
              
            }
            
            LOD = round( exp( ( yp - model$coefficients[1] ) / model$coefficients[2]  ) , 2 ) 
            
            lodname = paste0(use_ch[i,1],"lod")
            assign( lodname,LOD,envir = .GlobalEnv )
            
            calVar( ArrIn  , cvar ) 
            
            
            if( exists( acceptedName[i] ) ){
              
              upAcceptedLodValue = eval( parse( text = acceptedName[i] ) ) 
              acceptLOD = ifelse(upAcceptedLodValue,"PASS","FAIL")
              
            } else {
              
              acceptLOD = "PASS"
              
            }
            
            
            rss = rbind(rss, c(use_ch[i,1],rs, LOD , acceptLOD ) )
            
          }     
          
          
          
          Validity_count_min_number = ifelse( numberofcounts > count_min_number, "PASS","FAIL" ) 
          colnameforCorr  = c("NAME","VALUE","Accepted") # Add 0406 
          
          Validity_count_maxmin_ratio_uplimit =  ifelse( CountRatioValue < count_maxmin_ratio_uplimit, "PASS","FAIL" ) 
          #CountRatioline = c(CountRatio , Validity_count_maxmin_ratio_uplimit, rep("",columnsForCountRatio ) )#change0406
          CountRatioline = c(CountRatio , Validity_count_maxmin_ratio_uplimit)# Add 0406
          
          
          QcCorrelationTable  = CountRatioline
          CountValueLine = c("Total Beads Count", numberofcounts ,Validity_count_min_number ) #Add0406 
          QcCorrelationTable  = rbind( QcCorrelationTable  , CountValueLine )
          
          i = 0 
          #Insert Ch1 vs.FSC correaltion to table 
          clusterCh1FSCCorrelations = clusterCh1FSCCorrelations[ OrderGroups ]
          
          for ( Ch1FSCCorrelation in clusterCh1FSCCorrelations )  
          {
            i = i + 1
            Validity_ch1_fsc_correlation_max =  ifelse( Ch1FSCCorrelation < ch1_fsc_correlation_max, "PASS","FAIL" ) 
            Ch1FSCCorrelationValueLine = c(paste0( "G" , i , "_Ch1FSC_Correlation")  , Ch1FSCCorrelation , Validity_ch1_fsc_correlation_max )#Add0406
            QcCorrelationTable  = rbind(QcCorrelationTable  , Ch1FSCCorrelationValueLine )
            
          }
          
          QcCorrelationTable  = data.frame( QcCorrelationTable  )
          colnames( QcCorrelationTable  ) = c("NAME","VALUE","Accepted")
          
          BeadsCountLine = QcCorrelationTable[2,1:2]
          
          #prepare G5 table
          # G5results = dfout[dfout$Group == "G5",4:14]
          # G5re20 = ifelse( ( G5results > G5valuesLow20 ) & ( G5results < G5valuesHigh20 ) , "PASS" , "FAIL" ) 
          # G5re10 = ifelse( ( G5results > G5valuesLow10 ) & ( G5results < G5valuesHigh10 ) , "PASS" , "FAIL" ) 
          # G5Names = paste0( "G5ch",1:11 )
          # QcCorrelationG5 = data.frame( Names       = G5Names , 
          #                               Value       = as.vector(unlist(G5results)) ,
          #                               Accepted10  = as.vector( G5re10 ), 
          #                               Accepted20  = as.vector( G5re20 ) )
          
          
          ADC.Device.path = "C:/Accellix3/ADC Device.ini"
          
          if( file.exists( ADC.Device.path  ) ){
            
            ADC.Device <- read.delim( ADC.Device.path , header=FALSE ,stringsAsFactors = F ,sep = "\t")
            
            VariableNames = c( "DVS temperature" , "Temperature Coefficient" )
            
            
            w1 = which(ADC.Device[,1] %in% "DVS temperature" )
            w2 = which(ADC.Device[,1] %in% "Temperature Coefficient" )
            
            if( length( w1 ) == 1 ){
              
              basic_temp = as.numeric( ADC.Device[w1,2] )
              
            } else{
              
              print( "DVS temperature is missing !!!" )
              ErrorTable1  = c( "Error10"  , "DVS temperature is missing" )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
              return(1)
              
            }
            
            if( length( w2 ) == 1 ){
              
              tempCoeff = as.numeric( ADC.Device[w2,2] )
              
            } else {
              
              
              print( "Temperature Coefficient is missing !!!" )
              ErrorTable1  = c( "Error11"  , "Temperature Coefficient is missing" )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
              return(1)
              
            }
            
          } else { 
            
            print( "Unable to open ADC Device.ini" )
            ErrorTable1  = c( "Error12"  , "Unable to open ADC Device.ini" )
            efilepath = file.path( WorkingDir , 'Summary Results.txt' )
            QCErrorFunction( ErrorTable1 ,generalData ,efilepath )
            return(1)
            
            
          } 
          
          # if ( !exists( "basic_temp"  ) ){
          #   
          #   basic_temp = 33
          #   
          # }
          # 
          # 
          # if ( !exists( "tempCoeff"  ) ){
          #   
          #   tempCoeff = 4
          #   
          # }
          
          SiPMpath = file.path( dirPath , "SiPM Temp.txt" )
          
          #Default value
          mean_daSiPM = basic_temp
          
          if( file.exists( SiPMpath ) ){
            
            daSiPM = read.csv( SiPMpath , "\t" ,header= F)
            
            if( !is.null( daSiPM ) ) {
              
              mean_daSiPM  = ifelse( nrow( daSiPM ) > 0 , mean( daSiPM$V3 ) , 0   )
              
            } 
          }
          
          G7results = dfout[dfout$Group == "G7",4:14]
          G7re20 = ifelse( ( G7results > G7valuesLow20 ) & ( G7results < G7valuesHigh20 ) , "PASS" , "FAIL" ) 
          G7re10 = ifelse( ( G7results > G7valuesLow10 ) & ( G7results < G7valuesHigh10 ) , "PASS" , "FAIL" ) 
          G7Names = paste0( "G7ch",1:11 )
          actualValue = as.vector(unlist(G7results))
          Dt = ( mean_daSiPM - basic_temp )
          
          #Expected correction 
          correctedExpected =  g7values + tempCoeff * Dt
          QcCorrelationG7 = data.frame( Names       = G7Names  ,
                                        Expected    = g7values ,
                                        Value       = actualValue ,
                                        correctedExpected  = correctedExpected ,
                                        Diff        = round( 100 * ( actualValue - g7values ) / g7values , 2 ),
                                        Temperature = round( mean_daSiPM , 2 ),
                                        Accepted10  = as.vector( G7re10 ), 
                                        Accepted20  = as.vector( G7re20 ) )
          
          
          #Change colnames
          colnames( QcCorrelationG7 )[ c( 5,6,8 ) ] <- c( "Diff%", "Accepted_DVS_%10" , "Accepted_DVS_%20" )
          
          G4results = dfout[dfout$Group == "G4",4:14]
          G7results = dfout[dfout$Group == "G7",4:14]
          
          ratio_URQCP_level4VsJGB = G4results / G7results
          
          ratio_URQCP_level4VsJGB  = round( t(unname(ratio_URQCP_level4VsJGB[1,])) ,3)
          
          Channels = paste0( "Ch" , 1:11 )
          
          #TitleTable = c( "URQCP_level4VsJGB" ,"" )
          
          ratio_URQCP_level4VsJGB_Table = data.frame( Channel = Channels , URQCPvs.JGBratio  = ratio_URQCP_level4VsJGB , row.names = NULL  )
          #colnames( ratio_URQCP_level4VsJGB_Table) <-  c("Channel" , "URQCPvs.JGBratio")
          colnames( ratio_URQCP_level4VsJGB_Table) <-  c("Channel" , "G5vsG7_ratio")
          
          #write Results
          # sink( file.path( dirPath , gsub("Events","QCResults", dirf ) ) ) 
          # 
          #   write.table(dfout,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(rss,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #   cat("\n\n\n")
          #   write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(QcCorrelationG5,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   
          # 
          # sink()
          
          
          sink( file.path( dirPath , 'Summary Results.txt' ) )
          
          rssname = paste0( rss[,1],"_LOD" )
          
          #bShowsfqcnames_rssname  = sfqcnames %in% rssname  
          #rss_bShowsfqcnames  = rss[ bShowsfqcnames_rssname , ]
          
          rss[,1] <- rssname
          rssor  = rss[-1,] 
          rssor = data.frame(rssor)
          #rss = rss[-1,c(1,4) ]
          
          rss0 =  rss[-1,c(1,4) ]
          brss0 = rss0[,2] != "PASS"
          
          if( any(brss0) ){
            
            write.table( rss0,row.names = F,sep  = "\t",quote=FALSE,col.names = F) 
            
          }
          
          bQcCorrelationTable = QcCorrelationTable[,3] != "PASS"
          
          # bShowsfqcnames_QcCorrelationTable  = sfqcnames %in% QcCorrelationTable$NAME
          # QcCorrelationTable_bShowsfqcnames  = QcCorrelationTable[ bShowsfqcnames_QcCorrelationTable ,]
          
          if( any( bQcCorrelationTable ) ){
            
            write.table(QcCorrelationTable[  bQcCorrelationTable ,c(1,3) ] ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          
          bQcCorrelationG7 = QcCorrelationG7[,8] != "PASS"
          
          #bShowsfqcnames_QcCorrelationG7 =  sfqcnames %in% QcCorrelationG7$Names
          #QcCorrelationG7_bShowsfqcnames  = QcCorrelationG7[ bShowsfqcnames_QcCorrelationG7 ,]
          
          
          if( any( bQcCorrelationG7 ) ){
            
            write.table(QcCorrelationG7[ bQcCorrelationG7 ,c(1,8) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          btraditionParDataframe = traditionParDataframe[,3] != "PASS"
          #bShowsfqcnames_traditionParDataframe =  sfqcnames %in% traditionParDataframe$Names
          #traditionParDataframe_bShowsfqcnames  = traditionParDataframe[ bShowsfqcnames_traditionParDataframe ,]
          
          if( any( btraditionParDataframe ) ){
            
            write.table(traditionParDataframe[ btraditionParDataframe ,c(1,3) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          
          if( !any( brss0 , bQcCorrelationTable , bQcCorrelationG7, btraditionParDataframe ) ){
            
            allpass = data.frame(str1 = "All PARAMETERS",str2 = "PASS" )
            write.table( allpass ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
            #cat("\n")
            #write.table(generalData,row.names = F,sep  = ",",quote = FALSE ,col.names = F)
            
          }
          
          BeadsCountLine = data.frame(str1 = BeadsCountLine[1],str2 = BeadsCountLine[2] )
          write.table( BeadsCountLine ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
          
          cat("\n\n\n")
          write.table(rssor,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #cat("\n\n\n")
          write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          
          sink()
          
          
          sink( file.path( WorkingDir , gsub("Events","QCResults", dirf ) ) ) 
          
          write.table(dfout,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(rss,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          cat("\n\n\n")
          write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
          cat("\n\n\n")
          write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          
          
          sink()
          
          
          sink( file.path( WorkingDir , 'Summary Results.txt' ) )
          
          #rssname = paste0( rss[,1],"_LOD" )
          #rss[,1] <- rssname
          
          rss = rss[-1,c(1,4) ]
          
          brss = rss[,2] != "PASS"
          
          if( any(brss) ){
            
            write.table(rss[brss,],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          bQcCorrelationTable = QcCorrelationTable[,3] != "PASS"
          
          if( any( bQcCorrelationTable ) ){
            
            write.table(QcCorrelationTable[  bQcCorrelationTable ,c(1,3) ] ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          
          bQcCorrelationG7 = QcCorrelationG7[,8] != "PASS"
          
          if( any( bQcCorrelationG7 ) ){
            
            write.table(QcCorrelationG7[ bQcCorrelationG7 ,c(1,8) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          
          btraditionParDataframe = traditionParDataframe[,3] != "PASS"
          
          if( any( btraditionParDataframe ) ){
            
            write.table(traditionParDataframe[ btraditionParDataframe ,c(1,3) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
            
          }
          
          
          if( !any( brss , bQcCorrelationTable , bQcCorrelationG7, btraditionParDataframe ) ){
            
            allpass = data.frame(str1 = "All PARAMETERS ",str2 = "PASS" )
            write.table( allpass ,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
            #cat("\n")
            #write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            
            
          }
          
          BeadsCountLine = data.frame(str1 = BeadsCountLine[1],str2 = BeadsCountLine[2] )
          write.table( BeadsCountLine ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
          
          cat("\n\n\n")
          write.table(rssor,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #cat("\n\n\n")
          write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #cat("\n\n\n")
          write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          
          sink()
          
          
          # sink( GlobalQcPath ,append = T )
          #   
          #   s1  = paste0( "@Start",paste0("@rss;",apply( rssor,1,paste0,collapse = ";"),collapse = "") )
          #   QcCorrelationTable = data.frame(QcCorrelationTable)
          #   s2  = paste0("@QcCorrelationTableResult;",apply( QcCorrelationTable,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(ratioG3d)
          #   s3  = paste0("@ratioG3d;",apply( ratioG3d,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(QcCorrelationG7)
          #   s4 = paste0("@QcCorrelationG7;",apply( QcCorrelationG7,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(traditionParDataframe)
          #   s5 = paste0("@traditionParDataframe;",apply( traditionParDataframe,1,paste0,collapse = ";"),collapse = "")
          #   ratio_URQCP_level4VsJGB_Table = data.frame(ratio_URQCP_level4VsJGB_Table)
          #   s6 = paste0("@ratio_URQCP_level4VsJGB_Table;",apply( ratio_URQCP_level4VsJGB_Table,1,paste0,collapse = ";"),collapse = "")
          #   generalData = data.frame(generalData)
          #   s7 = paste0("@generalData;",apply( generalData,1,paste0,collapse = ";"),collapse = "")
          #   so = paste0("@Time",Sys.time(),s1,s2,s3,s4,s5,s6,s7,"@End")
          #   so = data.frame(string = so)
          #   write.table(so,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #   
          # sink()
          
          # SiPMpath = file.path( dirPath , "SiPM Temp.txt" )
          # 
          # if( file.exists( SiPMpath ) ){
          # 
          #   li = readLines( SiPMpath , 1 )
          # 
          #   if(length(li) > 0  ){
          #     
          #     rd = strsplit( li[1] ,"\t" )
          #     
          #   } else {
          #     
          #     rd = c("0","0","0")
          # 
          #   }
          # } else {
          #   
          #   print("File SiPMpath Not Exists !!!!" )
          #   rd = c("0","0","0")
          #   
          # }
          
          rdNames = c( "Date" , "Time", "Temp" )
          
          
          #prepare line string in QC.Log 
          #data.QC.log =  data.frame( matrix( unlist( c( rd , basename(f) , as.character( dfout[dfout$Group == "G5",2:dim(dfout)[2]] ) )),1,) )
          #colnames(data.QC.log) = c( rdNames ,"FileName" ,  colnames(dfout)[2:dim(dfout)[2]] )
          
          #preparePlot()
          
          
          ylims = NULL
          
          for( cni in cnp ){
            
            
            h  = hist(log(sp[[1]][, cni  ]), 30 , plot = F ) 
            
            hcountsMax = max(h$counts)
            
            for(i in 2:length(sp) ){
              
              h = hist(log( sp[[i]][, cni   ] ),30 , plot  = F )
              
              hcountsMax = ifelse( hcountsMax  > max(h$counts), hcountsMax , max( h$counts ) )
              
            }
            
            ylims = c( ylims , hcountsMax )
            
          }
          
          h  = hist(ArrIn[,xplotname],300 , plot = F )
          
          cng = c(cnp , "FSC_area" )
          
          g = cbind( GroupData[,cng ] , kmcluster )   
          
          cng = c(cng ,"kmcluster")        
          
          r  = preparePlot(g,cng,c( "FSC_area", "kmcluster" ), "Type","value" )
          
          #Change Name
          r$cluster <-  factor( kmcluster )
          types = as.character(unique(r[,"Type"] ))
          
          #find ch8 variable name 
          ch8.string   = types[ grepl("ch8_" ,types ) ]
          rf = r[r[,"Type"] ==  ch8.string, ]
          
          spr = split(rf$value , rf$cluster )
          sprm = sapply(spr,mean)
          wm = which( max( sprm ) == sprm )
          names_spr = as.numeric(names( spr)[ wm ])
          r = r[r$kmcluster != names_spr , ]
          
          
          # if( nrow( r ) >  1e4 ){
          #   
          #   r = r[sample(nrow(r), 10000 ),]
          #   
          # }
          
          #png( file.path( dirPath , gsub( "Events.csv" , "URCP_beads.png",dirf ) ) ) 
          
          cols = rainbow( length( unique( r$cluster ) ) ) 
          p1 = ggplot( data  = r, aes(x = FSC_area, y = value, color= cluster  ) )  + 
            geom_point(alpha = 1/10, size = 0.1) + 
            geom_smooth( method = "lm", fill = NA, size = 0.1 , alpha = 0.5 , linetype  = 2 ) +  
            facet_grid(. ~ Type ) + # ,scales='free_x', space='free_x' ) + 
            theme(panel.spacing = unit(1, "lines")) +
            scale_x_continuous(trans='log10') +
            scale_y_continuous(trans='log10', limits = c(10, 1e5) ) +
            scale_colour_manual( values = cols ) + theme_bw() + ggtitle("URCP beads")
          
          
          p2 = ggplot( data  = r, aes(x= FSC_area, y=value) ) +  
            #geom_point() + 
            scale_x_continuous(trans='log10') + 
            scale_y_continuous(trans='log10',limits = c(10, 1e5)) +
            geom_bin2d(binwidth = c(0.01,0.01)) + 
            facet_grid(. ~ Type ) + #, scales='free_x', space='free_x' ) + 
            theme(panel.spacing = unit(1, "lines")) + 
            #scale_fill_gradient(low = "#FFFFBB", high = "#FC3E07")
            scale_fill_gradient(low = heat.colors(2)[1], high = heat.colors(2)[2] ) + theme_bw()
          
          #grid.arrange( p1 , p2 , nrow = 2 )
          
          g1 <- arrangeGrob(p1, p2, nrow=2 )
          
          #ggsave(file= file.path( dirPath , gsub( "Events.csv" , "QCplots1.png",dirf ) ) , g )
          
          if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
            
            pngfilename = gsub( "Events.csv" , "URCP_beads.png",dirf )
            pngfilename = gsub( "events.csv" , "URCP_beads.png",pngfilename )  
            
          } else {
            
            pngfilename = gsub( ".csv" , "URCP_beads.png",dirf )
            
          } 
          
          
          
          ggsave(file= file.path( WorkingDir , pngfilename ) , g1 )
          
          #png( file.path( dirPath , gsub( "Events.csv" , "QCplots.png",dirf ) ) )
          
          if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
            
            pngfilename1 = gsub( "Events.csv" , "QCplots.png",dirf )
            pngfilename1 = gsub( "events.csv" , "QCplots.png",pngfilename1 )
            
          } else {
            
            pngfilename1 = gsub( ".csv" , "QCplots.png",dirf )
            
          }
          
          png( file.path( WorkingDir , pngfilename1 ), width = 1920, height = 1080 ) 
          
          par(mar = c(2,5,1,1))
          par(mfrow = c(length(cnp)+1,1))
          
          plotFontSsize = 2
          
          h = hist(ArrIn[,xplotname], 100 , #230919change from 300 to 100 
                   xlab = xplotname,
                   #xlim = quantile(ArrIn[,xplotname],c(0.02,0.99)),
                   xlim = c( xminhist , xmaxhist ),
                   #ylim = c(0,max(h$count) * 1.3),
                   main = paste0( "Filter by " , xplotname ) , plot = T,
                   
                   cex.lab  = plotFontSsize ,  
                   cex.axis = plotFontSsize , 
                   cex.main = plotFontSsize , 
                   cex.sub  = plotFontSsize )
          
          abline( v = minfilter ,lwd = 2, col = 2 ,lty = 2)
          abline( v = maxfilter ,lwd = 2, col = 2 ,lty = 2)
          
          if(exists( "fcsdown" ) & exists( "fcsup" ) ){
            
            abline( v = c( fcsdown,fcsup ) ,lwd = 2, col = 3 ,lty = 2)
          }
          
          k = 0 
          for( cni in cnp ){
            
            k= k+1 
            
            h  = hist(log(sp[[1]][, cni  ]),
                      30,
                      col = cols[1],
                      xlim = c( xminhist , xmaxhist ),
                      ylim = c( yminhist , ylims[k] * 1.1 ),
                      main = "" ,
                      xlab = "Groups",
                      ylab = cni,
                      cex.lab  = plotFontSsize ,  
                      cex.axis = plotFontSsize , 
                      cex.main = plotFontSsize , 
                      cex.sub  = plotFontSsize ) 
            
            
            for(i in 2:length(sp) ){
              
              h = hist(log( sp[[i]][, cni   ] ),30, add = T , col = cols[i] , ylab = cni , xlab = "Groups" )
              
            }
            
          }
          
          dev.off()
          
          if( length( varCycle ) == 2 ){
            
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename2 = gsub( "Events.csv" , "Beads.png",dirf ) 
              pngfilename2 = gsub( "events.csv" , "Beads.png",pngfilename2 ) 
              
            } else {
              
              pngfilename2 = gsub( ".csv" , "Beads.png",dirf ) 
              
            }
            
            
            png( file.path( WorkingDir , pngfilename2 ), width = 1920, height = 1080 ) 
            
            ukmcluster  = unique( kmcluster ) 
            cols  = rainbow(  length( ukmcluster ) )
            
            plot( GroupData[ , varCycle ], 
                  col = cols[ factor( kmcluster ) ], 
                  pch = ".",
                  main = "2D clustering of beads" )
            
            points( GroupData0[ ,varCycle ], col = 1 ,pch = 1 ,cex = 0.1 )
            
            Gr = data.frame( GroupData[ ,varCycle ] , cols  =  cols[ kmcluster ],stringsAsFactors = F)
            
            sp = split( Gr , Gr$cols ) 
            
            # lapply(sp, function(x){ 
            #   
            #             selpoints = convex_hull(x[,1:2]) 
            #             points(selpoints[,1], selpoints[,2],type  = "l", col = x[1,3] )
            #   
            #           } )
            
            #browser() #260420
            
            lapply(sp, function(x){ 
              
              ell = getGussainfit( x[,1:2] )
              el = ellipse(ell$mu, ell$sigma , npoints = 50 , alpha= 0.05)
              lines(el , col = x[1,3]   )
              
            } )
            
            dev.off()
            
          }
        }
        
        
      
        cal_voltage <- function(  filepath ,Arr1 , Fcsboudary = 5000 ,max_width = 100 )
        {
          ErrorTable = NULL
          
          #min_size = 20  # checkbefor
          plotFontSsize = 2
          
          #const
          dirpath = dirname( filepath )
          
          #setMedian = c( 6748, 9148, 6077, 5283, 2846, 1812, 1079, 1395, 2712, 1002, 820 )
          setMedian = c( 7493, 10055, 6914, 5868, 3064, 1963, 1160, 1570, 3319, 1049, 916 )
          
          number_of_runs = 6 
          
          #functions-----------------
          getTime <- function( fn ){
            
            re = paste0( ( strsplit(fn,"_")[[1]] ) [1:2], sep = "",collapse = "_")
            filetime =  as.POSIXct(re,format="%Y%m%d_%H-%M-%S")[1]
            return( filetime )
            
          }
          
          getV<- function(fin){
            
            #get first line from the file
            rd = readLines(fin,1)[1]
            
            #Get last string as Voltage value
            Volt = strsplit(rd,"_")[[1]]
            Volt = as.numeric( Volt[length(Volt)] )
            
            return(Volt)
            
          }
          #--------------------------
          # bMultiFile = FALSE
          # if ( bMultiFile ){  
          #   
          #   fl = list.files(dirpath,pattern  = "Events.csv",full.names = T)
          #   bn = basename(fl)
          #   fileTimes = sapply(bn , getTime)
          #   
          #   
          # } else {
          
          oneFile = Arr1 
          
          oneFile = oneFile[complete.cases(oneFile),]
          
          startplot = ggplot(oneFile, aes( x = FSC_peak , y  = Width)  ) + geom_point(size = 0.3)
          #ggsave( file = file.path(dirpath , "FSC.png" )  , g1  )
          ggsave( file = file.path( WorkingDir , "startFSC.png" )  , startplot  )
          
          
          #use 6,000,000 for each file
          flag = seq( 1 , 36e+06 , 6e+06 )
          
          #Find split flag use zero line NOT IN USE
          #flag = which( apply( oneFile ,1, function(x) all(as.character(x) == 0) ) )
          
          if( length(flag) > number_of_runs ){
            
            flag = flag[,-length(flag)]
            
          }
          
          #split the file use 0 raw
          #cl  = unlist(sapply(1:dim(oneFile)[1],findInterval,flag )) + 1
          
          
          #split the file use 6e3+06
          cl  = unlist(sapply(oneFile$PeakTime,findInterval,flag ))
          
          
          oneFile$cl <- cl
          
          bfcs = oneFile$FSC_peak > min_fsc
          bMaxWidth = oneFile$Width < max_width
          
          g1 = ggplot(oneFile, aes( x = FSC_peak , y  = Width , col = factor( bfcs ) )  ) + geom_point(size = 0.3)
          #ggsave( file = file.path(dirpath , "FSC.png" )  , g1  )
          ggsave( file = file.path( WorkingDir , "FSC.png" )  , g1  )
          
          oneFile = oneFile[ bfcs & bMaxWidth , ]
          oneFile = oneFile[oneFile$cl <= 6 , ]
          cl = oneFile$cl
          
          oneFile = oneFile[ , paste0("ch",1:11,"_peak") ]
          sp = split( oneFile , cl )
          
          
          if( any( length( sp ) != 6 ) ){
            
            #One of the group is samll
            
            ErrorTable  = rbind( ErrorTable , c( "Error4"  , paste0( "CSV file probelm: Number of Measuremnts ( 6e6 events ) ", length( sp ) )," != 6 " ) )
            
          }
          
          
          #DVSAddition--------------
          
          #check cl size
          #clsize = sapply(sp, function(x){ dim(x)[1] })
          clsize = sapply(sp, function(x){ nrow(x) })
          
          if( any( clsize < min_size ) ){
            
            #One of the group is samll
            
            ErrorTable  = rbind( ErrorTable , c( "Error1"  , paste0( "Low Class Size: One of the class size below min size of ", min_size ) ) )
            
          }
          
          #--------------
          
          #calculate medians
          medians = round(t(sapply(sp,function(x) sapply( x ,median ) ) ) , 0 )
          medians = data.frame(medians) 
          #rownames(medians) <- paste0("run",1:dim(medians)[1])
          rownames(medians) <- paste0("run",1:nrow(medians))
          
          
          #Extracting the runs voltage from the texts files
          fbin  = list.files(dirpath,pattern  = ".bin",full.names = T)
          if(length( fbin) > 6 ){
            
            fz = file.size( fbin )
            wfz = which( fz == min ( fz ) )   
            fbin = fbin[ -wfz ]
            
          } else if( length(fbin) < 6 ){
            
            #One of the the low medians is below set medians
            ErrorTable  = rbind( ErrorTable , c( "Error3", paste0( "Number of bin files : number of bin file  ", length( fbin ) , " < 6 " ) ) )
            
          }
          
          
          generalData = createGenralData( swversion , swversiondate , scriptversion, basename( f ) , scriptdate  )   
          
          
          if( any( c( "Error3","Error4" ) %in% ErrorTable[,1] ) ) {
            
            sink( file.path( dirpath , 'Summary Results.txt' ) )
            
            write.table( ErrorTable , row.names = F , sep  = "\t" , quote=FALSE , col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
            
            
            sink()
            
            sink( file.path( WorkingDir , 'Summary Results.txt' ) )
            
            write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
            
            sink()
            
            sink( file.path( WorkingDir , 'Summary Results.txt' ) )
            
            write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F ) #zzz #remove
            
            sink()
            
            #stringOut = flatten.dataframe( ErrorTable , TRUE , TRUE )
            
            return(1)
          }
          
          
          ft = gsub(".bin",".txt",fbin)
          #ft = list.files(dirpath,pattern  = ".txt",full.names = T)
          #ft = ft[ !grepl("log.txt", basename(ft)) ] 
          bt = basename(ft)
          fileTimes_t = sapply(bt , getTime)
          bf = !is.na(fileTimes_t)
          fileTimes_t = fileTimes_t[ bf ]
          ft = ft[ bf ]
          ft = ft[ order( fileTimes_t ) ]
          
          da = read.csv(ft[1],header = F,stringsAsFactors = F)
          bMultilines <- ifelse( dim(da)[2] > 10, TRUE , FALSE ) 
          
          Volts = NULL 
          if( bMultilines ){
            
            volcolnames <- paste0("volt.ch",1:11)
            
            for(f in ft ){
              
              da = read.csv(f,header = F,stringsAsFactors = F)
              #da = da[,1:11]
              da = da[2,c( 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 12 , 13 , 14 )]
              
              colnames( da ) <- volcolnames
              
              
              Volts = rbind( Volts , da  )
              
            }
            
            medians = cbind( medians , Volts )
            
          } else {
            
            Volts = unname(sapply(ft,getV  ))
            Volts = Volts[!duplicated(Volts)]
            medians$volts = Volts 
            
          }  
          
          #Calculate the interpolated voltage
          #Create plots
          #Create Summary Results.txt
          
          
          
          
          voltageouts = NULL
          r.squareds  = NULL
          
          
          png( file.path( WorkingDir , "Voltage.png" ) , width = 1920, height = 1080 ) 
          
          par(mfrow = c(3,4),oma = c(0, 0 , 2 , 0 ), mai = c(1, 1, 1, 1) )
          
          vi = length(setMedian) + 1
          
          
          for( i in 1:length(setMedian))
          {
            
            o = order(abs( medians[,i] - setMedian[i] ))
            m = medians[ o,] 
            
            x = m[1:3,i]
            
            voltname <- ifelse( bMultilines ,paste0("volt.ch",i) ,  "volts" ) 
            
            y = m[1:3, voltname ]
            
            if( bMultilines ){
              
              vi = which( colnames(m) %in% paste0("volt.ch",i) )
              
            }
            
            plot(m[ ,c( i , vi ) ] , 
                 pch = 19  , 
                 ylim = c(29,35) ,
                 main = paste0("Ch",i ,"Voltage" ),
                 xlim = range(c( setMedian[i],m[,i]) ),
                 cex.lab  = plotFontSsize ,  
                 cex.axis = plotFontSsize , 
                 cex.main = plotFontSsize , 
                 cex.sub  = plotFontSsize  )
            
            df = data.frame(m[1:3, ] )
            points( df[,c( i , vi )] , pch = 1 ,cex = 2 ,col = 3,lwd =2 ) 
            model = lm(y ~ x )
            r.squared = summary(model)$r.squared
            abline(model, col = 2,lwd = 2,lty = 2)
            voltageout  = predict( model,data.frame(x = setMedian[i]  ) )[1]
            voltageout  = round(voltageout,3)
            voltageouts = c(voltageouts,voltageout)
            r.squareds  = c(r.squareds, r.squared )
            points( setMedian[i] , voltageout ,cex = 2, col  = 2 ,pch = 4,lwd = 3 )
            
          }
          
          mtext("Fit Voltage Plots", outer = TRUE, cex = 1.5)
          
          dev.off()
          
          #Write Summary Results.txt
          Ch_.Voltage  = paste0("Ch",1:11,".Voltage")
          
          Rsq = round(r.squareds , 3 )
          
          RsqAcceptance = ifelse( Rsq > r.squareds.min , "PASS", "FAIL" )
          
          df1 = data.frame( ChannelVoltage  = Ch_.Voltage, Acceptance = RsqAcceptance , Value = voltageouts ,Rsq = Rsq )
          
          #DVSAddition--------------
          b1 = medians[1,1:11] > setMedian
          if( any( b1 ) ) {
            
            #One of the the low medians is below set medians
            w = which( b1 ) 
            
            ErrorTable  = rbind( ErrorTable , c( "Error2", paste0( "MedianBelow: One of the the low medians is below set medians ", Ch_.Voltage[ w ]  ) ) )
            
          }
          
          #-------------------------
          if( as.numeric(reverse_channels) == 0 ){
            
            dfv = df1$Value
            
          } else {
            
            dfv = rev( df1$Value )
            
          }
          
          
          
          for_in_string = data.frame( st1 = "Volt/Ch",st2 = paste( c(dfv[1:8],0,0,0,dfv[9:11],0,0),collapse = ",") )
          #for_in_string  = paste( "Volt/Ch",paste( c(dfv[1:8],0,0,0,dfv[9:11],0,0),collapse = ",") ,collapse = "\t" )
          
          
          if( bMultilines ){
            
            indexArray = NULL
            mediansName =  c( paste0("Ch",1:11) , paste0( "vCh",1:11 ) ) 
            colnames(medians) <- mediansName
            for( i in 1:11){
              
              indexArray = c(indexArray ,i,i+11)
              
            }
            
            medians = medians[ , indexArray ]
            #mediansName = mediansName[ indexArray ]
            #colnames( medians ) <- mediansName
            
          } else {      
            
            colnames( medians )  <-  c( paste0("Ch",1:11) , "Volt" ) 
            
          }
          
          sink( file.path( dirpath , 'Summary Results.txt' ) )
          
          write.table( ErrorTable , row.names = F , sep  = "\t" , quote=FALSE , col.names = F )
          write.table(df1,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          #cat("\n\n\n")
          write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
          cat("\n\n\n")
          write.table(medians,sep  = "\t" , quote=FALSE ,row.names = F )
          cat("\n\n\n" )
          write.table(for_in_string,sep  = "\t" , quote=FALSE ,row.names = F , col.names = F )
          #cat( for_in_string )
          
          sink()
          
          sink( file.path( WorkingDir , 'Summary Results.txt' ) )
          
          write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          write.table(df1,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          #cat("\n\n\n")
          write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
          cat("\n\n\n")
          write.table(medians,sep  = "\t" , quote=FALSE ,row.names = F )
          cat("\n\n\n" )
          write.table(for_in_string,sep  = "\t" , quote=FALSE ,row.names = F , col.names = F )
          #cat( for_in_string )
          
          sink()
          
          
        }
      }
      
      
      if(FALSE) { 
      
        qc_function_orginal <- function( ArrIn , cvar , minfilter )
        { 
          assign( "bGlobalQC" , 1,envir = .GlobalEnv )
          
          
          
          generalData = createGenralData( swversion , swversiondate , scriptversion, basename( f ) , scriptdate  )   
          
          
          
          
          #Default plot----------------------------
          
          # ---------------------------------------
          
          #Functions ------------------------------
          ErrorPlots <- function( ArrIn ,cnp ,WorkingDir, inputFileName ){
            
            #remove unused devs
            while(!is.null(dev.list())){
              dev.off()
            }
            
            #create col names
            cng = c(cnp , "FSC_area" )
            g = ArrIn[,cng ]   
            
            #flatten array
            r  = data.frame( preparePlot(g,cng,"FSC_area", "Type","value" ),stringsAsFactors = F )
            
            #conver to numeric
            r[,2:3] <- data.frame( sapply(r[,2:3],as.numeric) )
            
            
            p1 = ggplot( data  = r, aes(x = FSC_area, y = value ) )  + 
              geom_point(alpha = 1/10, size = 0.1) + 
              geom_smooth( method = "lm", fill = NA, size = 0.1 , alpha = 0.5 , linetype  = 2 ) +  
              facet_grid(. ~ Type ) + # ,scales='free_x', space='free_x' ) + 
              theme(panel.spacing = unit(1, "lines")) +
              scale_x_continuous(trans='log10') +
              scale_y_continuous(trans='log10', limits = c(10, 1e5) ) + theme_bw() + ggtitle("URCP beads")
            #scale_colour_manual( values = cols ) + 
            
            
            p2 = ggplot( data  = r, aes(x= FSC_area, y=value) ) +  
              #geom_point() + 
              scale_x_continuous(trans='log10') + 
              scale_y_continuous(trans='log10',limits = c(10, 1e5)) +
              geom_bin2d(binwidth = c(0.01,0.01)) + 
              facet_grid(. ~ Type ) + #, scales='free_x', space='free_x' ) + 
              theme(panel.spacing = unit(1, "lines")) + 
              #scale_fill_gradient(low = "#FFFFBB", high = "#FC3E07")
              scale_fill_gradient(low = heat.colors(2)[1], high = heat.colors(2)[2] ) + theme_bw()
            
            #grid.arrange( p1 , p2 , nrow = 2 )
            
            g1 <- arrangeGrob(p1, p2, nrow=2)
            
            #"URCP_beads.png"
            f_name = paste0( inputFileName,".png" ) 
            
            #ggsave(file= file.path( dirPath , gsub( "Events.csv" , "QCplots1.png",dirf ) ) , g )
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename3 = gsub( "Events.csv" , "QCplots1.png" , dirf )
              pngfilename3 = gsub( "Events.csv" , "QCplots1.png" , pngfilename3 )
              
            } else {
              
              pngfilename3 = gsub( ".csv" , "QCplots1.png" , dirf )
              
            }
            
            
            ggsave(file= file.path( WorkingDir , pngfilename3 ) , g1 )
            
          }
          
          cutMinus <- function(x) { 
            y = ifelse( x > 1,x,1 )  
            return(y)
          } 
          
          nonMinus <- function( x ){ all( x[2:length(x)] >=  0 ) }
          
          #----------------------------------------
          
          ErrorTable = NULL
          
          
          
          #No 7 classes
         
          #use for QC
          #calculate Rsqr
          # ch1  = c( 3531,  11373,  34643,  107265, 324936)
          # 
          # ch2  = c( 2785,   9525,  28421,  90313,  275589)
          # 
          # ch3  = c( 1158,   4161,  12528,  41140,  130347)
          # 
          # ch5  = c( 6501,  20302,  59517, 183870,  550645)
          # 
          # ch8  = c( 4490,  10967,  30210,  87027,  283621)
          
          
          
          #g5values = c( 6748 ,9148 ,6077 , 5283 , 2846 ,1812 , 1079 , 1395 , 2712 , 1002 , 820 )
          G7valuesHigh20  = 1.2 * g7values
          G7valuesLow20  =  0.8 * g7values
          G7valuesHigh10  = 1.1 * g7values
          G7valuesLow10  =  0.9 * g7values
          
          
          xAxis     = data.frame(ch1,ch2,ch3,ch5,ch8)
          xAxisName = c("ch1","ch2","ch3","ch5","ch8")
          acceptedName  = paste0(xAxisName,"_pass.fail")
          
          chNum = as.character(c(1,2,3,5,8))
          
          we = NULL
          for(xAi in paste0( xAxisName , "_" ) ){
            
            we = c( we,which( grepl(xAi,ResultsCycle) ) ) 
            
          }
          
          we = unique(we)
          cn = ResultsCycle[we]
          cnp = cn
          
          use_ch = NULL
          i = 0 
          for(ch in chNum ){
            
            i = i + 1
            w = which(grepl(ch,ResultsCycle))
            
            if(length(w) > 0 ){
              
              use_ch  = rbind( use_ch, c( xAxisName[i], paste0( ResultsCycle[w[1]],".median" ) ) )
              
            } else {
              
              use_ch  = rbind( use_ch, c( xAxisName[i], "Empty" ) )
              
            }
          }
          
          
          nrow_ArrIn = nrow( ArrIn )
          
          if( exists( "min_num_of_events"  ) ) {
          
            if( nrow_ArrIn <  min_num_of_events ) {
              
              ErrorTable1  = c( "Error2"  , paste0( "Number of events : Number of events ", nrow_ArrIn ," < " , min_num_of_events  ) )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
              
              #plot data to debug
              ErrorPlots( ArrIn ,cnp ,WorkingDir, "Error_URCP_beads" )
              
              return(1)
              
            }
          } else {
            
            print( "No min_num_of_events defined !")
            
          }  
          
          GroupData = ArrIn[ ArrIn[ ,"FSC" ] , ]
          
          nrow_GroupData = nrow( GroupData )
          
          if( exists( "min_num_of_postfiter_events"  ) ) {
          
            if( nrow_GroupData <  min_num_of_postfiter_events ) {
              
              ErrorTable1  = c( "Error3"  , paste0( "Number of events post filter : Number of events after filter ", nrow_GroupData ," < " , min_num_of_postfiter_events  ) )
              efilepath = file.path( WorkingDir , 'Summary Results.txt' )
              FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
              
              #plot data to debug
              ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" )
              
              return(1)
              
            }
          } else {
            
            print( "No min_num_of_postfiter_events defined !")
            
          }
          
          bGroupData =  apply( cbind( dumy = 1,GroupData[ , filter_minus_ch ] ), 1 , nonMinus  ) 
          
          GroupData  <- GroupData[ bGroupData , ] 
          
          #No addition cluster or empty addition cluster
          if( FALSE){ #NOT WORKING !!!!!
          
            # check if there is addition cluster
            colnamesGroupData = colnames( GroupData )
            additionClusterNames =  colnamesGroupData[ grepl("addition_cluster", colnamesGroupData )]
            
            
            if( length( additionClusterNames ) > 0 )
            {
              
              bApplyCluster =  apply( data.frame( GroupData[,additionClusterNames] ) , 2 , any )
              bApplyElements = apply( data.frame( GroupData[,additionClusterNames] ) , 1 , any )
              numberofAddtionClusters = sum(bApplyCluster)
              
              #ag = 1:dim(GroupData)[1]
              ag = 1:nrow(GroupData)
              
              wa = ag[ bApplyElements ]
              wkm = ag[ !bApplyElements ]
              #kmcluster = rep(0,dim(GroupData)[1])
              kmcluster = rep(0, nrow( GroupData ) )
              
              
              #no addition cluster
            } else {
              
              numberofAddtionClusters = 0
              
            }
          
            buse7 = FALSE
            
            #if high number of ch9 above boudary use 7 cluster 
            if( max_autoclastring_boundary != 0 ){
              
              buse7 =  sum( GroupData[, varCycle[2] ] > autoclastring_boundary ) > max_autoclastring_boundary
              
            } 
            
            if(  buse7 ){
              
              clusternum = 7
              
            }
           
          
            if( numberofAddtionClusters > 0 )
            {
              
              #logGroupData = log(GroupData[ , varCycle ])
              km = kmeans( scale( GroupData[ !bApplyElements , varCycle ],center = TRUE ),clusternum - numberofAddtionClusters , iter.max = 150, nstart = 150)
              km$cluster = km$cluster + numberofAddtionClusters
              kmcluster[wkm] = km$cluster
              
            } else {
              
              df <-  GroupData[ , varCycle ]
              
              #df[ , varCycle[ 2 ] ] <- df[ , varCycle[ 2 ] ]/2
              #km = kmeans( GroupData[ , varCycle ],center = TRUE ,clusternum , iter.max = 150, nstart = 150 )
              #mc = Mclust( scale( GroupData[ , varCycle ] )  ,G = clusternum )
              #mc = Mclust( df , G = clusternum )
              
              tryCatchR  <- tryCatch( {
                
                #mc =  qc_clusterconture(df)
                #kmcluster = mc$classification
                kmcluster = findClusters( df , max_m0_factor = 26  , NumOfCluster  = 7 )
                0
                
              }, error = function(e) { print (  paste0( "qc_clusterconture(df) Error", e )  ) ; 1 }, finally = 0 ) #eee remove
              
              
              if( tryCatchR == 1 ){
                
                #vvv remove
                ErrorTable1  = c( "Error5"  , "Unable to perform conture clustering " )
                efilepath = file.path( WorkingDir , 'Summary Results.txt' )
                FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
                
                #plot data to debug
                ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" )
                
                # sink( GlobalQcPath ,append = T )
                # 
                #   ErrorTable1 = data.frame(string = ErrorTable1 )
                #   #insert to Qclog file
                #   ErrorTable1 = flatten.dataframe( ErrorTable , TRUE , TRUE )
                #   write.table( ErrorTable1 ,row.names = F,sep  = ",",quote=FALSE,col.names = F)
                # 
                # sink()
                
                bGlobalAssignErrorString <<- " , Clustering Problem"
                
                return(1)
                
              }
              
              
              #km = kmeans( scale( GroupData[ , varCycle ],center = TRUE ),clusternum , iter.max = 150, nstart = 150) 
              #km = kmeans( scale( df,center = TRUE ),clusternum , iter.max = 150, nstart = 150) #Change 300719
              #kmcluster = mc$classification
              #kmcluster = km$cluster
              
            }
          }
          
          
          
          #Build 2D data.frame for conture cluster 
          df <-  GroupData[ , varCycle ]
          #confure clustering
          #mc =  qc_clusterconture(df)
          #kmcluster = mc$classification
          #browser() #280420
          
          kmcluster = findClusters( df , max_m0_factor = 26  , NumOfCluster  = 7 )
          
          if( length( varCycle ) == 2 ){
            
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename2 = gsub( "Events.csv" , "Beads.png",dirf ) 
              pngfilename2 = gsub( "events.csv" , "Beads.png",pngfilename2 ) 
              
            } else {
              
              pngfilename2 = gsub( ".csv" , "Beads.png",dirf ) 
              
            }
            
            #browser() #280420
            
            if( nrow( df ) == length( kmcluster ) ) {
            
              png( file.path( WorkingDir , pngfilename2 ), width = 1920, height = 1080 ) 
              
                cl_names = names( table( kmcluster ) )
                  
                legendCols = rainbow(10)[ c(1:8) ]
                #legendCols = rainbow(100)[ c(1,10,20,30,50,60,70,80)]
                cols = legendCols[ factor(kmcluster) ]
                cexs = c( 1 ,0.01 )[ factor( kmcluster == 0 ) ]
                
                plot( df,
                      pch = c(19 ,1)[ factor( kmcluster == 0 ) ] ,
                      col = cols , 
                      main = "Clustering", #paste0( "Sizes ", paste0(table(re),collapse = ",") ) , 
                      cex =  cexs  )
                
                legend("topleft", paste0( cl_names , " - ", table(kmcluster) ) , col = legendCols , pch = 19 , pt.cex = c( 0.5 , rep( 1 , 7 ) ) )
              
              dev.off()
              
            }
            
          }
          
          
          #remove zero cluster point that are not part of any cluster
          GroupData0 =  GroupData[ kmcluster == 0, ]
          GroupData  =  GroupData[ kmcluster != 0, ]
          kmcluster  =  kmcluster[ kmcluster != 0  ]
          
          le = length( ResultsCycle )
          
          sp = split(GroupData[, ResultsCycle ] , kmcluster )
          
          
          
          #No 7 classes
          if( length( sp ) != 7   ){
            
            ErrorTable1  = c( "Error0"  , paste0( "Number of Classes: Number of Classes ", length( sp ) ," != 7 " ) )
            efilepath = file.path( WorkingDir , 'Summary Results.txt' )
            FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
            
            # sink( GlobalQcPath ,append = T )
            # 
            #   ErrorTable1 = data.frame(string = ErrorTable1 )
            #   #insert to Qclog file
            #   ErrorTable1 = flatten.dataframe( ErrorTable , TRUE , TRUE )
            #   write.table( ErrorTable1 ,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            #   
            # sink()
            
            bGlobalAssignErrorString <<-  "Number of class != 7"
            
            
            ErrorPlots( ArrIn ,cnp ,WorkingDir, "post Filter Error_URCP_beads" ) #yyy
            
            return(1)
            
          }
          
          
          #Count = sapply( sp , function(x) { dim(x)[1] } )
          Count = sapply( sp , function(x) { nrow(x) } )
          numberofcounts =  sum(Count)
          
          clusterMean  =   data.frame(t( round( sapply( sp , colMeans ) , 2 ) ) )
          colnames( clusterMean ) <- paste0(ResultsCycle,".mean" )
          clusterMedian  = t(sapply( sp , function(x)  round(sapply(x,median) , 2 ) ) )
          colnames( clusterMedian ) <- paste0(ResultsCycle,".median" )
          clusterSTD  =    t(sapply( sp , function(x)  round( sapply(x,sd) , 2 ) ) )
          colnames( clusterSTD ) <- paste0(ResultsCycle,".STD" )
          clusterRSD  =    t(sapply( sp , function(x)  round( sapply(x,rsd) , 2 ) ) )
          
          clusterCh1FSCCorrelations = round(sapply( sp , function(x){ cor( x[,ch1corrname ],x[, FSCcorrname ] ) } ) , 2 )
          
          colnames( clusterRSD ) <- paste0(ResultsCycle,".RSTD" )
          
          dfout = cbind(Count,
                        clusterMedian ,
                        clusterRSD   ,
                        clusterMean  , 
                        clusterSTD ) 
          
          
          
          clusterCV  =   data.frame(round(100* dfout[,paste0(ResultsCycle,".STD" )]/dfout[ , paste0(ResultsCycle,".mean" )],2))
          clusterRCV  =  data.frame(round(100* dfout[,paste0(ResultsCycle,".RSTD" )]/dfout[,paste0(ResultsCycle,".median" )],2))
          
          colnames(clusterCV) <-  gsub(".STD",".CV",colnames(clusterCV))
          colnames(clusterRCV) <-  gsub(".RSTD",".RCV",colnames(clusterRCV))
          
          dfout = cbind(Count,clusterMedian,clusterRCV,clusterMean,clusterCV,clusterSTD,clusterRSD)
          
          
          # we = NULL
          # for(xAi in paste0( xAxisName , "_" ) ){
          #   
          #   we = c( we,which( grepl(xAi,ResultsCycle) ) ) 
          #   
          # }
          # 
          # we = unique(we)
          # cn = ResultsCycle[we]
          # cnp = cn
          
          cn = paste0( cn , ".median" ) 
          cnh = paste0(cn ,".log")
          
          
          
          whi = which( sapply(dfout[,cn], max ) < 250000 )
          
          if(length(whi) > 0 ){
            
            min_whi = min( whi )
            cn = cn[ min_whi ] 
            cnh = cnh[ min_whi] 
            
          } else {
            
            print("ERROR: all channels above 65000 !!!!! " )
            
          }
          
          
          or7 = order(dfout[,"ch9_peak.median"],decreasing = T )[1]
          
          #fined high ch9 group
          G7 = dfout[or7 , ]
          dfout = dfout[-or7 , ]
          
          #oreder group by channel 1
          OrderGroups = order(dfout[,cn])
          dfout = dfout[ OrderGroups ,]
          
          # add group 7
          dfout = rbind( dfout , G7 ) 
          
          print("DIM")
          print(dim(dfout))
          #rownames(dfout) = NULL
          #dfout = cbind(Group = paste0("G",1:dim(dfout)[1]), dfout ) 
          dfout = cbind(Group = paste0( "G" , 1:nrow( dfout ) ), dfout ) 
          
          # ch2.rstd.g4.max  = 22
          # ch4.rstd.g2.max = 13
          # fsc.rstd.g4.max = 10
    
          colnames_dfout  = colnames( dfout )
    
          
          traditionParVarName  =  c( "Ch2_RCV_G4","Ch4_RCV_G2","FSC_RCV_G4" )
          
          ch2.RCV.g4.string    = colnames_dfout[ grepl("ch2" ,colnames_dfout ) & grepl(".RCV"    , colnames_dfout ) ]
          ch2.median.g4.string = colnames_dfout[ grepl("ch2" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          #ch2.RCV.g4.string    = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          #ch2.median.g4.string = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          ch4.RCV.g2.string    = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          ch4.median.g2.string = colnames_dfout[ grepl("ch4" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
                
          fsc.RCV.g4.string   = colnames_dfout[ grepl("FSC" ,colnames_dfout ) & grepl(".RCV"   , colnames_dfout ) ]
          fsc.median.g4.string = colnames_dfout[ grepl("FSC" ,colnames_dfout ) & grepl(".median" , colnames_dfout ) ]
          
          ch2.RCV.g4 =  dfout[ dfout$Group == "G4" , ch2.RCV.g4.string   ] #/ dfout[ dfout$Group == "G4" , ch2.median.g4.string ]
          ch4.RCV.g2 =  dfout[ dfout$Group == "G2" , ch4.RCV.g2.string   ] #/ dfout[ dfout$Group == "G2" , ch4.median.g2.string ]
          fsc.RCV.g4 =  dfout[ dfout$Group == "G4" , fsc.RCV.g4.string   ] #/ dfout[ dfout$Group == "G4" , fsc.median.g4.string ]
          
          ch2.RCV.g4.passfail  =  ifelse( ch2.RCV.g4  < ch2.rcv.g4.max , "PASS", "FAIL" )
          ch4.RCV.g2.passfail  =  ifelse( ch4.RCV.g2  < ch4.rcv.g2.max , "PASS", "FAIL" )
          
          fsc.RCV.g4.passfail  =  ifelse( fsc.RCV.g4  < fsc.rcv.g4.min , "PASS", "SUS" )
          
          if( fsc.RCV.g4.passfail == "SUS" ){
            
            fsc.RCV.g4.passfail  =  ifelse( fsc.RCV.g4  < fsc.rcv.g4.max , "WARNING", "FAIL" )
            
          }
          #fsc.Rstd.g4.passfail  =  ifelse( fsc.Rstd.g4  < fsc.rstd.g4.max , "PASS", "FAIL" )
  
          traditionParVarValue  =  c( ch2.RCV.g4,ch4.RCV.g2,fsc.RCV.g4)
          traditionParpassfail  =  c( ch2.RCV.g4.passfail,ch4.RCV.g2.passfail,fsc.RCV.g4.passfail)
          
          traditionParDataframe = data.frame( Names = traditionParVarName,
                                              Value = traditionParVarValue,
                                              Accepted = traditionParpassfail )
            
            
            
          if( remove_from_count == 0 ){
            
            CountRatioValue =  round( 100 * ( mean( dfout$Count ) - min( dfout$Count ) ) / mean( dfout$Count ) , 0 )
            
          } else {
            
            groupOut  = paste0( "G" , remove_from_count )
            
            wout = which( dfout$Group ==  groupOut ) 
            
            if( length( wout ) > 0 ){
            
              CountRatioValue =  round( 100 * ( mean(dfout$Count[ -wout ]) - min(dfout$Count[ -wout ]) ) / mean(dfout$Count[ -wout ] ) , 0 )
              
            } else {
              
              CountRatioValue =  round( 100 * ( mean( dfout$Count ) - min( dfout$Count ) ) / mean( dfout$Count ) , 0 )
              
            }
            
          }
            
            
          CountRatio  = c("Counts: (Average-Minimum)/Average % ", CountRatioValue )
          
          
          #prepare table with G3 ratio results
          G3d = unlist( dfout[ dfout$Group == "G3", 4:14 ] ) 
          ratioG3d = G3d / G3d[1]
          ratioG3d = data.frame( "Name" = names(ratioG3d) , "RatioValueVs.Ch1"  =  round(ratioG3d,2) ) 
          
          use_ch = use_ch[use_ch[,2] != "Empty",]
          
          use_ch_replace_mean = gsub("median","mean", use_ch ) 
          
          rss = c("Channel","Rsq","LOD","Accepted")
          
          #for( i in 1:dim(use_ch)[1] ) 
          for( i in 1:nrow( use_ch ) ) 
          {
            
            #upAcceptedLodValue  = eval( parse( text = acceptedName[i] ) ) #remove
            x = log( xAxis[,use_ch[i,1]] )
            #y = log( dfout[ 2:( length(x) + 1 ), use_ch[ i , 2 ] ] )
            y = log( dfout[ c(2 , 3 , 4 , 5 , 6 ) , use_ch[ i , 2 ] ] )
            model = lm( y ~ x )
            rs = round(summary(model)$r.squared,3)
            
            if ( dfout[1,use_ch[i,2]] <= 1 ){
              
              yp = 1
              
            } else {
              
              yp = log( dfout[1,use_ch[i,2]] )
              
            }
            
            LOD = round( exp( ( yp - model$coefficients[1] ) / model$coefficients[2]  ) , 2 ) 
            
            lodname = paste0(use_ch[i,1],"lod")
            assign( lodname,LOD,envir = .GlobalEnv )
            
            calVar( ArrIn  , cvar ) 
            
            
            if( exists( acceptedName[i] ) ){
              
              upAcceptedLodValue = eval( parse( text = acceptedName[i] ) ) 
              acceptLOD = ifelse(upAcceptedLodValue,"PASS","FAIL")
              
            } else {
              
              acceptLOD = "PASS"
              
            }
      
            
            rss = rbind(rss, c(use_ch[i,1],rs, LOD , acceptLOD ) )
            
          }     
          
      
          Validity_count_min_number = ifelse( numberofcounts > count_min_number, "PASS","FAIL" ) 
          colnameforCorr  = c("NAME","VALUE","Accepted") # Add 0406 
          
          Validity_count_maxmin_ratio_uplimit =  ifelse( CountRatioValue < count_maxmin_ratio_uplimit, "PASS","FAIL" ) 
          #CountRatioline = c(CountRatio , Validity_count_maxmin_ratio_uplimit, rep("",columnsForCountRatio ) )#change0406
          CountRatioline = c(CountRatio , Validity_count_maxmin_ratio_uplimit)# Add 0406
          
          
          QcCorrelationTable  = CountRatioline
          CountValueLine = c("Total Beads Count", numberofcounts ,Validity_count_min_number ) #Add0406 
          QcCorrelationTable  = rbind( QcCorrelationTable  , CountValueLine )
          
          i = 0 
          #Insert Ch1 vs.FSC correaltion to table 
          clusterCh1FSCCorrelations = clusterCh1FSCCorrelations[ OrderGroups ]
          
          for ( Ch1FSCCorrelation in clusterCh1FSCCorrelations )  
          {
            i = i + 1
            Validity_ch1_fsc_correlation_max =  ifelse( Ch1FSCCorrelation < ch1_fsc_correlation_max, "PASS","FAIL" ) 
            Ch1FSCCorrelationValueLine = c(paste0( "G" , i , "_Ch1FSC_Correlation")  , Ch1FSCCorrelation , Validity_ch1_fsc_correlation_max )#Add0406
            QcCorrelationTable  = rbind(QcCorrelationTable  , Ch1FSCCorrelationValueLine )
            
          }
          
          QcCorrelationTable  = data.frame( QcCorrelationTable  )
          colnames( QcCorrelationTable  ) = c("NAME","VALUE","Accepted")
          
          BeadsCountLine = QcCorrelationTable[2,1:2]
          
          browser() #050520
          
          #prepare G5 table
          # G5results = dfout[dfout$Group == "G5",4:14]
          # G5re20 = ifelse( ( G5results > G5valuesLow20 ) & ( G5results < G5valuesHigh20 ) , "PASS" , "FAIL" ) 
          # G5re10 = ifelse( ( G5results > G5valuesLow10 ) & ( G5results < G5valuesHigh10 ) , "PASS" , "FAIL" ) 
          # G5Names = paste0( "G5ch",1:11 )
          # QcCorrelationG5 = data.frame( Names       = G5Names , 
          #                               Value       = as.vector(unlist(G5results)) ,
          #                               Accepted10  = as.vector( G5re10 ), 
          #                               Accepted20  = as.vector( G5re20 ) )
          
          if ( !exists( "basic_temp"  ) ){
            
            basic_temp = 33
            
          }
          
          
          if ( !exists( "tempCoeff"  ) ){
            
            tempCoeff = 4
            
          }
          
          SiPMpath = file.path( dirPath , "SiPM Temp.txt" )
          
          #Default value
          mean_daSiPM = basic_temp
  
          if( file.exists( SiPMpath ) ){
  
            daSiPM = read.csv( SiPMpath , "\t" ,header= F)
            
            if( !is.null( daSiPM ) ) {
              
              mean_daSiPM  = ifelse( nrow( daSiPM ) > 0 , mean( daSiPM$V3 ) , 0   )
              
            } 
          }
          
          G7results = dfout[dfout$Group == "G7",4:14]
          G7re20 = ifelse( ( G7results > G7valuesLow20 ) & ( G7results < G7valuesHigh20 ) , "PASS" , "FAIL" ) 
          G7re10 = ifelse( ( G7results > G7valuesLow10 ) & ( G7results < G7valuesHigh10 ) , "PASS" , "FAIL" ) 
          G7Names = paste0( "G7ch",1:11 )
          actualValue = as.vector(unlist(G7results))
          Dt = ( mean_daSiPM - basic_temp )
        
          #Expected correction 
          correctedExpected =  g7values + tempCoeff * Dt
          QcCorrelationG7 = data.frame( Names       = G7Names  ,
                                        Expected    = g7values ,
                                        Value       = actualValue ,
                                        correctedExpected  = correctedExpected ,
                                        Diff        = round( 100 * ( actualValue - g7values ) / g7values , 2 ),
                                        Temperature = round( mean_daSiPM , 2 ),
                                        Accepted10  = as.vector( G7re10 ), 
                                        Accepted20  = as.vector( G7re20 ) )
          
          
          #Change colnames
          colnames( QcCorrelationG7 )[ c( 5,6,8 ) ] <- c( "Diff%", "Accepted_DVS_%10" , "Accepted_DVS_%20" )
          
          G4results = dfout[dfout$Group == "G4",4:14]
          G7results = dfout[dfout$Group == "G7",4:14]
          
          ratio_URQCP_level4VsJGB = G4results / G7results
          
          ratio_URQCP_level4VsJGB  = round( t(unname(ratio_URQCP_level4VsJGB[1,])) ,3)
          
          Channels = paste0( "Ch" , 1:11 )
          
          #TitleTable = c( "URQCP_level4VsJGB" ,"" )
          
          ratio_URQCP_level4VsJGB_Table = data.frame( Channel = Channels , URQCPvs.JGBratio  = ratio_URQCP_level4VsJGB , row.names = NULL  )
          #colnames( ratio_URQCP_level4VsJGB_Table) <-  c("Channel" , "URQCPvs.JGBratio")
          colnames( ratio_URQCP_level4VsJGB_Table) <-  c("Channel" , "G5vsG7_ratio")
          
          #write Results
          # sink( file.path( dirPath , gsub("Events","QCResults", dirf ) ) ) 
          # 
          #   write.table(dfout,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(rss,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #   cat("\n\n\n")
          #   write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   cat("\n\n\n")
          #   write.table(QcCorrelationG5,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          #   
          # 
          # sink()
          
          
          sink( file.path( dirPath , 'Summary Results.txt' ) )
          
            rssname = paste0( rss[,1],"_LOD" )
            
            #bShowsfqcnames_rssname  = sfqcnames %in% rssname  
            #rss_bShowsfqcnames  = rss[ bShowsfqcnames_rssname , ]
            
            rss[,1] <- rssname
            rssor  = rss[-1,] 
            rssor = data.frame(rssor)
            #rss = rss[-1,c(1,4) ]
            
            rss0 =  rss[-1,c(1,4) ]
            brss0 = rss0[,2] != "PASS"
            
            if( any(brss0) ){
           
              write.table( rss0,row.names = F,sep  = "\t",quote=FALSE,col.names = F) 
              
            }
            
            bQcCorrelationTable = QcCorrelationTable[,3] != "PASS"
            
            # bShowsfqcnames_QcCorrelationTable  = sfqcnames %in% QcCorrelationTable$NAME
            # QcCorrelationTable_bShowsfqcnames  = QcCorrelationTable[ bShowsfqcnames_QcCorrelationTable ,]
            
            if( any( bQcCorrelationTable ) ){
              
              write.table(QcCorrelationTable[  bQcCorrelationTable ,c(1,3) ] ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            
            bQcCorrelationG7 = QcCorrelationG7[,8] != "PASS"
            
            #bShowsfqcnames_QcCorrelationG7 =  sfqcnames %in% QcCorrelationG7$Names
            #QcCorrelationG7_bShowsfqcnames  = QcCorrelationG7[ bShowsfqcnames_QcCorrelationG7 ,]
            
            
            if( any( bQcCorrelationG7 ) ){
              
              write.table(QcCorrelationG7[ bQcCorrelationG7 ,c(1,8) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            btraditionParDataframe = traditionParDataframe[,3] != "PASS"
            #bShowsfqcnames_traditionParDataframe =  sfqcnames %in% traditionParDataframe$Names
            #traditionParDataframe_bShowsfqcnames  = traditionParDataframe[ bShowsfqcnames_traditionParDataframe ,]
            
            if( any( btraditionParDataframe ) ){
              
              write.table(traditionParDataframe[ btraditionParDataframe ,c(1,3) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            
            if( !any( brss0 , bQcCorrelationTable , bQcCorrelationG7, btraditionParDataframe ) ){
              
              allpass = data.frame(str1 = "All PARAMETERS",str2 = "PASS" )
              write.table( allpass ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
              #cat("\n")
              #write.table(generalData,row.names = F,sep  = ",",quote = FALSE ,col.names = F)
              
            }
            
            BeadsCountLine = data.frame(str1 = BeadsCountLine[1],str2 = BeadsCountLine[2] )
            write.table( BeadsCountLine ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
            
            cat("\n\n\n")
            write.table(rssor,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            #cat("\n\n\n")
            write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            
          sink()
          
          
          sink( file.path( WorkingDir , gsub("Events","QCResults", dirf ) ) ) 
          
            write.table(dfout,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(rss,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            cat("\n\n\n")
            write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
            cat("\n\n\n")
            write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            
            
          sink()
          
          
          sink( file.path( WorkingDir , 'Summary Results.txt' ) )
          
            #rssname = paste0( rss[,1],"_LOD" )
            #rss[,1] <- rssname
                   
            rss = rss[-1,c(1,4) ]
            
            brss = rss[,2] != "PASS"
            
            if( any(brss) ){
            
              write.table(rss[brss,],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            bQcCorrelationTable = QcCorrelationTable[,3] != "PASS"
            
            if( any( bQcCorrelationTable ) ){
              
              write.table(QcCorrelationTable[  bQcCorrelationTable ,c(1,3) ] ,row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            
            bQcCorrelationG7 = QcCorrelationG7[,8] != "PASS"
            
            if( any( bQcCorrelationG7 ) ){
              
              write.table(QcCorrelationG7[ bQcCorrelationG7 ,c(1,8) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            
            btraditionParDataframe = traditionParDataframe[,3] != "PASS"
            
            if( any( btraditionParDataframe ) ){
              
              write.table(traditionParDataframe[ btraditionParDataframe ,c(1,3) ],row.names = F,sep  = "\t",quote=FALSE,col.names = F)
              
            }
            
            
            if( !any( brss , bQcCorrelationTable , bQcCorrelationG7, btraditionParDataframe ) ){
              
                  allpass = data.frame(str1 = "All PARAMETERS ",str2 = "PASS" )
                  write.table( allpass ,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
                  #cat("\n")
                  #write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = F)
                  
                  
            }
            
            BeadsCountLine = data.frame(str1 = BeadsCountLine[1],str2 = BeadsCountLine[2] )
            write.table( BeadsCountLine ,row.names = F,sep  = "\t",quote = FALSE ,col.names = F )
            
            cat("\n\n\n")
            write.table(rssor,row.names = F,sep  = ",",quote=FALSE,col.names = F)
            #cat("\n\n\n")
            write.table(QcCorrelationTable ,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(ratioG3d,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(QcCorrelationG7,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(traditionParDataframe,row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table( ratio_URQCP_level4VsJGB_Table, row.names = F,sep  = ",",quote=FALSE,col.names = T)
            #cat("\n\n\n")
            write.table(generalData,row.names = F,sep  = ",",quote=FALSE,col.names = T)
          
          sink()
          
          
          # sink( GlobalQcPath ,append = T )
          #   
          #   s1  = paste0( "@Start",paste0("@rss;",apply( rssor,1,paste0,collapse = ";"),collapse = "") )
          #   QcCorrelationTable = data.frame(QcCorrelationTable)
          #   s2  = paste0("@QcCorrelationTableResult;",apply( QcCorrelationTable,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(ratioG3d)
          #   s3  = paste0("@ratioG3d;",apply( ratioG3d,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(QcCorrelationG7)
          #   s4 = paste0("@QcCorrelationG7;",apply( QcCorrelationG7,1,paste0,collapse = ";"),collapse = "")
          #   ratioG3d = data.frame(traditionParDataframe)
          #   s5 = paste0("@traditionParDataframe;",apply( traditionParDataframe,1,paste0,collapse = ";"),collapse = "")
          #   ratio_URQCP_level4VsJGB_Table = data.frame(ratio_URQCP_level4VsJGB_Table)
          #   s6 = paste0("@ratio_URQCP_level4VsJGB_Table;",apply( ratio_URQCP_level4VsJGB_Table,1,paste0,collapse = ";"),collapse = "")
          #   generalData = data.frame(generalData)
          #   s7 = paste0("@generalData;",apply( generalData,1,paste0,collapse = ";"),collapse = "")
          #   so = paste0("@Time",Sys.time(),s1,s2,s3,s4,s5,s6,s7,"@End")
          #   so = data.frame(string = so)
          #   write.table(so,row.names = F,sep  = ",",quote=FALSE,col.names = F)
          #   
          # sink()
  
          # SiPMpath = file.path( dirPath , "SiPM Temp.txt" )
          # 
          # if( file.exists( SiPMpath ) ){
          # 
          #   li = readLines( SiPMpath , 1 )
          # 
          #   if(length(li) > 0  ){
          #     
          #     rd = strsplit( li[1] ,"\t" )
          #     
          #   } else {
          #     
          #     rd = c("0","0","0")
          # 
          #   }
          # } else {
          #   
          #   print("File SiPMpath Not Exists !!!!" )
          #   rd = c("0","0","0")
          #   
          # }
          
          rdNames = c( "Date" , "Time", "Temp" )
          
          
          #prepare line string in QC.Log 
          #data.QC.log =  data.frame( matrix( unlist( c( rd , basename(f) , as.character( dfout[dfout$Group == "G5",2:dim(dfout)[2]] ) )),1,) )
          #colnames(data.QC.log) = c( rdNames ,"FileName" ,  colnames(dfout)[2:dim(dfout)[2]] )
        
          #preparePlot()
          
          
          ylims = NULL
          
          for( cni in cnp ){
            
            
            h  = hist(log(sp[[1]][, cni  ]), 30 , plot = F ) 
            
            hcountsMax = max(h$counts)
            
            for(i in 2:length(sp) ){
              
              h = hist(log( sp[[i]][, cni   ] ),30 , plot  = F )
              
              hcountsMax = ifelse( hcountsMax  > max(h$counts), hcountsMax , max( h$counts ) )
              
            }
            
            ylims = c( ylims , hcountsMax )
            
          }
          
          h  = hist(ArrIn[,xplotname],300 , plot = F )
          
          cng = c(cnp , "FSC_area" )
          
          g = cbind( GroupData[,cng ] , kmcluster )   
          
          cng = c(cng ,"kmcluster")        
          
          r  = preparePlot(g,cng,c( "FSC_area", "kmcluster" ), "Type","value" )
          
          #Change Name
          r$cluster <-  factor( kmcluster )
          types = as.character(unique(r[,"Type"] ))
          
          #find ch8 variable name 
          ch8.string   = types[ grepl("ch8_" ,types ) ]
          rf = r[r[,"Type"] ==  ch8.string, ]
          
          spr = split(rf$value , rf$cluster )
          sprm = sapply(spr,mean)
          wm = which( max( sprm ) == sprm )
          names_spr = as.numeric(names( spr)[ wm ])
          r = r[r$kmcluster != names_spr , ]
          
          
          # if( nrow( r ) >  1e4 ){
          #   
          #   r = r[sample(nrow(r), 10000 ),]
          #   
          # }
          
          #png( file.path( dirPath , gsub( "Events.csv" , "URCP_beads.png",dirf ) ) ) 
          
          cols = rainbow( length( unique( r$cluster ) ) ) 
          p1 = ggplot( data  = r, aes(x = FSC_area, y = value, color= cluster  ) )  + 
            geom_point(alpha = 1/10, size = 0.1) + 
            geom_smooth( method = "lm", fill = NA, size = 0.1 , alpha = 0.5 , linetype  = 2 ) +  
            facet_grid(. ~ Type ) + # ,scales='free_x', space='free_x' ) + 
            theme(panel.spacing = unit(1, "lines")) +
            scale_x_continuous(trans='log10') +
            scale_y_continuous(trans='log10', limits = c(10, 1e5) ) +
            scale_colour_manual( values = cols ) + theme_bw() + ggtitle("URCP beads")
          
          
          p2 = ggplot( data  = r, aes(x= FSC_area, y=value) ) +  
            #geom_point() + 
            scale_x_continuous(trans='log10') + 
            scale_y_continuous(trans='log10',limits = c(10, 1e5)) +
            geom_bin2d(binwidth = c(0.01,0.01)) + 
            facet_grid(. ~ Type ) + #, scales='free_x', space='free_x' ) + 
            theme(panel.spacing = unit(1, "lines")) + 
            #scale_fill_gradient(low = "#FFFFBB", high = "#FC3E07")
            scale_fill_gradient(low = heat.colors(2)[1], high = heat.colors(2)[2] ) + theme_bw()
          
          #grid.arrange( p1 , p2 , nrow = 2 )
          
          g1 <- arrangeGrob(p1, p2, nrow=2 )
          
          #ggsave(file= file.path( dirPath , gsub( "Events.csv" , "QCplots1.png",dirf ) ) , g )
          
          if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
            
            pngfilename = gsub( "Events.csv" , "URCP_beads.png",dirf )
            pngfilename = gsub( "events.csv" , "URCP_beads.png",pngfilename )  
            
          } else {
            
            pngfilename = gsub( ".csv" , "URCP_beads.png",dirf )
            
          } 
          
          
          
          ggsave(file= file.path( WorkingDir , pngfilename ) , g1 )
          
          #png( file.path( dirPath , gsub( "Events.csv" , "QCplots.png",dirf ) ) )
          
          if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
            
            pngfilename1 = gsub( "Events.csv" , "QCplots.png",dirf )
            pngfilename1 = gsub( "events.csv" , "QCplots.png",pngfilename1 )
            
          } else {
            
            pngfilename1 = gsub( ".csv" , "QCplots.png",dirf )
            
          }
          
          png( file.path( WorkingDir , pngfilename1 ), width = 1920, height = 1080 ) 
          
          par(mar = c(2,5,1,1))
          par(mfrow = c(length(cnp)+1,1))
          
          plotFontSsize = 2
          
          h = hist(ArrIn[,xplotname], 100 , #230919change from 300 to 100 
               xlab = xplotname,
               #xlim = quantile(ArrIn[,xplotname],c(0.02,0.99)),
               xlim = c( xminhist , xmaxhist ),
               #ylim = c(0,max(h$count) * 1.3),
               main = paste0( "Filter by " , xplotname ) , plot = T,
               
               cex.lab  = plotFontSsize ,  
               cex.axis = plotFontSsize , 
               cex.main = plotFontSsize , 
               cex.sub  = plotFontSsize )
          
          abline( v = minfilter ,lwd = 2, col = 2 ,lty = 2)
          
          if(exists( "fcsdown" ) & exists( "fcsup" ) ){
            
            abline( v = c( fcsdown,fcsup ) ,lwd = 2, col = 3 ,lty = 2)
          }
          
          k = 0 
          for( cni in cnp ){
            
            k= k+1 
            
            h  = hist(log(sp[[1]][, cni  ]),
                      30,
                      col = cols[1],
                      xlim = c( xminhist , xmaxhist ),
                      ylim = c( yminhist , ylims[k] * 1.1 ),
                      main = "" ,
                      xlab = "Groups",
                      ylab = cni,
                      cex.lab  = plotFontSsize ,  
                      cex.axis = plotFontSsize , 
                      cex.main = plotFontSsize , 
                      cex.sub  = plotFontSsize ) 
            
            
            for(i in 2:length(sp) ){
              
              h = hist(log( sp[[i]][, cni   ] ),30, add = T , col = cols[i] , ylab = cni , xlab = "Groups" )
              
            }
            
          }
          
          dev.off()
          
          if( length( varCycle ) == 2 ){
            
            
            if( grepl( "Events.csv" , dirf ) | grepl( "events.csv" , dirf ) ){
              
              pngfilename2 = gsub( "Events.csv" , "Beads.png",dirf ) 
              pngfilename2 = gsub( "events.csv" , "Beads.png",pngfilename2 ) 
              
            } else {
              
              pngfilename2 = gsub( ".csv" , "Beads.png",dirf ) 
              
            }
            
    
            png( file.path( WorkingDir , pngfilename2 ), width = 1920, height = 1080 ) 
            
              ukmcluster  = unique( kmcluster ) 
              cols  = rainbow(  length( ukmcluster ) )
              
              plot( GroupData[ , varCycle ], 
                    col = cols[ factor( kmcluster ) ], 
                    pch = ".",
                    main = "2D clustering of beads" )
              
              points( GroupData0[ ,varCycle ], col = 1 ,pch = 1 ,cex = 0.1 )
          
              Gr = data.frame( GroupData[ ,varCycle ] , cols  =  cols[ kmcluster ],stringsAsFactors = F)
              
              sp = split( Gr , Gr$cols ) 
            
              # lapply(sp, function(x){ 
              #   
              #             selpoints = convex_hull(x[,1:2]) 
              #             points(selpoints[,1], selpoints[,2],type  = "l", col = x[1,3] )
              #   
              #           } )
              
              #browser() #260420
              
              lapply(sp, function(x){ 
                
                ell = getGussainfit( x[,1:2] )
                el = ellipse(ell$mu, ell$sigma , npoints = 50 , alpha= 0.05)
                lines(el , col = x[1,3]   )
                
              } )
              
            dev.off()
            
          }
        }
        
        cal_voltage <- function(  filepath ,Arr1 , Fcsboudary = 5000 ,max_width = 100 )
        {
          ErrorTable = NULL
          
          #min_size = 20  # checkbefor
          plotFontSsize = 2
          
          #const
          dirpath = dirname( filepath )
          
          #setMedian = c( 6748, 9148, 6077, 5283, 2846, 1812, 1079, 1395, 2712, 1002, 820 )
          setMedian = c( 7493, 10055, 6914, 5868, 3064, 1963, 1160, 1570, 3319, 1049, 916 )
          
          number_of_runs = 6 
          
          #functions-----------------
          getTime <- function( fn ){
            
            re = paste0( ( strsplit(fn,"_")[[1]] ) [1:2], sep = "",collapse = "_")
            filetime =  as.POSIXct(re,format="%Y%m%d_%H-%M-%S")[1]
            return( filetime )
            
          }
          
          getV<- function(fin){
            
            #get first line from the file
            rd = readLines(fin,1)[1]
            
            #Get last string as Voltage value
            Volt = strsplit(rd,"_")[[1]]
            Volt = as.numeric( Volt[length(Volt)] )
            
            return(Volt)
            
          }
          #--------------------------
          # bMultiFile = FALSE
          # if ( bMultiFile ){  
          #   
          #   fl = list.files(dirpath,pattern  = "Events.csv",full.names = T)
          #   bn = basename(fl)
          #   fileTimes = sapply(bn , getTime)
          #   
          #   
          # } else {
          
          oneFile = Arr1 
          
          oneFile = oneFile[complete.cases(oneFile),]
          
          startplot = ggplot(oneFile, aes( x = FSC_peak , y  = Width)  ) + geom_point(size = 0.3)
          #ggsave( file = file.path(dirpath , "FSC.png" )  , g1  )
          ggsave( file = file.path( WorkingDir , "startFSC.png" )  , startplot  )
          
          
          #use 6,000,000 for each file
          flag = seq( 1 , 36e+06 , 6e+06 )
          
          #Find split flag use zero line NOT IN USE
          #flag = which( apply( oneFile ,1, function(x) all(as.character(x) == 0) ) )
          
          if( length(flag) > number_of_runs ){
            
            flag = flag[,-length(flag)]
            
          }
          
          #split the file use 0 raw
          #cl  = unlist(sapply(1:dim(oneFile)[1],findInterval,flag )) + 1
          
          
          #split the file use 6e3+06
          cl  = unlist(sapply(oneFile$PeakTime,findInterval,flag ))
          
          
          oneFile$cl <- cl
          
          bfcs = oneFile$FSC_peak > min_fsc
          bMaxWidth = oneFile$Width < max_width
          
          g1 = ggplot(oneFile, aes( x = FSC_peak , y  = Width , col = factor( bfcs ) )  ) + geom_point(size = 0.3)
          #ggsave( file = file.path(dirpath , "FSC.png" )  , g1  )
          ggsave( file = file.path( WorkingDir , "FSC.png" )  , g1  )
          
          oneFile = oneFile[ bfcs & bMaxWidth , ]
          oneFile = oneFile[oneFile$cl <= 6 , ]
          cl = oneFile$cl
          
          oneFile = oneFile[ , paste0("ch",1:11,"_peak") ]
          sp = split( oneFile , cl )
          
          
          if( any( length( sp ) != 6 ) ){
            
            #One of the group is samll
            
            ErrorTable  = rbind( ErrorTable , c( "Error4"  , paste0( "CSV file probelm: Number of Measuremnts ( 6e6 events ) ", length( sp ) )," != 6 " ) )
            
          }
          
          
          #DVSAddition--------------
          
          #check cl size
          #clsize = sapply(sp, function(x){ dim(x)[1] })
          clsize = sapply(sp, function(x){ nrow(x) })
          
          if( any( clsize < min_size ) ){
            
            #One of the group is samll
            
            ErrorTable  = rbind( ErrorTable , c( "Error1"  , paste0( "Low Class Size: One of the class size below min size of ", min_size ) ) )
            
          }
          
          #--------------
          
          #calculate medians
          medians = round(t(sapply(sp,function(x) sapply( x ,median ) ) ) , 0 )
          medians = data.frame(medians) 
          #rownames(medians) <- paste0("run",1:dim(medians)[1])
          rownames(medians) <- paste0("run",1:nrow(medians))
          
          
          #Extracting the runs voltage from the texts files
          fbin  = list.files(dirpath,pattern  = ".bin",full.names = T)
          if(length( fbin) > 6 ){
            
            fz = file.size( fbin )
            wfz = which( fz == min ( fz ) )   
            fbin = fbin[ -wfz ]
            
          } else if( length(fbin) < 6 ){
            
            #One of the the low medians is below set medians
            ErrorTable  = rbind( ErrorTable , c( "Error3", paste0( "Number of bin files : number of bin file  ", length( fbin ) , " < 6 " ) ) )
            
          }
          
          
          generalData = createGenralData( swversion , swversiondate , scriptversion, basename( f ) , scriptdate  )   
          
          
          if( any( c( "Error3","Error4" ) %in% ErrorTable[,1] ) ) {
            
            sink( file.path( dirpath , 'Summary Results.txt' ) )
            
            write.table( ErrorTable , row.names = F , sep  = "\t" , quote=FALSE , col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
            
            
            sink()
            
            sink( file.path( WorkingDir , 'Summary Results.txt' ) )
            
            write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
            
            sink()
            
            sink( file.path( WorkingDir , 'Summary Results.txt' ) )
            
            write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
            cat("\n\n\n")
            write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F ) #zzz #remove
            
            sink()
            
            #stringOut = flatten.dataframe( ErrorTable , TRUE , TRUE )
            
            return(1)
          }
          
          
          ft = gsub(".bin",".txt",fbin)
          #ft = list.files(dirpath,pattern  = ".txt",full.names = T)
          #ft = ft[ !grepl("log.txt", basename(ft)) ] 
          bt = basename(ft)
          fileTimes_t = sapply(bt , getTime)
          bf = !is.na(fileTimes_t)
          fileTimes_t = fileTimes_t[ bf ]
          ft = ft[ bf ]
          ft = ft[ order( fileTimes_t ) ]
          
          da = read.csv(ft[1],header = F,stringsAsFactors = F)
          bMultilines <- ifelse( dim(da)[2] > 10, TRUE , FALSE ) 
          
          Volts = NULL 
          if( bMultilines ){
            
            volcolnames <- paste0("volt.ch",1:11)
            
            for(f in ft ){
              
              da = read.csv(f,header = F,stringsAsFactors = F)
              #da = da[,1:11]
              da = da[2,c( 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 12 , 13 , 14 )]
              
              colnames( da ) <- volcolnames
              
              
              Volts = rbind( Volts , da  )
              
            }
            
            medians = cbind( medians , Volts )
            
          } else {
            
            Volts = unname(sapply(ft,getV  ))
            Volts = Volts[!duplicated(Volts)]
            medians$volts = Volts 
            
          }  
          
          #Calculate the interpolated voltage
          #Create plots
          #Create Summary Results.txt
          
          
          
          
          voltageouts = NULL
          r.squareds  = NULL
          
          
          png( file.path( WorkingDir , "Voltage.png" ) , width = 1920, height = 1080 ) 
          
          par(mfrow = c(3,4),oma = c(0, 0 , 2 , 0 ), mai = c(1, 1, 1, 1) )
          
          vi = length(setMedian) + 1
          
          
          for( i in 1:length(setMedian))
          {
            
            o = order(abs( medians[,i] - setMedian[i] ))
            m = medians[ o,] 
            
            x = m[1:3,i]
            
            voltname <- ifelse( bMultilines ,paste0("volt.ch",i) ,  "volts" ) 
            
            y = m[1:3, voltname ]
            
            if( bMultilines ){
              
              vi = which( colnames(m) %in% paste0("volt.ch",i) )
              
            }
            
            plot(m[ ,c( i , vi ) ] , 
                 pch = 19  , 
                 ylim = c(29,35) ,
                 main = paste0("Ch",i ,"Voltage" ),
                 xlim = range(c( setMedian[i],m[,i]) ),
                 cex.lab  = plotFontSsize ,  
                 cex.axis = plotFontSsize , 
                 cex.main = plotFontSsize , 
                 cex.sub  = plotFontSsize  )
            
            df = data.frame(m[1:3, ] )
            points( df[,c( i , vi )] , pch = 1 ,cex = 2 ,col = 3,lwd =2 ) 
            model = lm(y ~ x )
            r.squared = summary(model)$r.squared
            abline(model, col = 2,lwd = 2,lty = 2)
            voltageout  = predict( model,data.frame(x = setMedian[i]  ) )[1]
            voltageout  = round(voltageout,3)
            voltageouts = c(voltageouts,voltageout)
            r.squareds  = c(r.squareds, r.squared )
            points( setMedian[i] , voltageout ,cex = 2, col  = 2 ,pch = 4,lwd = 3 )
            
          }
          
          mtext("Fit Voltage Plots", outer = TRUE, cex = 1.5)
          
          dev.off()
          
          #Write Summary Results.txt
          Ch_.Voltage  = paste0("Ch",1:11,".Voltage")
          
          Rsq = round(r.squareds , 3 )
          
          RsqAcceptance = ifelse( Rsq > r.squareds.min , "PASS", "FAIL" )
          
          df1 = data.frame( ChannelVoltage  = Ch_.Voltage, Acceptance = RsqAcceptance , Value = voltageouts ,Rsq = Rsq )
          
          #DVSAddition--------------
          b1 = medians[1,1:11] > setMedian
          if( any( b1 ) ) {
            
            #One of the the low medians is below set medians
            w = which( b1 ) 
            
            ErrorTable  = rbind( ErrorTable , c( "Error2", paste0( "MedianBelow: One of the the low medians is below set medians ", Ch_.Voltage[ w ]  ) ) )
            
          }
          
          #-------------------------
          if( as.numeric(reverse_channels) == 0 ){
            
            dfv = df1$Value
            
          } else {
            
            dfv = rev( df1$Value )
            
          }
          
          
          
          for_in_string = data.frame( st1 = "Volt/Ch",st2 = paste( c(dfv[1:8],0,0,0,dfv[9:11],0,0),collapse = ",") )
          #for_in_string  = paste( "Volt/Ch",paste( c(dfv[1:8],0,0,0,dfv[9:11],0,0),collapse = ",") ,collapse = "\t" )
          
          
          if( bMultilines ){
            
            indexArray = NULL
            mediansName =  c( paste0("Ch",1:11) , paste0( "vCh",1:11 ) ) 
            colnames(medians) <- mediansName
            for( i in 1:11){
              
              indexArray = c(indexArray ,i,i+11)
              
            }
            
            medians = medians[ , indexArray ]
            #mediansName = mediansName[ indexArray ]
            #colnames( medians ) <- mediansName
            
          } else {      
            
            colnames( medians )  <-  c( paste0("Ch",1:11) , "Volt" ) 
            
          }
          
          sink( file.path( dirpath , 'Summary Results.txt' ) )
          
          write.table( ErrorTable , row.names = F , sep  = "\t" , quote=FALSE , col.names = F )
          write.table(df1,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          #cat("\n\n\n")
          write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
          cat("\n\n\n")
          write.table(medians,sep  = "\t" , quote=FALSE ,row.names = F )
          cat("\n\n\n" )
          write.table(for_in_string,sep  = "\t" , quote=FALSE ,row.names = F , col.names = F )
          #cat( for_in_string )
          
          sink()
          
          sink( file.path( WorkingDir , 'Summary Results.txt' ) )
          
          write.table(ErrorTable,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          write.table(df1,row.names = F,sep  = "\t",quote=FALSE,col.names = F )
          #cat("\n\n\n")
          write.table( generalData,sep  = "\t" , quote=FALSE ,row.names = F ,col.names = F )
          cat("\n\n\n")
          write.table(medians,sep  = "\t" , quote=FALSE ,row.names = F )
          cat("\n\n\n" )
          write.table(for_in_string,sep  = "\t" , quote=FALSE ,row.names = F , col.names = F )
          #cat( for_in_string )
          
          sink()
          
          
        }
        
       }
  
      start_point <- function( ti , y , coef = 0.5 ,upl = 10 , debugfunction = FALSE )
      { 
        
        
        if( debugfunction == TRUE ){
          
          browser()
          
        }
        
        model = lm( y ~ ti )
        cs  = cumsum( model$residuals > model$coefficients[1] * coef ) > upl
        
        return( ti[ min( which( cs ) ) ] )
        
      }
      
      findBoundary <- function(x , tr , bo = NULL , ty = 2 , n1  = 512) # ty = c("lower",higher ,"twoside")
      {
        
        boundary = NULL
        d <- density(x,n = n1)
        me = max(d$y)
        
        #plot(d$x,d$y,type = "l")
        #abline(v = c(d$x[ boundaries ]))
      
        bFinePeaks = TRUE 
        peaks = findpeaks(d$y/max(d$y), npeaks = 0, threshold= tr ,nups = 10 , ndowns = 10 )
        
        if (is.null( peaks) ){
          
          peaks = findpeaks(d$y/max(d$y), npeaks = 0, threshold= tr ,nups = 4 , ndowns = 4 )  
          
          if (is.null( peaks) ){
            
            bFinePeaks = FALSE 
          }    
            
        } 
          
        if ( bFinePeaks ){
        
          #if(  dim(peaks)[1] > 1 ){
          if(  nrow( peaks ) > 1 ){
            
            #boundaries = round( peaks[2:dim(peaks)[1],3] + peaks[1:( dim(peaks)[1] - 1),4] , 0 ) / 2  
            boundaries = round( peaks[ 2:nrow( peaks ) , 3 ] + peaks[1:( nrow( peaks ) - 1 ) , 4 ] , 0 ) / 2  
            
          } else {
            
            boundaries = peaks[1,c(2,4)]
            
          }
          
          if( length( boundaries ) > 0 )
          {
            di = ( d$x[boundaries] - bo )
            
            if( !is.null( bo ) ){
              
              di = switch(ty , di[ di <= 0 ] , di , di[ di >= 0] )
              w = which( min(di) == di )[1]
              boundary = d$x[boundaries[ w ]]
              
            }
          } else {
            
            if( !is.null( bo ) ){
              
              boundary = bo
            
            }
            
          }  
          
        } else {
          
          print( " Unable to fined peaks!!! " )
          
          if( !is.null( bo ) ){
            
            print( paste0( "Set boundary to intial boundary -> ", bo ) )
            boundary = bo
            
          } else { 
            
            print( " intial boundary is NULL Unable to set boundary !!! " )
            
          }
          
        }
        
        
        return( list( boundary = boundary ,density = d , peakValue = me * peaks[,1], peakLocation = matrix( d$x[ peaks[,c(3,2,4)] ],,3 ) , boundaries = d$x[ boundaries ] ) )  
        
      }
      
      env_find_boundary <- function(x , tr , bo = NULL , ty = 2 , n1 = 512 )
      {
        
        fr = findBoundary( x , tr , bo , ty , n1 )
        print(paste0( "findboudary:boundary -> " ,fr$boundary ) )
        return( fr$boundary )
        
      } 
      
      #DVS main function 
     
      
      preparePlot<- function(dfin,usecol , chaining_cols,xname,yname)
      {
        
        dfin  = dfin[ , usecol ]
        
        #le = dim(dfin)[1]
        le = nrow(dfin)
        
        zc  = dfin[,chaining_cols]
        w = which(colnames(dfin) %in% chaining_cols)
        dfin= dfin[,-w]
        
        cn = colnames(dfin)
        bu = NULL
        for( i in 1:dim(dfin)[2] )
        {
          bu = rbind(bu , cbind(rep(cn[i],le),dfin[,i],zc )  )
        }
        
        colnames(bu) = c(xname,yname , chaining_cols )
        
        return( bu ) 
      }
      
      #check the list of error if there is fatal error
      CheckForFatalError <- function()
      {
        
        lsv = ls(envir = .GlobalEnv)
        lsv = lsv[  lsv %in%  paste0("error",1:100,"_fatal")  ] 
        #lsv %in%  paste0("error",1:100) )
        if(length(lsv ) > 0 )
        {
        
          for(lsi in lsv)
          {
            errorStatus = eval(parse(text = lsi ) )
            
            if( errorStatus )
            {
              
              print( paste0( lsi , " = TRUE " ) )
              break
              
            }
          }
        
          return( list(status = errorStatus, errorType = lsi ) )
          
        }
        
        return( list(status = FALSE, errorType = NULL ) )
        
      }
      
      #Not in use
      writeZeroResults <- function(sf,fileName, DirpathName,bWriteInbaseDir)
      {
        
        inputResults = sf[sf[,1] == "result",]
        
        #write results  
        #if(dim( inputResults )[1] > 0 )
        if( nrow( inputResults ) > 0 )
        { 
          
          resultsOut = NULL
          fnw = which( inputResults[,2] == "filename" )
          FileNameResults = inputResults[fnw ,3]
          FileNameResults = file.path( DirpathName , paste0(FileNameResults,".txt") )
          inputResults = inputResults[-fnw ,]
          
          #for( iin in 2:dim(inputResults)[1] )
          for( iin in 2:nrow( inputResults ) )
            
          {
            if( inputResults[ iin , 2 ] == "error" )     {  
              
              if( exists(inputResults[ iin , 3 ]) )
              {
                bValue = eval( parse( text = inputResults[ iin , 3 ] ) )
                
                if( bValue )  
                {
                  resultsOut = rbind( resultsOut , c( inputResults[ iin , 4 ],inputResults[ iin , 5 ] ) )
                }
              }
              
            } else if( inputResults[ iin , 2 ] == "count" )     {  
              
              resultsOut = rbind( resultsOut , c( inputResults[ iin , 3 ] , as.character( 0.0 ) ) )
              
            } else if (inputResults[ iin , 2 ] == "pre") {
              
              resultsOut = rbind( resultsOut , c( inputResults[ iin , 3 ] , as.character( 0.0 ) ) )
              
            } else if( inputResults[ iin , 2 ] == "" )   {
              
              resultsOut = rbind( resultsOut,c( "","" ) ) 
              
            } else if( inputResults[ iin , 2 ] != ""  ) {
              
              resultsOut = rbind( resultsOut , c(inputResults[ iin , 2 ],as.character( 0.0 ) ) )
              
            } else {
              
              resultsOut = rbind( resultsOut , c(inputResults[ iin , 2 ], as.character( 0.0 ) ) )     
              
            } 
            
          }
          
          
          
          if ( !is.null(resultsOut ) ){
            
            write.table( resultsOut,FileNameResults,quote = FALSE, sep=",",  col.names=FALSE,row.names = F)
            if( bWriteInbaseDir )
            {
              dn = dirname(dirname(FileNameResults))
              bn = basename(FileNameResults)
              fn  = file.path(dn,bn)
              write.table( resultsOut,fn,quote = FALSE, sep="\t",  col.names=FALSE,row.names = F)  
            }
            
            
              return( list(vnames = resultsOut[,1], variables = resultsOut[,2] ,WorkingDir = WorkingDir ) )
            
            
          } else {
            
            debugf("Resultout" , "Empty" , DebugFilePath, DebugLevel , 100 )
            
            return( NULL )
            
          }
          
        }
        
        
      }  
      
      numbers_only <- function(x) !grepl("\\D", x)
      
      input_filter <- function(bVar)
      {
        
        Arr <<- Arr[bVar,]
      
      }
      
      add.alpha <- function(col, alphas= 1 )
      {
        
        if(missing(col))
        {
          stop("Please provide a vector of colours.")
        }
        
        apply( rbind( sapply( col, col2rgb ) / 255,alphas), 2 , 
              function(x) rgb(x[1], x[2], x[3], alpha=(x[4])) )  
      }
    
    # Create Group variable 
    # typeV = mean , std , median 
      group_values <- function(grupName,typeV, DyesType,allv = TRUE ) 
      {
        grupName = deparse( substitute( grupName ) )
        typeV = deparse(substitute(typeV))
        DyesType = deparse(substitute(DyesType))
        
        value_name = paste0(grupName,"_value")
        
        #Create the variable name
        vari = paste0(value_name,".",typeV,"$", DyesType )
        
        #return the group variable value
        return( eval( parse( text = vari ) ) )
        
      }
    
    # Create beads variable 
      beadsValue <- function(DyesType)
      {
        
        vari = paste0( "beadsValue_" , DyesType )
        return( eval( parse( text = vari ) ) )
        
      }
    
      # Filter to remove shade events
      # da data
      # n=5 number of peaks arround current peak 
      # le= 30
      # sl = 0.5 minum ratio between high peak and near peaks
      # minV = 7e3 minimum high peak value
      # Types  = "Dye.1" use channel channel
      FilterShadeFilter <-function(da,n=5,le=30,sl = 0.5,minV = 7e3,Types  = "Dye.1")
      {
        #extract use channel 
        da = da[!is.na(da[,Types]),]
        
        #start index
        st = n+1
        #end index
        #en = dim(da)[1] - (n+1)
        en = nrow(da) - (n+1)
        
        bufindex = NULL
        
        for(i in st:en)
        {
          if(da[i,Types] > minV )
          {
            pt = da$PeakTime[i]
            #create of peaks index arround current peak
            dxi = c((i-n):c(i-1),(i+1):c(i+n))
            
            #peaks time arround current peak
            pts = da$PeakTime[dxi]
            
            #Absult time between current peak and arround peaks that are less than 30
            dxi1 = dxi[abs(pt - pts ) <= le ]
            
            #if there are peaks near current peak
            if(length(dxi1) > 0)
            { 
              #Check the raio between peaks
              s1 = da[dxi1,Types]/da[i,Types] 
              s1 = s1[s1 > 0]
              
              #select peaks indexes with  peaks  ratio less then sl
              dr = dxi1[ s1 < sl ]
              
              if(length(dr) > 0)
              {
                #add to buffer
                bufindex = c(bufindex,dr)
              }
            }
          }
          
        }
        if(is.null(bufindex)){
          
          return(da)
          
        }else{
          
          return(da[-unique(bufindex),])  
        }
        
      }
    
      data_filter <- function(da, bValue )
      {
        
        return( da[ bValue , ] )
      }
    
    
      inrange <-  function(da,variable,lowBoundary ,upBoundary) 
      {
        
        return( ( da[,variable] > lowBoundary )  & ( da[,variable] < upBoundary )  )
        
      }
      
      
      #Get Set of string form Script and try t evaluate them
      calVar <- function( ArrIn , sfVar )
      {
        
        
        assigenment = sfVar[,1]
        assigenmentClass = sfVar[,2]
        le = length(assigenment)
        
        
        if(le > 0)
        {
          
          for( i in 1:le  )
          {
            tryCatchResult = tryCatch( {
              
              #split fromula
              splitequal = (strsplit( assigenment[i] , "=" )[[1]])
              
              bFromClass = assigenmentClass[i] %in% colnames( ArrIn ) 
              
              if( length( splitequal ) > 1 )
              { 
                
                rightSide = paste0(splitequal[2:length(splitequal)],collapse = "=")
                
                #find the a assigned paramters
                assignname = trimws(splitequal[1])
                
                assignnamePrint = assignname
                
                if( bFromClass ){
                  
                  l1 = paste0( "with( ArrIn[ ArrIn$", assigenmentClass[i] ," , ] , " ,rightSide," ) " ) 
                  
                } else {
                  
                  if( is.na ( assigenmentClass[i] ) | assigenmentClass[i] == "" )
                  {
                    l1 = paste0( "with( ArrIn , ",rightSide," ) " )  
                    
                    
                  } else {
                    
                    
                    #Some Error not valid string
                    
                    l1 = "xxxxxxxxxxxxxxxx"
                    
                  }
                }
                
                r1 = eval( parse( text = l1 )) 
                
                assign(assignname , r1 ,envir = .GlobalEnv )
                print( paste0( assignname," -> " , r1 ) )
                
                
              }
          
          
            }, error = function(e) { print(paste0("calVar Function Error " , e ) ) ; 999999 }, finally = 0 ) 
          
            if ( tryCatchResult == 999999 ){
              
              print( paste0( "Unable to assign" , assignnamePrint ) )  
            }
          }
        } 
      }
      
      #calculate variables 
      assignVar <- function( sfVar , ArrIn , varc = NULL   )
      { 
        cvar = sfVar
        assigenment = sfVar[,1]
        assigenmentClass = sfVar[,2]
        le = length( assigenment )
        
        dw = NULL  
        Error  = NULL
        outsfVar = NULL
        Arr1 = NULL
        
        
        if(le > 0)
        {
          
          for( i in 1:le  )
          {
            # If error string is not null stop the loop
            if( !is.null( bGlobalAssignErrorString ) ) 
            {
              splitequal = ( strsplit( assigenment[i - 1] , "=" )[[1]] )
              assignname = trimws(splitequal[1])
              Error = paste0( "assignVar function: " , assignname ," ", bGlobalAssignErrorString )
              #bGlobalQC <<-  1
              
              break;
            }
            
            #Hold the list for function input
            dw = c( dw , i )
            cvar = sfVar[ -dw, ]
            
            if( trimws( assigenment[i] )  == "debug" ){
              
              browser()
              
            } else { 
          
              result = tryCatch( { 
                
                
                #split fromula
                splitequal = (strsplit( assigenment[i] , "=" )[[1]])
                
                bFromClass = assigenmentClass[i] %in% colnames( ArrIn )  
                
                #find equation 
                if( length( splitequal ) > 1 )
                { 
                  
                  rightSide = paste0(splitequal[2:length(splitequal)],collapse = "=")
                
                  #find the a assigned paramters
                  assignname = trimws(splitequal[1])
                  
                  
                  if( bFromClass ){
                     
                    l1 = paste0( "with( ArrIn[ ArrIn$", assigenmentClass[i] ," , ] , " ,rightSide," ) " ) 
                    
                  } else {
                    
                      if( is.na ( assigenmentClass[i] ) | assigenmentClass[i] == "" )
                      {
                        l1 = paste0( "with( ArrIn , ",rightSide," ) " )  
                      
                        
                      } else {
                        
                        
                        #Some Error not valid string
      
                        l1 = "xxxxxxxxxxxxxxxx"
                      
                      }
                  }
                  
                  r1 = eval( parse( text = l1 )) 
                  
                  #if( !is.null(length(r1)) &&  ( length(r1) == dim(ArrIn)[1] ) )
                  if( !is.null(length(r1)) &&  ( length(r1) == nrow(ArrIn) ) )
                  {
                    
                    ArrIn <- cbind( ArrIn ,r1)   
                    cln = colnames(ArrIn)
                    cln[ length( cln ) ] <- assignname
                    colnames(ArrIn) <- cln
                    
                    if( class( ArrIn[ , assignname ] ) == 'logical' )
                    {
                      if( !is.null(varc)  )
                      {
                        #Claculate logical values
                        allMeans =  sapply(ArrIn[ ArrIn[,assignname] , ResultsCycle ], mean   )
                        allSTDs =   sapply(ArrIn[ ArrIn[,assignname] , ResultsCycle ], sd     )
                        allMedian = sapply(ArrIn[ ArrIn[,assignname] , ResultsCycle ], median )
                        
                        value_name = paste0( assignname ,"_value")
                        
                        allCount = sum( ArrIn[ , assignname ] )
                        assign(paste0(value_name,".mean")  , data.frame( t( allMeans  ) ), envir = .GlobalEnv  )
                        assign(paste0(value_name,".std")   , data.frame( t( allSTDs   ) ), envir = .GlobalEnv  )
                        assign(paste0(value_name,".median"), data.frame( t( allMedian ) ), envir = .GlobalEnv  )
                        assign(paste0(value_name,".count") , data.frame(    allCount    ), envir = .GlobalEnv  )
                        
                      }
                      
                      
                      
                    }
                    
                  } else {
                    
                    assign(assignname , r1 ,envir = .GlobalEnv )
                    print( paste0( assignname," -> " , r1 ) )
                    
                    
                  }
                  
                } else {
                  
                  
                  l1 = paste0( "with( ArrIn , ",assigenment[i]," ) " )
                  
                  eval(parse( text = l1) )
                  
                  print( paste0( assigenment[i]," -> Arr" ) )
                 
                }
                
                # if( !is.null( bGlobalAssignErrorString ) ){
                #   
                #   if(!is.null( ArrIn ) ){
                #     
                #     #browser() # 210420
                #     
                #     if( nrow( ArrIn ) == 0 ){
                #       
                #       bGlobalAssignErrorString = "Number data rows 0"
                #       
                #     }
                #     
                #   }
                #   
                #  }
                
               },error = function(e) {999999}, finally = 0 )
              
              if( !is.null( result[1] )  && !is.na( result[1] ) )
              {
                if( result[1] == 999999 )
                {
                  
                  Error = c( Error , assigenment[i] )
                  outsfVar = rbind( outsfVar , sfVar[ i , ] )
                  
                } 
                  
              }
              
            }
            
          } 
          
        }
        
        return( list( ArrOut = ArrIn , VarOut  =  outsfVar , Error = Error ) ) 
        
      }
    
      # Data tranformation log  
      logx <- function(x)
      {
        
        log(x +sqrt(x^2 + 1000))
        
      }
      
      rsd <- function(dax)
      {
        
        median( abs( dax - median( dax ) ) )  * 1.4826
  
      }
      
      #balance data if there is small classes
      balanceSample <- function(da,sa,br,ty1)
      {
        
        
        ratio = sum(da[,ty1])/length(da[,ty1])
        
        if( ratio == 1 ){
          
          #wTs = sample(dim(da)[1],sa)
          wTs = sample( nrow(da) , sa )
          wFs = NULL
          
          
        } else if ( ratio == 0 ){
          
          #wFs = sample(dim(da)[1],sa)
          wFs = sample( nrow(da) , sa )
          wTs = NULL
          
        } else if( ratio > br ) {
          
          saTrue = br * sa  
          wT = which( da[,ty1] == TRUE )
          wTs = sample(wT,saTrue,replace = T)
          wF = which( da[,ty1] != TRUE )
          wFs = sample(wF,sa  - saTrue,replace = T)
          
        } else if ( ratio < ( 1 - br) ) {
          
          saTrue = ( 1 - br  )  * sa  
          wT = which( da[,ty1] == TRUE )
          wTs = sample(wT,saTrue,replace = T)
          wF = which( da[,ty1] != TRUE )
          wFs = sample(wF,sa  - saTrue,replace = T)
          
        } else {
          
          #wTs = sample(dim(da)[1],sa,replace = T)
          wTs = sample( nrow(da) , sa , replace = T )
          wFs = NULL
          
          
        }
        
        return( c( wTs, wFs ) )
        
      
      }
      
      # use kmean method for clustering
      clustering <- function(cls, ArrIn, groupName , dirPath )
      {
        bFatalError = FALSE
        
        le = length( cls )
        
        #check if there is Cluster for beads
        if( le > 0 )
        {
          
          wvar  = which(cls[,3] == "var")
          
          wdata  = which(cls[,3] == "data")
          daType = cls[wdata,4]
          
          wpost  = which(cls[,3] == "post")
          post = cls[wpost,4]
          
          varCycle = cls[ wvar , ]
          
          #if( dim(varCycle)[1] == 0 ){
          if( nrow(varCycle) == 0 ){
            
            #Error No Variables are defined
            
          }
          
          wnum = which(numbers_only(cls[,3]))
          
          #variables use by the cycle for clustering
          varCycle =  varCycle[ !is.na( varCycle ) ]
          varCycle =  varCycle[ varCycle != "" ]
          varCycle =  varCycle[ 4:length( varCycle ) ]
          print("varCycle")
          print(varCycle)
          
          #variables use by the cycle to calculate results
          wresult  = which(cls[,3] == "results")
          ResultsCycle = cls[ wresult,]
          ResultsCycle =  ResultsCycle[ !is.na( ResultsCycle ) ]
          ResultsCycle =  ResultsCycle[ ResultsCycle != "" ]
          ResultsCycle =  ResultsCycle[ 4:length( ResultsCycle ) ]
          ResultsCycle = trimws(ResultsCycle)
          print("ResultsCycle")
          print(ResultsCycle)
          
          #Remove used and unrelvant commands from the the list 
          cls = cls[ -c(wvar,wdata,wnum, wresult, wpost ) , ]
   
          #Claculate new Variables
          cls = assignVar(cls[,3:4], ArrIn , ResultsCycle ) 
          ArrIn = cls$ArrOut
          logic = cls$VarOut
        }
        
        # Filter the data that will be used by the current clustring
        if(!is.null( daType ) && ( nchar(trimws(daType)) > 0 ) ) 
        {
         
          
          #Compose string for evaluation use logic in the data array
          formulaString = paste0( "with( ArrIn , ", daType ," ) " )
          
          GroupIndex = which( eval( parse( text = formulaString ) ) )
          
          #ArrIn$temp <- rep(0,dim(ArrIn)[1])
          ArrIn$temp <- rep( 0 , nrow( ArrIn ) )
          ArrIn$temp[GroupIndex] <- GroupIndex
            
          cln <- colnames(ArrIn)
          cln[length(cln)] <- paste0(groupName,"_index")
          colnames(ArrIn) <- cln
          GroupData <- ArrIn[ GroupIndex , ]
          
          #use all data
        } else {
          
          #Error Missing data definition
          GroupData = ArrIn
          
          #GroupIndex = 1:dim(ArrIn)[1]
          GroupIndex = 1:nrow( ArrIn )
          
        }
        
        
        logicPost = NULL
        
        #if icycle is 1 use for only kmeans classifcation for QC
        if( icycle > 1 )
        {
          
          if (TRUE) #(length( varCycle ) > 1 )
          {
            
            si = dim( GroupData )[ 1 ]
            useSampleSize  = min( round(si/3) ,  samplesize )
            fc = si / useSampleSize
            
            cycleList = NULL
            busam = NULL
            
            rm(list = ls()[ grepl( "bu_",  ls() ) ] )
            rm(list = ls()[ grepl( "re_",  ls() ) ] )
            rm(list = ls()[ grepl( "mean_",ls() ) ] )
            
            logicMean = logic[grep(".mean",logic[,1]),]
            logicPost = logic[!grepl(".mean",logic[,1]),]
            
            for( i in 1:icycle )
            {
              # prepare sampling and clusetering
              sam = sample( dim(GroupData)[ 1 ], useSampleSize )
              busam  = rbind( busam , sam )
              
              #prepare the samples if GroupData
              clusterArr_sam  =  data.frame( GroupData[ sam , ] )
              colnames( clusterArr_sam )  =  colnames( GroupData )
              
              
              #not enough points
              unbleToPerformKmeans =  TRUE 
              
              #preform kmeans classification
              if ( length( varCycle ) > 1 ) {
                
                #bFatalError =  dim(clusterArr_sam)[1] <  clusternum
                bFatalError =  nrow( clusterArr_sam ) <  clusternum
                
                if(  bFatalError ){
                  
                  #paste0("Unble to perform kmeans !!!! number of row = ", dim(clusterArr_sam)[1] )
                  paste0("Unble to perform kmeans !!!! number of row = ", nrow( clusterArr_sam ) )
                  
                  return(list(ArrOut = NULL, logic = NULL , Error = NULL ,fatalError = bFatalError ) )
          
                }
                
                km =   kmeans( clusterArr_sam[ , varCycle ], clusternum , iter.max = 50, nstart = 6 )
                kmc =  data.frame( km$centers )
                kmc =  data.frame(kmc[km$cluster,]) 
                  
                
              } else {
                
                #add Dumy Column
                clusterArr_sam2 =  clusterArr_sam[ , rep( varCycle ,2)  ]
                colnames( clusterArr_sam2 )  <- c( varCycle , "Dumy" )
                #km =   kmeans( clusterArr_sam2 , clusternum , iter.max = 50, nstart = 6 )
                #kmc =  data.frame( km$centers[,1] )
                #kmc =  data.frame(kmc[km$cluster,]) 
              
                km = Mclust( clusterArr_sam[ , varCycle ] , G  = c( 2 , 3 ) , model = "V" )
                kmc =  km$parameters$mean 
                
                wmin = which( min(kmc) == kmc )
                wmax = which( max(kmc) == kmc )
                me =  kmc[ c( wmin , wmax ) ] 
                clnums = as.numeric( names( km$parameters$mean )[ c( wmin, wmax  ) ] )
                dat = data.frame(dc = clusterArr_sam[ , varCycle ] ,cl  = km$classification )
                dat = meansBrimCluster(dat, me , clnums )
                kmc =  data.frame( tempName = kmc[ dat$cl ]) 
                
              }
              
              #build mean columns 
              cn <-  paste0( varCycle , ".mean" )
              colnames(kmc) <- cn   
              
              #Add the mean columns
              for(k in cn ){
                
                clusterArr_sam  = cbind( clusterArr_sam , kmc[,k]  )
                cnn = colnames(clusterArr_sam)
                cnn[length(cnn)] <- k
                colnames( clusterArr_sam ) <- cnn
                
              }
              
              for(l in logicMean[,1])
              { 
                
                #split fromula
                splitequal = (strsplit( l , "=" )[[1]])
                
                #find equetion 
                rightSide = paste0(splitequal[2:length(splitequal)],collapse = "=")
                
                #find the a assigned paramters
                assignname = trimws(splitequal[1])
                
                #Create buffer name
                assigncountBufferName   = paste0("bu_",assignname)
                assignResulltBufferName = paste0("re_",assignname)
                assignMeanBufferName    = paste0( "mean_",assignname)
                
                #prepare string for evaluation logic in the data array
                l1 = paste0( assignname , " = with( clusterArr_sam , ",rightSide," ) " )
                re <- eval( parse( text = l1  ) )
                
                # assignname to assignname list     
                if( !(assignname %in% cycleList ) ){
                  
                  cycleList = c(cycleList , assignname ) 
                  
                }
                
                #check if logic array
                if(  ( class(re) == "logical" )   & ( length(re) == useSampleSize ) )
                {
                  
                  v = sum( re )
                  
                  if( v == 0 ) {
                    
                    
                    rightSide_no_mean = gsub(".mean","",rightSide )
                    l1 = paste0( assignname , " = with( clusterArr_sam , ", rightSide," ) " )
                    re <- eval( parse( text = l1  ) )
                    v = sum( re )
                    
                  }
                  
                  
                  
                  #insert to buffer
                  if(assigncountBufferName %in% ls() ){
                    
                    #first time
                    assign( assigncountBufferName ,   c( eval( parse( text = assigncountBufferName   ) ) , v ) )
                    assign( assignResulltBufferName , rbind( eval( parse( text = assignResulltBufferName ) ) , re ) )
                    assign( assignMeanBufferName ,    rbind( eval( parse( text = assignMeanBufferName ) ),
                                                             sapply(clusterArr_sam[re,ResultsCycle],mean,na.rm = T) ) )
                    
                  } else {
                    
                    assign( assigncountBufferName   , v )
                    assign( assignResulltBufferName , re )
                    assign( assignMeanBufferName , sapply(clusterArr_sam[re,ResultsCycle],mean,na.rm = T ) )
        
                  }
                }
              
              }
            }
          
            zeroResult = data.frame(matrix(rep(0,length(ResultsCycle)),1,length(ResultsCycle)))
            colnames( zeroResult ) <- ResultsCycle
            
            #Find classification for all the cluster group
            for( cy in cycleList)
            {
              
              print(paste0( "State " , cy ) )
              #define Names
              mean_name =   paste0( "mean_",cy)
              result_name = paste0( "re_",  cy)
              count_name =  paste0( "bu_",  cy)
              value_name =  paste0( cy,"_value")
              
              #all means  of cluster of specific class  
              tryCatchR  <- tryCatch( {
                
                #print("bur: " , dim(mean_name)[1] )
                bur = data.frame( eval( parse( text = mean_name ) ) )
                print( paste0( "bur ", dim(bur) ) )
                
                bur.mean    = sapply( bur , mean   , na.rm = T )
                print("bur: mean" )
                bur.std     = sapply( bur , sd     , na.rm = T )
                print("bur: sd" )
                bur.median  = sapply( bur , median , na.rm = T ) 
                print("bur: median" )
                
                assign( paste0( value_name,".hist.mean.mean"  ) , data.frame(t(bur.mean))  , envir = .GlobalEnv )
                assign( paste0( value_name,".hist.mean.std"   ) , data.frame(t(bur.std))   , envir = .GlobalEnv )
                assign( paste0( value_name,".hist.mean.median") , data.frame(t(bur.median)), envir = .GlobalEnv )
                print("bur: assign" )
                
              }, error = function(e) { print (e) ; 999999 }, finally = 0 )
              
              if( tryCatchR == 999999 ){
                
                print( "Error: unable to eval bur" )
                
              }
              
              
              tryCatchR  <- tryCatch( {
                
                count0 = eval( parse(text = count_name ) ) 
                
              }, error = function(e) { print (e) ; 999999 }, finally = 0 )
              
              if( tryCatchR != 999999 ){
                
                assign( paste0( value_name,".hist.count.mean"  ) , round( fc * mean(   count0 ) , 0 ) , envir = .GlobalEnv )
                assign( paste0( value_name,".hist.count.std"   ) , round( fc * sd(     count0 ) , 0 ) , envir = .GlobalEnv )
                assign( paste0( value_name,".hist.count.median") , round( fc * median( count0 ) , 0 ) , envir = .GlobalEnv )
                
              } else {
                
                print( "Error: unable to eval count0" )
                
              }
         
              print( "Hold Data !" )
              
              #select the most probably events
              if(!is.null( count0 ) &&  !is.na( count0 ) &&  !is.infinite( count0 ) && length( count0 ) > 0 && any( count0 != 0 ) )
              {
                  print("Valid count0 ")
                
                  rei = eval( parse( text = result_name ))
                  
                  #count = median( count0 )
                  count = median( count0[count0 != 0] )
                  
                  print( paste0( "Valid count0 count ", count ) ) 
                  diffre = abs(count0 - count )
                  
                  # Find the median case     
                  w = which(min(diffre) == diffre )[1]
                  rew = rei[w,]
                  
                  assign(paste0(value_name,".select.count"),round( fc * sum(rew) , 0  ) )
                  selectsample = GroupIndex[busam[w,]]
                  #selectsample = GroupIndex[sam] # remove
                  means = sapply(Arr[selectsample[rew],ResultsCycle],mean,na.rm = T )
                  assign(paste0(value_name,".select.mean"),means,envir = .GlobalEnv)
                  medians = sapply(Arr[selectsample[rew],ResultsCycle],median,na.rm = T )
                  assign(paste0(value_name,".select.median"),medians, envir = .GlobalEnv )
                  stds = sapply(Arr[selectsample[rew],ResultsCycle],sd,na.rm = T )
                  assign(paste0(value_name,".select.stds"),stds, envir = .GlobalEnv )
                  assign(paste0(value_name,".select"),selectsample , envir = .GlobalEnv )
                  
                  #Find range arround median for global model
                  sd_count0 = max(0.01 * sd(count0),min(abs(count - count0)))
                  selCases = (  ( count - sd_count0 ) <=  count0 ) &
                                ( count0 <= ( count +  sd_count0  ) 
                             ) 
                  
                  #Check that there are selected cases
                  if( sum(selCases) == 0 ){
                    
                    print( "selCases == 0 "  ) 
                    
                    sd_count0 = max(0.1 * sd(count0),min(abs(count - count0)))
                    selCases = (  ( count - sd_count0 ) <=  count0 ) &
                      ( count0 <= ( count +  sd_count0  ) 
                      ) 
                  }
                  
                  re = as.vector( rei[selCases , ] )
                  buSel = GroupIndex[as.vector( busam[selCases,] )]
                  df  = data.frame( cbind( buSel ,Arr[ buSel, ] ,re ) )
                  df = df[!duplicated( df$buSel ), ]
                  df = df[,c(varCycle,"re")]
                  
                  dfall = GroupData[,varCycle]
                  dfall = data.frame( dfall )
                  colnames( dfall ) <- varCycle
                  
                  if( length( varCycle ) > 1 )
                  {
                    print( "length( varCycle ) > 1" )
                    ratiore = sum(df$re)/length(df$re)
                    
                    #Check ratiore is valid
                    if( !is.nan( ratiore ) && ( 0 < ratiore ) & ( 1 > ratiore ) )
                    {
                      print( "valid ratiore " )
                      
                      #dfdim = dim(df)[1]
                      dfdim = nrow( df )
                      
                      SampleModelSize = min( 5000, dfdim )
                      
                      #blanance classes use for a samll clases
                      breIndex  <- balanceSample(df, SampleModelSize , 0.8 , "re" )
                      df = df[breIndex, ]
                      
                      #le = dim(df)[1]
                      le = nrow( df )
                      
                      trainIndex = sample(le,0.7*le)
                      train = df[ trainIndex, ]
                      test =  df[-trainIndex, ]
                      
                      #Use SVM model to fined all data
                      pro  = table(train$re)/length(train$re)
                      
                      ratioretrain = sum(train$re) / length(train$re)
                      
                      print(paste0( "Start ratiore - ", round(ratiore,3) ," end train ratio - ", round( ratioretrain ,3 ) ) ) 
                      
                      if( ( 0 < ratioretrain ) & ( 1 > ratioretrain ) ){
                        
                        print( paste("pre svm ratio re train - ", round( ratioretrain , 3 ) ) ) 
                        
                        cn_train = colnames(train)
                        cn_train = cn_train[ !(cn_train %in% c("re")) ]
                        
                        svm_model <- svm(re ~ . , train, type='nu-classification',nu = c( 0.001, 0.01 , 0.1, 0.2 , 0.5 , 0.7 , 0.9 , 0.99 , 0.999 ) ,scale=TRUE ,class.weights = 1/pro )
                        
                        train_cn_train = train[, cn_train ]
                        train_cn_train = data.frame( train_cn_train )
                        colnames( train_cn_train ) = cn_train
                        trainResults = predict( svm_model, train_cn_train )
                        taTrain = table(trainResults,train$re)
                        TrainPrecisionResult = sum( diag( taTrain ) ) / length(train$re)
                        print(paste0(cy , " - Train precision = ", round( 100 * TrainPrecisionResult , 2 ) ) )  #remove
                        
                        cn_test = colnames(test)
                        cn_test = cn_test[ !(cn_test %in% c("re")) ]
                        test_cn_test = data.frame(test[, cn_test ])
                        colnames( test_cn_test ) = cn_test
                        
                        testResults = predict(svm_model,test_cn_test )
                        ta = table(testResults,test$re)
                        testPrecisionResult = sum( diag( ta ) ) / length(test$re)
                        print(paste0(cy , " - test precision = ", round( 100 * testPrecisionResult , 2 ) ) )  #remove
                      
                      } else {
                        
                        print(paste0(cy , " - train ratio =  ", ratioretrain ) ) #remove
                        
                      }
                      
                    } else { 
                      
                      print(paste0(cy , " - train ratio =  ", ratiore ) ) #remove
                      
                    }
                    
                    #svmModel = svm( re ~ . , data = df,kernel = "linear" ,cost =0.9 , type = "C-classification" )
                    #glmModel = glm(re ~ .,data = df,family = "binomial")
                    #preglm = predict(mg , dfall,type="response") > 0.5
                    
                   
                    #Predict Model
                    if( ratiore == 1 )
                    {
                      #pre <- rep(FALSE,dim( ArrIn )[1] )
                      pre <- rep( FALSE , nrow( ArrIn ) )
                      
                      #pre[ GroupIndex ] <- rep( TRUE , dim(dfall)[1] )
                      pre[ GroupIndex ] <- rep( TRUE , nrow( dfall ) )
                      # ArrIn = cbind(ArrIn,pre)
                      # colnames(ArrIn)[dim( ArrIn )[2]] = cy
                      
                      
                    } else if( ratiore == 0 ) {
                    
                      #pre <- rep( FALSE , dim(ArrIn)[1] )
                      pre <- rep( FALSE , nrow( ArrIn ) )
                      
                    }  else {
                      
                      #pre <- rep(FALSE,dim( ArrIn )[1] )
                      pre <- rep(FALSE,nrow( ArrIn ) )
                      
                      
                      # if the classes were fliped flip tham again 
                      if( TrainPrecisionResult < 0.5 ){
                        
                        st  = "FALSE"
                        
                      } else {
                        
                        st = "TRUE"
                        
                      }
                      
                      pre[ GroupIndex ] <-  as.character(unname(predict(svm_model , dfall)))  == st
                      print(paste0(cy , " - post svm percentages re = ", round(100 * sum(pre)/length(GroupIndex),2 ) ) )  #remove
        
                    }
                    
                  } else { #D = 1
                    
                    ratio = sum( df$re ) / length( df$re )
                    
                    
                    if( !is.nan( ratio ) ) 
                    {
                    
                      #only one group
                      bOnlyOne = ( ( ratio == 1 ) | ( ratio == 0 ) )
                      
                      #Not one group
                      if(!bOnlyOne ) #( !bOnlyOne )
                      { 
                      
                        sp = split(df[,varCycle],df$re)
                        trueNum = which( names(sp) %in% "TRUE" )
                        falseNum = which( names(sp) %in% "FALSE" )
                        spmeans = sapply(sp,mean)
                      
                        if( length( spmeans ) > 1 ){
                          
                          bTrueIsUp =  spmeans[ trueNum ]   >  spmeans[ 3 - trueNum ]   
                          
                        } else {
                          
                          if( length( trueNum ) > 0 ) {
                          
                            bTrueIsUp =  TRUE
                            
                          } else {
                            
                            bTrueIsUp =  FALSE
                            
                          }
                          
                        }
                        
                        STDs = unlist( lapply( sp,sd ) )
                        means = unlist( lapply( sp,mean ) )
                        
                        means  = means[ order(means) ] 
                        boundary1 = findMinBetweenMaxs(   dfall[,1] ,  means )
                        
                        
                        if( bTrueIsUp ){
                          
                          
                          if( ( length(means) > 1 ) & FALSE  ){
                            
                            leRatio  = length( sp[[ falseNum ]] ) / length( sp[[ trueNum ]] ) 
                            
                            
                            Truebaundary =  quantile( sp[[ trueNum ]] ,  0.01 ) #means[ trueNum  ] - 2 * STDs[ trueNum  ]
                            Falsebaundary = means[ falseNum ] + 2.5 * STDs[ falseNum ]
                            
                            
                            if(  ( Truebaundary < Falsebaundary )  | TRUE ) #remove 
                            {
                              if( leRatio > 0.2 ){
                                
                                boundary1  = means[ falseNum ] + 3 * STDs[ falseNum ]
                                
                              } else if ( leRatio > 0.1 ){
                                
                                boundary1  = means[ falseNum ] + 2.5 * STDs[ falseNum ]
                                
                              } else  {
                                
                                boundary1  = quantile(sp[[ trueNum ]], 0.02 )
                                 
                              }
                              #
                              
                            } else {
                              
                              boundary1  = quantile(sp[[ trueNum ]], 0.02 )
                              
                            }
                          }
                          
                                            
                          pre0 = dfall[,1] > boundary1
                          paste0("Up Cluster low bound " , boundary1 )
                          
                        } else {
  
                                              
                          if( ( length(means) > 1 )   & FALSE ){
                          
                            leRatio = length( sp[[ falseNum ]] ) / length( sp[[ trueNum ]] ) > 0.1
                            
                            Truebaundary =  quantile( sp[[ trueNum ]] ,  0.99 ) 
                            Falsebaundary = means[ falseNum ] - 2.5 * STDs[ falseNum ]
                            
                            if(  Truebaundary > Falsebaundary  | TRUE ) #remove
                            {
                              if( leRatio > 0.2 ){
                                
                                boundary1  =  Falsebaundary = means[ falseNum ] - 3 * STDs[ falseNum ]
                              
                              } else if ( leRatio > 0.1 ) {
                                
                                boundary1  =  Falsebaundary = means[ falseNum ] - 2.5 * STDs[ falseNum ]
                                
                              } else {
                                
                                boundary1  = quantile(sp[[ trueNum ]], 0.99 )
                                
                              } 
                              
                            } else {
                              
                              boundary1  = quantile(sp[[ trueNum ]], 0.99 )
                              
                            }
                          
                          }
                          
                          pre0 = dfall[,1] < boundary1
                          paste0("Down Cluster high bound " , boundary1 )
  
                        }
                        
                        # m = Mclust(dfall, G = 2,model = "V")
                        # spm = split(dfall, m$classification )
                        # 
                        # mp = m$parameters$mean
                        # gnum = as.numeric(names(m$parameters$mean))
                        # 
                        # if( bTrueIsUp  ){
                        #   
                        #   mmaxg = ifelse(diff(mp) > 0 ,gnum[2], gnum[1])  
                        #   
                        # } else {
                        #   
                        #   
                        #   mmaxg = ifelse( diff(mp) < 0 ,gnum[2], gnum[1] )  
                        #   
                        # }
          
                        # pre <- rep(FALSE,dim( ArrIn )[1] )
                        # pre[ GroupIndex ] = m$classification == mmaxg
                        
                        #pre <- rep(FALSE,dim( ArrIn )[1] )
                        pre <- rep( FALSE , nrow( ArrIn ) )
                        
                        pre[ GroupIndex ] = pre0
                        
                        #pre <- rep(FALSE,dim( ArrIn )[1] ) REMOVE
                        #pre[ GroupIndex ] = pre0
                        
                      } else {
                        
                        #pre <- rep(FALSE,dim( ArrIn )[1] )
                        pre <- rep( FALSE, nrow( ArrIn ) )
                        pre[ GroupIndex ] = ratio == 1
                        
                      }
                    } else { # ratio is NaN
                      
                      #pre <- rep(FALSE,dim( ArrIn )[1] )
                      pre <- rep(FALSE,nrow( ArrIn ) )
                      
                    }
                    
                    # m = Mclust(dfall, G = 2,model = "V")
                    # pre <- rep(FALSE,dim( ArrIn )[1] )
                    # pre[ GroupIndex ] = m$classification == 1
                    
                  }
                
                  #Add column cy
                  ArrIn = cbind(ArrIn,pre)
                  colnames(ArrIn)[dim( ArrIn )[2]] = cy
                  
                  #assign Values
                  allMeans =  sapply(Arr[ pre , ResultsCycle ], mean   )
                  allSTDs =   sapply(Arr[ pre , ResultsCycle ], sd     )
                  allMedian = sapply(Arr[ pre , ResultsCycle ], median )
                  
                  
                  allCount = sum( pre )
                  assign(paste0(value_name,".mean")  , data.frame( t( allMeans  ) ), envir = .GlobalEnv  )
                  assign(paste0(value_name,".std")   , data.frame( t( allSTDs   ) ), envir = .GlobalEnv  )
                  assign(paste0(value_name,".median"), data.frame( t( allMedian ) ), envir = .GlobalEnv  )
                  assign(paste0(value_name,".count") , data.frame(    allCount    ), envir = .GlobalEnv  )
                  
                  #use with more than one model
                  # if( length(varCycle) >  1){
                  # 
                  #   svmModel = svm(re ~ . , data = df , kernel = "linear", cost = 0.1 ,scale =FALSE )
                  #   
                  #   
                  # } else {
                  # 
                  #   
                  #   glmModel = glm(re ~ . , family = binomial(link = "logit"), 
                  #                  data = df )
                  #   
                  #   dfall = data.frame(Arr[,varCycle])
                  #   colnames(dfall) <- varCycle
                  #   predict <- predict(rModel,dfall, type = "response" ) 
                  
                
              } else {
                
                #Add column in no counts
                #Arr[,cy] <- rep( FALSE , dim(Arr)[1] ) 
                Arr[,cy] <- rep( FALSE , nrow( Arr ) ) 
                count = 0 
                assign(paste0(value_name,".mean")  , data.frame( zeroResult ), envir = .GlobalEnv  )
                assign(paste0(value_name,".std")   , data.frame( zeroResult ), envir = .GlobalEnv  )
                assign(paste0(value_name,".median"), data.frame( zeroResult ), envir = .GlobalEnv  )
                assign(paste0(value_name,".count") , data.frame( zeroResult ), envir = .GlobalEnv  )
                print(paste0(cy, " is Zero !" ) ) 
                
              }
                
                assign( paste0( value_name , ".count" ) , count , envir = .GlobalEnv )
                
              }
          
            
          } else { 
            
            # dfall = GroupData[,varCycle]  
            # m = Mclust(dfall, G = 2,model = "V")
            # 
            # emc = split(dfall, m$classification )
            # mp = m$parameters$mean
            # gnum = as.numeric(names(m$parameters$mean))
            # 
            # cn <-  paste0( varCycle , ".mean" )
            # colnames(kmc) <- cn   
            # 
            # for(k in cn ){
            #   
            #   clusterArr_sam  = cbind( clusterArr_sam , kmc[,k]  )
            #   cnn = colnames(clusterArr_sam)
            #   cnn[length(cnn)] <- k
            #   colnames( clusterArr_sam ) <- cnn
            #   
            # }
            
          }   
          
        } else {
          
          #qc_function(ArrIn )
          print( "In clustring cycle is less than 1 !!!! " )
          
        }  
          
        # Run post step variable calculation 
        if( !is.null( logicPost ) ) {
          
          post = assignVar(logicPost, ArrIn , ResultsCycle )
          
        } else {
          
          post = NULL
          
        }
        
        if( !is.null( post$Error ) ) 
        {
          
          
          # Error 
          # Post with Error 
        
        } 
        
        return(list(ArrOut = post$ArrOut, logic = post$VarOut , Error = post$Error ,fatalError = bFatalError) )
          
      }
      
      Elm <- function( da  , n ,cl )
      {
        fe = dim(da)[2]
        h  = matrix( runif( fe * n ), fe , n )
        b = -runif(n)
        H = sigmoid(da %*% h + b)
        B =   ginv(H) %*% cl
        return(B = B , h = h , b = b )
      }
      
      Elm.predict <- function( elm , da )
      {
        
        H = sigmoid(da %*% elm$h + elm$b)
        
        return( H %*% elm$B )
        
      }
      
      convex_hull <- function(Points)
      {
        #Points = p
        #Computes the convex hull of a set of 2D points.
        
        #Input: an iterable sequence of (x, y) pairs representing the points.
        #Output: a list of vertices of the convex hull in counter-clockwise order,
        #starting from the vertex with the lexicographically smallest coordinates.
        #Implements Andrew's monotone chain algorithm. O(n log n) complexity.
        
        # Sort the points lexicographically (tuples are compared lexicographically).
        # Remove duplicates to detect the case we have just one unique point.
        leOrder <- function(m)
        {
          m1= m[order(m[,1]),]
          m2 = split(m1[,2],m1[,1])
          m2o = lapply(m2,function(x){x[order(x)]})
          v = NULL
          for(mx in m2o)
          {
            v = c(v,mx)
          }
          return(cbind(m1[,1],v))  
        }
        
        
        cross <-function(o,a,b)
        {
          return( (a[1] - o[1]) * (b[2] - o[2]) - (a[2] - o[2]) * (b[1] - o[1]) )
        }
        
        
        Points = leOrder(Points)
        
        # Boring case: no points or a single point, possibly repeated multiple times.
        if( length(as.vector(Points)) <= 2)
          return(Points)
        
        
        # 2D cross product of OA and OB vectors, i.e. z-component of their 3D cross product.
        # Returns a positive value, if OAB makes a counter-clockwise turn,
        # negative for clockwise turn, and zero if the points are collinear.
        
        # Build lower hull 
        lower = NULL
        lower = Points[1,]
        lower = rbind(lower, Points[2,])
        
        #for(i in 1:dim(Points)[1])
        for(i in 1:nrow( Points ) )
        {
          #while( ( dim(lower)[1] > 2 ) && cross(lower[dim(lower)[1] - 1,], lower[dim(lower)[1],], Points[i,]) <=0 )
          while( ( nrow( lower ) > 2 ) && cross(lower[ nrow( lower ) - 1 ,], lower[ nrow( lower ) , ], Points[i,]) <=0 )
          {
            #lower = lower[-dim(lower)[1],]
            lower = lower[ -nrow( lower ) , ]
            if(length(as.vector(lower)) == 2)
            {
              lower = matrix(as.vector(lower),1,2)
            }
          }
          
          lower= rbind(lower,Points[i,])
        }
        
        #Pointsr = Points[dim(Points)[1]:1,]
        Pointsr = Points[ nrow( Points ):1,]
        
        
        upper = NULL
        upper = Pointsr[2,]
        upper = rbind(upper, Pointsr[1,])
        
        #for(i in 1:dim(Pointsr)[1])
        for( i in 1:nrow( Pointsr ) )
        {
          #while( ( dim(upper)[1] > 2 ) && cross(upper[dim(upper)[1] - 1,], upper[dim(upper)[1],], Pointsr[i,]) <=0 )
          while( ( nrow( upper ) > 2 ) && cross(upper[ nrow( upper ) - 1 , ], upper[ nrow( upper ) , ], Pointsr[i,]) <=0 )
          {
            #upper = upper[-dim(upper)[1],]
            upper = upper[ -nrow( upper ) , ]
            
            if( length( as.vector(upper) )  == 2 )
            {
              apper = matrix(as.vector(upper),1,2)
            }
            
          }
          
          upper= rbind(upper,Pointsr[i,])
        }
        
        # Concatenation of the lower and upper hulls gives the convex hull.
        # Last point of each list is omitted because it is repeated at the beginning of the other list. 
        return( rbind( lower, upper ))
      }
      
    }  
    
    
    #Read File
    dirPath    = dirname( finput )
    dirf       = basename( finput )
    cartNum    = getCartNum(dirf)
    
    cN = cartNum
    
    #create results dir
    if( is.na( cartNum ) ){
      
      cN = gsub(".csv","",gsub(" ","_",gsub("-","_",basename( finput )))) 
      
    } 
    
    #Create Work dir
    WorkingDir = paste0(gsub(" ","_",gsub("-","_",gsub(":","_", Sys.time()))),"_",cN,collapse = "_")
    
    WorkingDir = file.path( dirPath , WorkingDir )
    
    efilepath = file.path( WorkingDir , 'Summary Results.txt' )
    
    #create Result if not exist
    if( !dir.exists( WorkingDir ) )
    {
      dir.create( WorkingDir )
    }
    
    print( paste0( "Data File:", dirf ) )
    
    generalData = createGenralData( swversion , swversiondate , "NoScriptVersion", finput , "NoScriptDate"  )
    
    #Load Script file
    result_loadScriptFile = loadScriptFile( ScriptFilePath , efilepath ,WorkingDir )
    
    #Error no  file return runscript
    if( result_loadScriptFile$result == 1 ){
      
      #unable to load Script file
      return( list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 1 ) ) 
      
    }
    
    #Remove remark line
    sf = result_loadScriptFile$sf
    sf = sf[sapply(sf[,1],function(x){substr(x,1,1) != "#"}),]
    
    #load scriptversion
    scriptversion  = get1var(sf, "scriptversion",FALSE)
    
    if( is.null( scriptversion ) ){
      
      scriptversion = "NoScriptVersion"
    }
    
    #load scriptdate
    scriptdate  = get1var(sf , "scriptdate" , FALSE )
    if( is.null( scriptdate ) ){
      
      scriptdate = "NoScriptDate"
    }
    
    #browser() #180520
    include_qc  = get1var(sf , "include_qc" , FALSE )
    include_dvs  = get1var(sf , "include_dvs" , FALSE )
    
    #Find the QC.R path
    if( !is.null( include_qc ) & FALSE ){
      
      #check if Command line
      dirDataPath = NULL
      if( exists("arg1") && ( class(arg1) != "function" ) ) {
        
        #Get run engine file path
        dirDataPath <- dirname(sub("--file=","",arg1[grep("--file",arg1)]))
        
        print( paste0( "dirDataPath --------------"  , dirDataPath ) )
        #Create file name path
        ScriptFileNamePath = file.path( dirDataPath , "ScriptFileName.txt" )
        
      } else {
        
        #Get default Script file name 
        ScriptFileNamePath = "C:/Accellix3/ScriptFileName.txt"
        
      }
      

      #ScriptFileName.txt in Data directory
      if( file.exists( ScriptFileNamePath ) ){
        
        print( paste0( "ScriptFileNamePath --------------"  , ScriptFileNamePath ) ) #debug
        
        con <- file( ScriptFileNamePath,"r"  )
        fileSting <- readLines( con )
        fileSting = fileSting[ grepl( "QC.R" , fileSting ) ] 
        close(con)  
        
        #Check that QCFilesPath valid
        if(!is.null( fileSting ) ){
          
          if( length( fileSting ) > 0 ) {
            
            QCFilesPath  = fileSting
            
          } else {
            
            QCFilesPath = file.path( dirDataPath , "QC.R" )
            print( paste0( "QCFilesPath --------------"  , QCFilesPath ) ) #debug
            
          }           
          
        }
        
      } else {
        
        if( !is.null( dirDataPath ) ){
          
          QCFilesPath = file.path( dirDataPath , "QC.R" )
          
        } else {
          
          ErrorTable1  = c("ERROR:"  , "QC function missing" )
          print( ErrorTable1 )
          efilepath = file.path( WorkingDir , 'Summary Results.txt' )
          FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
          
          return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 3 ))
          
        }
        
      }
      
      
      if( length( QCFilesPath ) > 0 && file.exists( QCFilesPath ) ) {
        
        print( paste0( "QCFilesPath --------------Read "  , QCFilesPath ) )
        
        source( QCFilesPath , local = TRUE )
        
      } else {
        
        
        ErrorTable1  = c("ERROR:"  , "Not Valid QC Files Path" )
        print( ErrorTable1 )
        efilepath = file.path( WorkingDir , 'Summary Results.txt' )
        FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
        
        return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 3 ))
        
        
      } 
      
      #source( QCFilestring , local = TRUE )
      #source( "C:/Accellix3/RSourceFiles/QC.R" , local = TRUE )
      # if( exists( "include_qc" ) ){
      #   
      #   source( "C:/Accellix3/RSourceFiles/QC.R" , local = TRUE )
      #   
      # }
      
    }
    if( !is.null( include_dvs ) & FALSE ){
      
      print( paste0( "In DVS !!!!!" ) ) #debug
      
      #check if Command line
      dirDataPath = NULL
      if( exists("arg1") && ( class(arg1) != "function" ) ) {
        
        #Get run engine file path
        dirDataPath <- dirname(sub("--file=","",arg1[grep("--file",arg1)]))
        print( paste0( "dirDataPath --------------"  , dirDataPath ) )
        #Create file name path
        ScriptFileNamePath = file.path(dirDataPath,"ScriptFileName.txt")
        
      } else {
        
        #Get default Script file name 
        ScriptFileNamePath = "C:/Accellix3/ScriptFileName.txt"
        
      }
      
      
      #ScriptFileName.txt in Data directory
      if( file.exists( ScriptFileNamePath ) ){
        
        con <- file( ScriptFileNamePath,"r"  )
        fileSting <- readLines( con )
        fileSting = fileSting[ grepl( "DVS.R" , fileSting ) ] 
        close(con)  
        
        #Cehck that QCFilesPath valid
        if(!is.null( fileSting ) ){
          
          if( length( fileSting ) > 0 ) {
            
            DVSFilesPath  = fileSting
            print( paste0( "dirDataPath --------------"  , DVSFilesPath ) )
            
          } else {
            
            DVSFilesPath = file.path( dirDataPath , "DVS.R" )
            print( paste0( "dirDataPath ------- DVS.R"  , DVSFilesPath ) )
            
          }           
          
        }
        
      } else {
        
        if( !is.null( dirDataPath ) ){
          
          DVSFilesPath = file.path( dirDataPath , "DVS.R" )
          
        } else {
          
          ErrorTable1  = c("ERROR:"  , "DVS function missing" )
          print( ErrorTable1 )
          efilepath = file.path( WorkingDir , 'Summary Results.txt' )
          FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
          
          return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 3 ))
          
        }
        
      }
      
      
      if( length( DVSFilesPath ) > 0 && file.exists( DVSFilesPath ) ) {
        
        source( DVSFilesPath , local = TRUE )
        
      } else {
        
        
        
        print( paste0( "Not Valid DVSFilesPath"   , DVSFilesPath ) )
        ErrorTable1  = c("ERROR:"  , "Not Valid DVS Files Path" )
        print( ErrorTable1 )
        efilepath = file.path( WorkingDir , 'Summary Results.txt' )
        FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
        
        return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 3 ))
        
        
        
      } 
      
      #source( QCFilestring , local = TRUE )
      #source( "C:/Accellix3/RSourceFiles/QC.R" , local = TRUE )
      # if( exists( "include_dvs" ) ){
      #   
      #   source( "C:/Accellix3/RSourceFiles/DVS.R" , local = TRUE )
      #   
      # }
      
    }
    
    #load result log path
    re_log_accellix_path  = get1var(sf , "log_accellix_path" , FALSE )
    
    # if( is.null( re_log_accellix_path ) ){
    #   
    #   GlobalResultsPath <<- re_log_accellix_path
    #   
    # } 
    
    #load QC log path
    re_logqcpath  = get1var(sf , "logqcpath" , FALSE )
    if( !is.null( re_logqcpath ) ){ GlobalQcPath <<- re_logqcpath }
    
    generalData = createGenralData( swversion , swversiondate , scriptversion, finput , scriptdate  )
    
    logpath = file.path(WorkingDir, logName)
    
    #find load par variables
    loadpar = (sf[sf$type == "loadpar",])
    
    get_par_from_file = (sf[sf$type == "get_par_from_file",])
    varType = (sf[sf$type == "var",])
    
    #load Arrays variable
    #if( dim(varType)[1] > 0 )
    if( nrow( varType ) > 0 )
    {
      print("Load Var arrays")
      
      #for(j in 1:dim(varType)[1])
      for(j in 1:nrow( varType ) )
      {
        varTypej      = varType[j,]
        varTypej      = varTypej[!is.na( varTypej ) ]
        varTypej      = varTypej[ varTypej != "" ]
        varName = varTypej[2]
        varArray = varTypej[ 3:length(varTypej) ]
        varArray = as.numeric0( varArray )
        assign(varName , varArray ,envir = .GlobalEnv )
        print( varName )
      }
    }
    
    
    #===================
  
    #list of all reserve commands
    commandNames = c("cluster","plot","file","result","post","loadpar","var","get_par_from_file")
    #------------------------------------------------------
    
    #read data file
    result = tryCatch({
      
      if ( exists( "finput" ) && file.exists( finput ) && file.info( finput )$isdir != TRUE ){
        
        fileNameForGenrateData <- basename( finput )
        Arr = read.csv( finput, header = T, stringsAsFactors = F )
        0
        
        
      } else {  
        
        fileNameForGenrateData = "NoFileName"
        print("NO data file to read !")
        
        if( exists( "finput" ) ){
          
          ErrorTable1  = c("ERROR:"  , paste0( "NO data file to read ! ", finput ) )
          fileNameForGenrateData = finput
          
        } else {
          
          ErrorTable1  = c("ERROR:"  , "NO data file to read !"  )
          
        }
        
        #efilepath = file.path( WorkingDir , 'Summary Results.txt' )
        generalData = createGenralData( swversion , swversiondate , scriptversion, fileNameForGenrateData , scriptdate  )
        FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
        1
        
      } 
      
    }, warning = function(w) { 0 }, error = function(e) {
      
      #Unable to read file
      ErrorTable1  = c("ERROR:"  , paste0( "Unable to read data file ", finput ) )
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      
      1
      
    }, finally = { })
    
    #return runscript
    if( result == 1 ){ 
      
      return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 2 ) ) 
      
    }
    
    
    #create Null data error
    #error0_fatal = 
    #return runscript
    if( is.null( Arr ) ){
      
        ErrorTable1  = c("ERROR:"  , paste0( "Data Array is Null ", finput ) )
        print( ErrorTable1 )
        FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
        
        return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 3 ))
        
    } 
      
    
    number_of_events = nrow( Arr )
    
    print(paste0( "number_of_events " , number_of_events) ) 
    
    if( is.null( number_of_events ) ){
      
      if( file.exists( finput )){
        
        ErrorTable1  = c("ERROR:"  , paste0( "Number of events is Null ", finput ) )
        
      } else {
        
        ErrorTable1  = c("ERROR:"  , "Number of events is Null" )
        
      }
      
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      
      return(list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 4))
      
    }
    
    
    
    #fix col names ("." or " ") to "_"
    ajustnames = TRUE
    if( ajustnames ){
     
      colNames <- colnames( Arr )
      colNames <- gsub(" ","_",colNames)
      colNames <- gsub("-","_",colNames)
      colNames <- gsub("[.]","_",colNames)
      colnames( Arr ) <- colNames
      
    }
    
   
    bAllColAvailables = TRUE
    if( exists("col_names") ){

      bAllColAvailables = (col_names %in% colnames(Arr))

    }
    #return runscript
    if( !all( bAllColAvailables ) ){
      
      bAllColAvailables = !bAllColAvailables
      MissingColNames = col_names[ bAllColAvailables ]
      PrintString = paste0( "Missing col: ",paste0( MissingColNames ,collapse = ", " ) )
      ErrorTable1  = c("ERROR:"  , paste0( "Mismatch Col " , PrintString )   )
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      return( list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 5 ) )
      
    }
    
    #get_par_from_file =  c("get_par_from_file","get_par_from_file_example.txt","Var1","Var3" )
    
    nrow_get_par_from_file = nrow(get_par_from_file)
    
    le_get_par_from_file_sp = 0
    
    if( nrow_get_par_from_file  > 0 )
    {
     
      get_par_from_file = data.frame(get_par_from_file)      
      get_par_from_file_sps = split(get_par_from_file,get_par_from_file[,3]) 
      
      le_get_par_from_file_sps = length( get_par_from_file_sps )
    
      if( le_get_par_from_file_sps  > 0 )
      { 
        
        
        for( get_par_from_file_sp in get_par_from_file_sps )
        {
          le_get_par_from_file_sp = nrow( get_par_from_file_sp )
          
          for(indf in 1:le_get_par_from_file_sp )
          {
            
            fp  = get_par_from_file_sp[ 1 , 3 ]
            
            if( !file.exists( fp ) ) {
              
              fp = file.path( dirPath , fp )
              
            }
              
            print(fp)
            
            get_par_from_file_c  = get_par_from_file_sp[1 , ]
            cpar = get_par_from_file_c[!is.na( get_par_from_file_c )]
            cpar      = cpar[ cpar != "" ]
            print("Variabel From File =========================================")
            
            bfpCsv = cpar[ length(cpar) ] == ","
            
            
            if( bfpCsv ) {
              
              get_par_from_file_da = data.frame(read.csv( fp ,header = FALSE ,stringsAsFactors = F ))
              
            } else {
              
              get_par_from_file_da <- read.delim(fp , header = FALSE, stringsAsFactors=FALSE)
              
            }
            
            variableNames = get_par_from_file_sp[,2]
            variableDaNames = get_par_from_file_sp[,4]
            
            #wv = which(get_par_from_file_da[1,] %in% variableDaNames )
            
            J_ind = 0
            for( vn in variableDaNames ){
              
              J_ind = J_ind + 1
              
              wi = which(get_par_from_file_da[,1] == vn )
              
              if(length(wi) > 0 ){
                
                v = as.numeric0(get_par_from_file_da[wi,2]) 
                
                assign( variableNames[ J_ind ], v, envir = .GlobalEnv )
                
              } else {
                
                
                print(paste0( "No " ,vn ," in file " , fp ) )
                
              }
              
            }
   
          }
          
        }
      
      }  
      
    }  
    
    #if loadpar is not empty
    #if( dim(loadpar)[1] > 0 )
    if( nrow( loadpar ) > 0 )
    {
      
      print("Load Par")
      fp = file.path( dirPath, fileListName ) 
      
      #for(j in 1:dim(loadpar)[1])
      for(j in 1:nrow( loadpar ) )
      {
        loadpar      = loadpar[ !is.na( loadpar ) ]
        loadpar      = loadpar[ loadpar != "" ]
        loadparIndex = as.numeric( loadpar[ 2 ] )
        loadpar      = loadpar[ 3:length(loadpar) ]
        
        if( !is.null(FMOpath) ){ #short for check remove
          
          print("Get data from FMOpath File")
          loadparpath = FMOpath
          fpp <- file.path( loadparpath ,"Summary Results.txt" )
          
        } else {
          
          print("Get data from Cartriges File")
          loadparpath  = read.csv( fp, header = F, stringsAsFactors = F,sep = ";" )
          loadparpath  = loadparpath[ loadparIndex,1 ]
          fpp <- file.path(loadparpath ,"Summary Results.txt" )
          
        }
        
        loadparFileData = read.csv( fpp , header = T ,stringsAsFactors = F,sep = "\t")
        
        loadpar.log = NULL  
        for(i in  1:length( loadpar ) )
        {
          
          lo  = loadparFileData[ trimws( loadparFileData[  ,1 ] ) == loadpar[i], 2]
          
          
          if( length(lo) > 0 ){
            
            loadpar.log = c( loadpar.log , paste0( loadpar[i] , ".log" ) ) #DEBUG
            assign( loadpar[i] , as.numeric( lo ) )
            print( paste0( loadpar[i] , " -> " , eval(parse(text = loadpar[i] ) ) ) )
            
            
          }
          
        }
      }
      
    }
    
    #=========================================
    
    #hold current variable list  
    fls = ls()
    print( fls )
    
    #extract unreserve command to clcualte variables
    sfVar = sf[ !(sf[,1] %in% commandNames ),1:2 ]
  
    #Calculate Variables
    sfreVar = assignVar( sfVar, Arr , NULL )
    
    #return runscript
    if( !is.null( sfreVar$Error ) )
    {
      ErrorTable1 = c( "ERROR:" , sfreVar$Error )
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      return( list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 8 ) )
      
    }
    #Extract results 
    sfVar  = sfreVar$VarOut
    Arr = sfreVar$ArrOut
    
    print( "After assignVar"  )
    print( ls() )
    
    #Handle fatal error
    reCheckForFatalError = CheckForFatalError()
    
    if( reCheckForFatalError$status )
    {
      ErrorTable1 = paste0( "ERROR:" , reCheckForFatalError$errorType )
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      return( list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 6 ) )
    }
  
    print(paste0("use_filter_shade -> " , use_filter_shade ) )
    
    #Shade Filter
    if( use_filter_shade == 1 ){
      
      Arr = FilterShadeFilter( Arr,
                               filter_shade_n,
                               filter_shade_le,
                               filter_shade_sl,
                               filter_shade_minv,
                               filter_shade_type)
      print("Shade Filter parameters")
      print(paste( "n  -> "   , filter_shade_n ,
                    "le -> "   , filter_shade_le,
                    "sl -> "   , filter_shade_sl, 
                    "minv -> " , filter_shade_minv, 
                    "type -> " , filter_shade_type ,collapse = " ") )
      
    } else { 
      
      print("did not use use_filter_shade ! ")
      
    }
    
    #Prepare group command for each clustering   
    clustringvar = sf[sf$type == "cluster",]
    ClusterSp = split(clustringvar , clustringvar[,2])
    
    cl = clustringvar[ numbers_only( clustringvar[,3] ), c(2,3) ] 
    clusterNames = cl[ order(cl[,2]) , 1 ]
    
    #ClusterName = clusterNames[[1]]
    #Run clustering algorithm for cluster
    for(ClusterName in clusterNames )
    {
      #View(sfVar)
      cls = eval( parse( text = paste0( c( "ClusterSp" , ClusterName ), collapse = "$" ) ) )
      clout = clustering( cls , Arr , ClusterName , dirPath )
      if(  clout$fatalError ){
        
        debugf("Resultout" , paste0("No enough points for clustering") , DebugFilePath, DebugLevel , 100 )
        #return runscript
        return(NULL)
        
      }
      
      Arr = clout$ArrOut
      
      sfcycleVar1 = assignVar( sfVar , Arr , 0 )
      sfVar = sfcycleVar1$VarOut
      Arr = sfcycleVar1$ArrOut
      
      postVar = assignVar( clout$logic , Arr , 0 )
      Arr = postVar$ArrOut
      sfVarLogic = postVar$VarOut
      colnames( sfVarLogic ) = c("Type" , "Var1" )
      colnames( sfVar ) = c("Type" , "Var1" )
  
      sfVar = rbind( sfVar, sfVarLogic )
        
      sfcycleVar2 = assignVar( sfVar , Arr , 0 )
      sfVar = sfcycleVar2$VarOut
      Arr = sfcycleVar2$ArrOut
    }
    
    
    sfreVar = assignVar( sfVar, Arr , NULL )
    
    #return runscript
    if( !is.null( sfreVar$Error ) )
    {
      ErrorTable1 = paste0( "ERROR:" , sfreVar$Error )
      print( ErrorTable1 )
      FatalErrorFunction( ErrorTable1 ,generalData ,efilepath )
      return( list( Status = 1 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 9 ) )
    }
    sfVar  = sfreVar$VarOut
    Arr = sfreVar$ArrOut
    
    #Get list of current variables
    lso = ls()
    
    #fine the new variables
    NewVar = lso[!(ls() %in% fls )]
    
   
    
    # plots==============================================
      
        
        print("Pre plots Arr")
        print( colnames(Arr) )
        
        
        #plot REsults
        if( useplot == 1 )
        {
          
          PlotInput = sf[ sf[,1] == "plot", ]
          
          if( !dir.exists( WorkingDir ) ){
            
            dir.create(WorkingDir)
            
          }
          
          #if( dim( PlotInput )[1] > 0 )
          if( nrow( PlotInput ) > 0 )
          { 
            
            plotFontSsize = 2
            
            spFigure = split(PlotInput,PlotInput[,2])
            
            #si = spFigure[[1]]
            for( si in spFigure )
            {
              
              
              bMtext = FALSE
              
              tryCatch( {
              
              wfile = which(si[,3] == "filename")[1]
              PlotFileName = ( si[wfile,] )[1,4]
              wmfrow = which( si[,3] == "figure" )
              
              dirf1 =  gsub(".csv", "" , dirf)
              
              PlotFileName = paste0( dirf1 , "_", PlotFileName,".jpeg") 
              
              png(file.path( WorkingDir , paste0(PlotFileName)) , width = 1920, height = 1080) #debug0406
              
              mfrow = (si[ wmfrow , ])[1,c(4,5)]
              par( mfrow  = as.numeric( matrix( mfrow , 1 , ) ) , oma = c( 0, 2, 2, 0 ) , mai = c(1, 1, 1, 1) )
              
              si = si[-c(wmfrow , wfile) , ]
              
              sii = split( si , si[,3] )
              
              },error = function(e){print(e)}, finally = 0 )
              
              #siii  = sii[[7]]
              
              for(siii  in sii)
              {
                
                clusterName = (siii[siii[,4] == "clustername",])[1,5]
                dataName = as.character((siii[siii[,4] == "data",])[,5])
                
                if( clusterName != "" ){
                  
                  clusterName = paste0(clusterName,"_index")
                  tx = paste0("with( Arr , ", clusterName , ")" )
                  selCluster = eval(parse(text = tx))
                  da = Arr[selCluster,]
                  
                } else {
                  
                  da = Arr
                  
                }
                
                if( dataName != "" ) {
                  
                  tx = paste0("with( da,",dataName," ) "  )
                  boVar = eval(parse (text =  tx) )
                  da = da[ boVar, ]  
                  
                }
                
                plotType  = as.character((siii[siii[,4] == "type",])[,5])
                plotTitle  = as.character((siii[siii[,4] == "title",])[,5])
                print( plotTitle )
                print( plotType )
                
               
                tryCatch( {
                
                if( plotType == "plot" | plotType == "contour"){
                  
                  bPlotTypeConture = plotType == "contour"
                  
                  plotAxis  = as.vector(siii[siii[,4] == "axis",])
                  plotAxis =  plotAxis[5:length(plotAxis)]
                  plotAxis = plotAxis[!is.na(plotAxis)]
                  plotAxis = plotAxis[ plotAxis != "" ]
                  
                  if( length(plotAxis) == 7 )
                  {
                    
                    x  = as.character(plotAxis[1]) 
                    y  = as.character(plotAxis[2]) 
                    
                    samplepre =  plotAxis[3]
                    xlim = as.numeric( plotAxis[c(4,5)] )
                    
                    if(all(xlim == 0)){
                      
                      dat  = da[, x ]
                      if( x != "PeakTime"){
                        
                        dat[ dat >  1e5 | dat < -1e5   ] <- NA  
                        
                      } 
                      xlim = range(dat,na.rm = T)
                      
                    }
                    
                    
                    ylim = as.numeric( plotAxis[c(6,7)] )
                    
                    if(all(ylim == 0)){
                      
                      dat  = da[, y ]
                      dat[ dat >  1e5 | dat < -1e5   ] <- NA  
                      ylim = range(da[,y], na.rm = T)
                      
                    }
                    
                  
                  } else {
                    
                    
                    print( plotAxis )
                    print( "Error length != 7" )
                    
                  }
          
                  colors  = siii[siii[,4] == "colors",]
                  colors = colors[5:length(colors)]
                  colors = as.numeric(colors[!is.na(colors) & colors != ""])
                  select  = siii[siii[,4] == "select",]
                  select = select[5:length(select)]
                  select = ( select[!is.na(select) & select != ""] )[1]
                  tx = paste0( "with(da, ", select ,  ")" )
                  select <- eval(parse(text = tx ))
                  
  
                  #le = dim(da)[1]
                  le = nrow( da )
                  
                  #if( plotAxis[3] != 1 ){
                  
                  if( TRUE ){
                   
                    if( is.na( plotAxis[3] ) ) {
                      
                      part1 = 1
                      part2 = 1
                      
                    } else {
                      
                      part1= as.numeric( plotAxis[3] )
                      
                      #use bu contour
                      if( part1 > 1 ){
                        
                        part2 = part1
                        part1 = 1
                        
                        
                      } else {
                        
                        part2 = part1
                        
                        
                      }
                      
                    }
                      
    
                    print( paste( "plotAxis[3]" , plotAxis[3] ) ) 
                    print( paste( "as.numeric ( plotAxis[3] ) " , as.numeric( plotAxis[3] ) ) )
                    
                    
                    Infsel = apply(da[, c(x,y) ],1,function(x){ is.infinite ( abs(x[1] ) )  | is.infinite ( abs(x[1]) ) })
                    Nasel = complete.cases(da[, c(x,y) ] ) & !Infsel
                    daN = da[ Nasel , c(x,y) ]
                    
                    #le = dim(daN)[1]
                    le = nrow( daN )
                    
                    plotSampleSize = le * part1
                    
                    if( exists("max_num_points_in_plot") && max_num_points_in_plot > 0 ){
                      
                      plotSampleSize = min( max_num_points_in_plot , plotSampleSize )
                      
                    }
                    
                    print( paste( "le" , le ) ) 
                    print( paste( "plotSampleSize" , plotSampleSize ) )
                    
                    select = select[Nasel]
                    sam = sample( le , plotSampleSize )
                    print( paste( "sam" , length( sam ) ) ) 
                    
                    selSam = select[sam]
                    
                    #when all the event are the same create dummy event for the colors plot 
                    if( all( selSam )  ){
                      
                      selSam[1] = FALSE 
                      
                    } else if ( !any( selSam ) )  { 
                      
                      selSam[1] = TRUE
                      
                    }
                    
                    #wwww #remove
                    
                    
                    plot( daN[sam,],col = colors[factor(selSam)],
                          xlim = xlim , 
                          ylim = ylim , 
                          pch  = ".",
                          main = plotTitle , 
                          cex.lab  = plotFontSsize ,  
                          cex.axis = plotFontSsize , 
                          cex.main = plotFontSsize , 
                          cex.sub  = plotFontSsize , type = ifelse( bPlotTypeConture ,"n" , "p" )  )
                    
                    
                    if( bPlotTypeConture ){
                      
                      cl = colors[factor(selSam)]
                      addCounturs( daN[sam,] ,cl ,colors, bNewPlot = FALSE,n = 200 ,NumberOfLines = 15 * part2 ,lowper = 0.1 )
                      
                    }
                    
                    if(!is.null( dev.list() ) & !bMtext ){
                      
                      mtext( dirf , outer = TRUE, cex = 1.5)
                      bMtext = TRUE
                      
                    }
                    
                    if( use_density != 0 ){
                      
                      COLOR_Yellow = add.alpha( colorRampPalette(c("black","black","yellow"), alpha=FALSE )(3) , c(0,0.0,0.5) )
                      f1 <- kde2d(daN[sam,1],daN[sam,2],h = c(1,1),n = 100, lims =  c(range(daN[sam,1]), range(daN[sam,2])))
                      image(f1,col = COLOR_Yellow,add = TRUE) # zlim = c(0, 0.05)
                    }
                    
                  } else {  #REMOVE
                    
                    plotSampleSize = le
                    
                    if( exists("max_num_points_in_plot") && max_num_points_in_plot > 0 ){
                      
                      plotSampleSize = min( max_num_points_in_plot , plotSampleSize )
                      
                    }
                    
                    Infsel = apply(da[, c(x,y) ],1,function(x){ is.infinite ( abs(x[1] ) )  | is.infinite ( abs(x[1]) ) })
                    print( paste( "Infsel" , sum( Infsel ) ) ) 
                    
                    Nasel = complete.cases(da[, c(x,y) ] ) & !Infsel
                    print( paste( "Nasel" , sum( Nasel ) ) ) 
                    
                    selectNasel = select[ Nasel ]
                    
                    if( all( selectNasel )  ){
                      
                      selectNasel[1] = FALSE 
                      
                    }
                    
                    plot( da[ Nasel ,c(x,y)],col = colors[ factor( selectNasel ) ],
                                      xlim = xlim , 
                                      ylim = ylim , 
                                      pch = "."   ,
                                      main     = plotTitle     ,
                                      cex.lab  = plotFontSsize ,  
                                      cex.axis = plotFontSsize , 
                                      cex.main = plotFontSsize , 
                                      cex.sub  = plotFontSsize  ) 
                    
                    if(!is.null( dev.list() ) & !bMtext ){
                      
                      mtext( dirf, outer = TRUE, cex = 1.5)
                      bMtext = TRUE
                      
                    }
                    
                    
                    
                    COLOR_Yellow = add.alpha( colorRampPalette(c("black","black","yellow"), alpha=FALSE )(3) , c(0,0.0,0.5) )
                    f1 <- kde2d(da[ Nasel ,x],da[ Nasel ,y ],h = c(1,1), n = 100, lims =  c(range(da[ Nasel ,x]), range(da[ Nasel ,x])))
                    image(f1,col = COLOR_Yellow,add = TRUE ) # zlim = c(0, 0.05)
                    
                  }
                  
                  
                } else if (plotType == "hist") {
                  
                  
                  
                  plotAxis  = as.vector(siii[siii[,4] == "axis",])
                  plotAxis = plotAxis[ 5:length( plotAxis ) ]
                  plotAxis = plotAxis[!is.na(plotAxis)]
                  plotAxis = plotAxis[plotAxis != ""]
                  colors  = siii[siii[,4] == "colors",]
                  colors = colors[5:length(colors)]
                  colors = as.numeric(colors[!is.na(colors) & colors != ""])
                  select  = siii[siii[,4] == "select",]
                  
                  #if(dim(select)[1] > 0){
                  if( nrow( select ) > 0 ){
                    
                    select = select[5:length(select)]
                    select = ( select[!is.na(select) & select != ""] )[1]
                    tx = paste0( "with(da, ", select ,  ")" )
                    select <- eval(parse(text = tx ))
                    bSelect = sum(select) > 0
                    
                    #Check if the selected is all
                    #if( sum(select) == dim(da)[1]){
                    if( sum( select ) == nrow( da ) ){
                      
                      colors = colors[ length(colors) ]
                      
                    }
                    
                  }
                  
                  
                  if( length(plotAxis) == 6 )
                  {
                    
                    
                    x  = as.character( plotAxis[1] )
                    
                    xlim = as.numeric( plotAxis[c(3,4)] ) 
                    
                    
                    if( all( xlim == 0 ) )
                    {
                      
                      dat  = da[, x ]
                      dat[ dat >  1e5 | dat < -1e5   ] <- NA  
                      xlim = range(dat , na.rm = T )
                      
                    }
                    
                    ylim = as.numeric( plotAxis[c(5,6)] )
                    
                    if( all( ylim == 0 ) ){
                      
                      ylim = NULL
                      
                    }
                    
                    Infsel = is.infinite( da[, x ] )
                    Nasel = !is.na( da[, x ] ) & !Infsel
                    
                    bhist = FALSE
                    if( sum( Nasel ) > 5 ){
                      
                      h = hist( da[ Nasel , x ], xlim = xlim ,ylim = ylim , col = colors[1] ,
                                border = colors[1],
                                main     = plotTitle , 
                                xlab     = x  ,
                                breaks   = 200,
                                cex.lab  = plotFontSsize ,  
                                cex.axis = plotFontSsize , 
                                cex.main = plotFontSsize , 
                                cex.sub  = plotFontSsize  ) 
                      
                      if(!is.null( dev.list() ) & !bMtext ){
                        
                        mtext( dirf , outer = TRUE, cex = 1.5)
                        bMtext = TRUE
                        
                      }
                      
                      bhist = TRUE
                    }
                    
                    histDiff = diff(h$breaks)[1]
                    
                    if(bSelect){
                      
                      dat = da[ select , x ]
                      Infsel = is.infinite( dat )
                      Nasel = !is.na( dat ) & !Infsel
                      
                      if( length(colors) == 1){
                        
                        
                      } else {
                        
                        colors = colors[2]
                        
                      }
                      
                      if( ( length( dat ) > 5 )  &  ( bhist == TRUE ) ){
                        
                        bre = seq(min(dat) - histDiff, max(dat) + histDiff, histDiff)
                        
                        hist(dat, add = TRUE, col = colors, border = colors ,breaks = bre,
                             cex.lab  =plotFontSsize  ,  
                             cex.axis = plotFontSsize , 
                             cex.main = plotFontSsize , 
                             cex.sub  = plotFontSsize  )
                        
                        if(!is.null( dev.list() ) & !bMtext ){
                          
                          mtext( dirf , outer = TRUE, cex = 1.5)
                          bMtext = TRUE
                          
                        }
                        
                      }
                      
                    }
                    
                  
                    
                  } else {
                    
                    print( plotAxis )
                    print( "Error length != 6" )
                    
                    
                  }
                  
                }
                  
                },error = function(e){print(e)}, finally = 0)  
                
                
                tryCatch( {
                
                  
                #Add lines    
                plotlines  = siii[siii[,4] == "line",]
                
                #if(dim( plotlines )[1] > 0 ){
                if( nrow( plotlines ) > 0 ){
                    
                  #for( j in 1:dim(plotlines)[1] ){
                  for( j in 1:nrow( plotlines ) ){
                    
                    if(plotlines[j,6] == "h") {
                
                      ht = eval(parse( text = plotlines[j,5] ) )
                      #print(ht)
                      colt  = c( as.numeric( plotlines[j,7] ) )
                      #print( colt )
                      ltyt = as.numeric( plotlines[j,8] )
                      #print( ltyt )
                      lwdt = as.numeric( plotlines[j,9] )
                      #print( lwdt )
                      
                      #Use genral abline if 2D
                      if(length( ht ) == 2 ){
                      #if( FALSE ){
                        
                        
                        abline( ht, col = colt , lty = ltyt , lwd =  lwdt)    
                        
                      } else {
                      
                        abline( h = ht, col = colt , lty = ltyt , lwd =  lwdt)    
                        
                      }
                      
                    } else {
                      
                      vt = eval(parse( text = plotlines[j,5] ) )
                      #print(vt)
                      colt  = c( as.numeric( plotlines[j,7] ) )
                      #print( colt )
                      ltyt = as.numeric( plotlines[j,8] )
                      #print( ltyt )
                      lwdt = as.numeric( plotlines[j,9] )
                      #print( lwdt )
                      
                      #Use genral abline if 2D
                      if( length( vt ) == 2 ){
                      #if( FALSE ){  
                        
                        abline( vt, col = colt , lty = ltyt , lwd =  lwdt)    
                        
                      } else {
                      
                        abline( v = vt, col = colt , lty = ltyt , lwd =  lwdt) 
                      }
                      
                    }
                    
                  }
                  
                  
                }
                
                },error = function(e){print(j);print(e)}, finally = 0 )
                
              }
              
              dev.off() #debug0406
            
            }
            
          
          }
        
        
        }
    
    # Results=============================================
    
      #get Script result commands   
      inputResults = sf[sf[,1] == "result",]
      
      resultsOut = NULL
        
      #write results  
      #if(dim( inputResults )[1] > 0 )
      if( nrow( inputResults ) > 0 )
      {
        fnw = which( inputResults[,2] == "filename" )
        FileNameResults = inputResults[fnw ,3]
        FileNameResults = file.path(WorkingDir,paste0(FileNameResults,".txt") )
        inputResults = inputResults[-fnw ,]
        
        Arr$all <- TRUE
        
        #for( iin in 1:dim(inputResults)[1] )
        for( iin in 1:nrow( inputResults ) )
        {
          print( inputResults[ iin , 2 ] )
          
          if( inputResults[ iin , 2 ] == "error" ){
            
            tryCatchR  <- tryCatch( {
              
              
              d0 = eval(parse(text = inputResults[ iin , 3 ] ))
              d1 = inputResults[ iin , 4 ]
              d2 = inputResults[ iin , 5 ]
              
            }, error = function(e) { print (e) ; 999999 }, finally = 0 )
            
            if( tryCatchR != 999999 ){
              
              if(d0){
                
                resultsOut = rbind( resultsOut , c( d1 , d2 ) )
                
              }
            
            }
            
          } else if( inputResults[ iin , 2 ] == "count" ) {  
            
          
            tryCatchR  <- tryCatch( {
              
              d1  = inputResults[ iin , 3 ]
              countResult  = round( sum (Arr[ ,inputResults[ iin , 4 ] ] ), 0 )
              d2  = as.character( countResult )
              d3  = c( d1 , d2 )
              
              inp  = inputResults[ iin ,]
              inp = inp[!is.na(inp) & inp != ""]
              le_inp = length(inp)
              le_ = le_inp - 4
              if( le_ >= 2 ){
                
                m = matrix(inp[(le_inp - le_ + 1):le_inp],,2,byrow = T)
                
                #for(k in 1:dim(m)[1]){
                for( k in 1:nrow( m ) ){
                  
                  rm(tx)
                  tx = paste0("countResult ", m[k,2] )
                  assign( m[k,1] , eval( parse(text = tx) ) ,envir = .GlobalEnv ) 
                }
                
              }
              
              d3
              
            } , error = function(e) { print (e) ; 999999 }, finally = 0 )
            
            if( tryCatchR != 999999 ){
            
              resultsOut = rbind( resultsOut , d3 )
              
            }else { 
              
              d1  = inputResults[ iin , 3 ]
              resultsOut = rbind( resultsOut , c( d1 , "Unable To Calculate" ) )
              
            }
            
          } else if (inputResults[ iin , 2 ] == "ratio" ) {
              
            tryCatchR <-  tryCatch( {
              
              d0 = inputResults[ iin , 3 ]
              d1 = sum(Arr[ , inputResults[ iin , 4 ] ] )  
              d2 = sum(Arr[ , inputResults[ iin , 5 ] ] )
              d3 = as.numeric( inputResults[ iin , 6 ] )
              ratioResults  = round( d1 / d2 , d3 )
              
              inp  = inputResults[ iin ,]
              inp = inp[!is.na(inp) & inp != ""]
              le_inp = length(inp)
              le_ = le_inp - 6
              
              
              if( le_ >= 2 ){
                  
                m = matrix(inp[(le_inp - le_ + 1):le_inp],,2,byrow = T)
                
                #for(k in 1:dim(m)[1]){
                for( k in 1:nrow( m ) ){
                  
                  rm(tx)
                  tx = paste0("ratioResults", m[k,2] )
                  assign(m[k,1], eval( parse( text = tx ) ) ,envir = .GlobalEnv )  
                }
                
              }
              
              d0
              
              
            }, error = function(e) { print (e) ; 999999 }, finally = 0 )
            
            if( tryCatchR != 999999 ){
            
              resultsOut = rbind( resultsOut , c( d0 , as.character( ratioResults ) ) )
              
            }else { 
              
              resultsOut = rbind( resultsOut , c( d0 , "Unable To Calculate" ) )
              
            }
            
          } else if (inputResults[ iin , 2 ] == "pre") {
            
            tryCatchR <-  tryCatch( {
              
                d1 = sum(Arr[ , inputResults[ iin , 4 ] ] )  
                d2 = sum(Arr[ , inputResults[ iin , 5 ] ] )
                d3 = inputResults[ iin , 3 ]
                
                
            }, error = function(e) { print (e) ; 999999 }, finally = 0 )
            
            if( tryCatchR != 999999 ){
            
              resultsOut = rbind( resultsOut , c( d3 , as.character( round( 100 * d1 / d2 , 2 ) ) ) )
              
            } else { 
              
              
              resultsOut = rbind( resultsOut , c( d3 , "Unable To Calculate" ) )
              
            }
            
          } else if( inputResults[ iin , 2 ] == "" ) {
            
              
              resultsOut = rbind( resultsOut,c( "","" ) ) 
       
            
          } else if( inputResults[ iin , 2 ] != ""  ) {
            
           
              if ( inputResults[ iin , 2 ] %in% colnames( Arr ) )
              {
                  
                  tryCatchR <-  tryCatch( { 
                    
                    tx1 = paste0("with( Arr,", inputResults[ iin , 2 ],")" )
                    sel = eval(parse( text = tx1 ) )
                    tx2 = paste0( " with( Arr[ sel , ] ,", inputResults[ iin , 3 ] , ")" )
                    re2  = eval( parse( text = tx2 ) )
                    dumy = 0
                    
                    
               }, error = function(e) { print (e) ; 999999 }, finally = 0 )
                    
                  if( tryCatchR != 999999 ){
                    
                    resultsOut = rbind( resultsOut , c(inputResults[ iin , 3 ],eval( parse( text = tx2 ) ) ) )
                    
                  } else {  
                    
                    resultsOut = rbind( resultsOut , c(inputResults[ iin , 3 ], "Unable To Calculate" )  ) 
                    
                   }
              }else {
                
                tryCatchR <-  tryCatch( {
                  
                  re2 = eval(parse(text = inputResults[ iin , 3 ] ) )
                  round1 = as.numeric(c(inputResults[ iin , 4 ]))
                  dumy = 0
                  
                }, error = function(e) { print (e) ; 999999 }, finally = 0 )
                
                if( tryCatchR != 999999 ){
                  
                  if( !is.na( round1 ) ){
                    
                    resultsOut = rbind( resultsOut , c(inputResults[ iin , 2 ], round( re2 , round1 ) ) )     
                    
                  } else {
                    
                    resultsOut = rbind( resultsOut , c(inputResults[ iin , 2 ], re2 ) )     
                    
                  }
                  
                } else  { 
                  
                  resultsOut = rbind( resultsOut , c(inputResults[ iin , 2 ], "Unable To Calculate" )  ) 
                }
                
              }
                
            } 
          
        }
        
       
        
        
        if ( !is.null(resultsOut ) ){
          
          write.table( resultsOut, FileNameResults , sep="\t",quote = FALSE, col.names=FALSE,row.names = F)
          dn = dirname(dirname(FileNameResults))
          bn = basename(FileNameResults)
          fn  = file.path(dn,bn)
          write.table( resultsOut,fn,quote = FALSE, sep="\t",  col.names=FALSE,row.names = F)
          
        
          if( resultsoutinkpath != "" ){
          
            if( file.exists( resultsoutinkpath ) ){  
             
               sink( resultsoutinkpath , append = T  )
              
                cat( paste0( paste0 ( resultsOut[,2],collapse = "," ),"\n" ) )
              
               sink()
            }
            
          }
          
        }
      
      }
      
        
    #========================================================
    #return runscript
    if (!is.null(resultsOut) ){
      
      return( list(Status = 0 , Summarypath = efilepath , vnames = resultsOut[,1], variables = resultsOut[,2] ,WorkingDir = WorkingDir , exitnum = 0 ) )
      
    } else {
      
      debugf("Resultout" , "Empty" , DebugFilePath, DebugLevel , 100 )
      
      #return( NULL )
      return( list( Status = 0 , Summarypath = efilepath  , vnames = NULL , variables = NULL , WorkingDir = NULL , exitnum = 7 ) )
      
    }
    
  }
  
  #mode function
  writeToQcLog <- function( reflattenSummary  , GlobalQcPath ){
    
    if( file.exists( GlobalQcPath )) { 
      
      sink(  GlobalQcPath  ,append = T ) 
      
        #cat( paste0( "@Start@Time;",Sys.time(),reflattenSummary$strings , "@End\n" ) )
        cat( reflattenSummary$strings )  
      
      sink( )
      
    } else {
      
      sink( GlobalQcPath ,append = F ) 
      
      #cat( paste0( "@Start@Time;",Sys.time(),reflattenSummary$strings , "@End\n" ) )    
        cat( reflattenSummary$strings )  
      
      sink( )
      
    }
    
  }
  
  runSequnce <- function( bRunFromFileList )
  {
    
    
    if(bRunFromFileList)
    {
      
      timeStemp = gsub("-","_",gsub(":","_",Sys.time()))
      listFile = choose.files("L:\\Personal\\Boaz\\Signature\\GeneralScript" , multi = FALSE , caption = "Select List file..")
      dirListName <- dirname(listFile)
      filelistda <- read.csv( listFile ,stringsAsFactors = F,header = T)
      
      fl = apply( filelistda , 1 ,  function(x) { c(file.path( x[1] , x[2] ) , file.path( x[3] , x[4] ) ) } )
      
      br = NULL
      fileNames = NULL
      cartNums = NULL
      bScriptInCommand = FALSE
      remfo  = NULL
      
      for(i in 1:dim(fl)[2]){
        
        prels = ls(.GlobalEnv )
        prels  = append( prels , "remfo")
        
        remfo = runScript(fl[1,i], NULL , TRUE , NULL )
        
        postvl = ls(.GlobalEnv )
        
        
        removeAddtion  = postvl[ !( postvl %in% prels ) ]
        rm( list = removeAddtion ,envir = .GlobalEnv )
      
        if(TRUE){ #remove
          
          rehcart = runScript(fl[2,i], NULL , FALSE , remfo$WorkingDir )
          br = rbind( br, rehcart$variables )
          fileNames = c(fileNames,basename(fl[2,i]))
          cartNums  = c(cartNums,getCartNum(basename(fl[2,i])))
          
          postvl = ls(.GlobalEnv )
          removeAddtion  = postvl[ !( postvl %in% prels ) ]
          rm( list = removeAddtion ,envir = .GlobalEnv )
          rm(remfo)
          
        }
        
      }
      
  
      if( exists("rehcart" ) ){
        
        br = data.frame(br)
        colnames(br) = rehcart$vnames
        print(cartNums)
        br = data.frame(br,CartNum = cartNums)
        write.csv(br,paste0(dirListName,"\\ResultsTable",timeStemp,".csv"))
        colnames(filelistda)[4] <- "file.name"
        resultListName = merge( filelistda , br , by  = "file.name" ) 
        write.csv( resultListName , 
                   file.path(dirListName, 
                   paste0(timeStemp,"MergeResult.csv" ) ) )
      }else{
        
        
      } 
      
    
      
    }else {
      
      fl = choose.files("C:\\Accellix\\NewVScriptVerification\\data2" , multi = FALSE , caption = "Select FMO file.." )
      fr = choose.files("C:\\Accellix\\NewVScriptVerification\\data2" , multi = FALSE,caption = "Select JCAR file..")
      rl = runScript(fl,NULL, NULL)
      print( rl$WorkingDir )
      rr = runScript(fr, NULL, rl$WorkingDir )
    }
    
  
  }
  
  runBatch <- function()
  {
    
    bScriptInCommand = FALSE
    dirpath = choose.dir(caption = "Select floder wit the list of ..._events.csv files")
    
    timeStemp = gsub("-","_",gsub(":","_",Sys.time()))
    
    fileList = dir(dirpath,full.names = T,pattern = ".csv")
    
    fileList = fileList[!(file.info(fileList))$isdir]  
    br = NULL
    fileNames = NULL
    cartNums = NULL
    
    for(fl in fileList){
      
      global_list = ls( envir = .GlobalEnv )
      
      print(basename(fl))
      
      re = runScript( fl, NULL , FALSE , NULL )
      
      if(!is.null(re)){
        
        fname =  file.path( dirname(fl) , "AcResult.txt" )
        
        br = rbind(br,re$variables)
        ffilename = basename(fl)
        fileNames = c(fileNames,ffilename)
        fCartNum = getCartNum(basename(fl))
        cartNums  = c(cartNums,fCartNum ) 
        
        print("XXXXXXXxxxxxxxxxxxxxxxxxxxx")
        print(ls())
        
        sink( fname , append = T  )
        
          cat( paste0( paste0 ( c( fCartNum , re$variables ),collapse = "," ),"\n" ) )
        
        sink()
        
        renames  = re$vnames
        rm(re)
        
      }
      
      
      current_list = ls( envir = .GlobalEnv )
      rm_list = current_list[!( current_list  %in% global_list ) ] 
      rm(list = rm_list , envir = .GlobalEnv )
      
    }
    
    br = data.frame(br)
    colnames(br) = renames
    br = data.frame(br,fileName = fileNames)
    br = data.frame(br,CartNum = cartNums)
    write.csv(br,paste0(dirpath,"\\ResultsTable",timeStemp,".csv")) 
    
  
  }
  
  
  runBatch1 <- function( ScriptToRun )
  {
    
    bScriptInCommand = FALSE
    dirpath = choose.dir(caption = "Select floder wit the list of ..._events.csv files")
    
    timeStemp = gsub("-","_",gsub(":","_",Sys.time()))
    
    fileList = dir(dirpath,full.names = T,pattern = ".csv")
    
    fileList = fileList[!(file.info(fileList))$isdir]  
    br = NULL
    fileNames = NULL
    cartNums = NULL
    
    #fl  = fileList[1] #remove
    
    for(fl in fileList){
      
      global_list = ls( envir = .GlobalEnv )
      
      print(basename(fl))
      re = runScript( fl, ScriptToRun , FALSE , NULL )
      if( !is.null(re) ){
      
        br = rbind(br,re$variables)
        fileNames = c(fileNames,basename(fl))
        cartNums  = c(cartNums,getCartNum(basename(fl)))
        renames = re$vnames
        rm(re)
      }
      
      current_list = ls( envir = .GlobalEnv )
      rm_list = current_list[!( current_list  %in% global_list ) ] 
      rm(list = rm_list , envir = .GlobalEnv )
    }
    
    br = data.frame(br)
    colnames(br) = renames
    br = data.frame(br,fileName = fileNames)
    br = data.frame(br,CartNum = cartNums)
    write.csv(br,paste0(dirpath,"\\ResultsTable",timeStemp,".csv")) 
    
  }
  
  
  # Run Methodes
  # Use input command line switches 
  # Default s (Run the Script where the second arg is the target events csv file )
  
  ScriptFilePath = NULL 
  
  switch( switchv,
         
         b = { print('run batch')
             runBatch()
             
         } ,
         b1={ 
           
           print( 'run batch1' )
           runBatch1(args[ 3 ] )
         },
         
         s ={ print('run script s')
           
           runResult = runScript( f, NULL, FALSE , NULL )
           reflattenSummary = flattenSummary( runResult$Summarypath  )
           
           if( !is.null( reflattenSummary$dirpath ) ){
             
             sink( GlobalResultsPath ,append = T ) 
             
             #cat( paste0( "@Start@Time;",Sys.time(),reflattenSummary$strings , "@End\n" ) )  #REMOVE
              cat( reflattenSummary$strings )  
             
             sink()
             
             #write only if there is error and QC log should be written
             if( bGlobalQC == 1 ){
               
               writeToQcLog( reflattenSummary , GlobalQcPath )
               
             }
           }
           
         },
         w ={ print('run script w')
           f <- args[2]
           ScriptFilePath <- args[3]
           
           runResult =  runScript( f, ScriptFilePath, FALSE , NULL )
           
           reflattenSummary = flattenSummary( runResult$Summarypath  )
           
           if( !is.null( reflattenSummary$dirpath ) ){
             
             sink( GlobalResultsPath ,append = T ) 
             
                #cat( paste0( "@Start@Time;",Sys.time(),reflattenSummary$strings , "@End\n" ) )  #REMOVE
                cat( reflattenSummary$strings )  
             
             sink()
             
             #write only if there is error and QC log should be written
             if( bGlobalQC == 1 ){

               writeToQcLog( reflattenSummary , GlobalQcPath )

             }
           }
         },
         sq ={ print('run sequnce')
               runSequnce( FALSE )   
         },
         fmo ={ print('run sequnce form list')
                runSequnce( TRUE )
         },
         h ={ print('run script')
           
           f <- args[2]
           ScriptFilePath <- args[3]
           #bfmoFlag = TRUE
           
           runResult =  runScript( f, ScriptFilePath, bfmoFlag , NULL )
           
           reflattenSummary = flattenSummary( runResult$Summarypath  )
           
           if( !is.null( reflattenSummary$dirpath ) ){
             
             sink( GlobalResultsPath ,append = T ) 
             
              cat( reflattenSummary$strings )    
             
             sink( )
             
             if( bGlobalQC == 1 ){

               writeToQcLog( reflattenSummary , GlobalQcPath )

             }
             
           }
           
         },
         
         sf ={ print('run script sf')
           f <- args[2]
           runResult = runScript( f, NULL, TRUE , NULL )    
         },
         
         {
           print('no switch !unable to run')
         } #default Error
  )
