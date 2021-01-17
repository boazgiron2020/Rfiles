fListOfTest <-read.csv("C:/algrithm/CheckMartonForLowConcentration/DataFromDevice1004/ListOfTest.csv",header = T)
str(ListOfTest)

AllNewTest  = ListOfTest[as.POSIXct(ListOfTest$ResultTime, format = "%Y-%M-%d %H") > t050115 , ]

dim(AllNewTest)
errors = ListOfTest[ListOfTest$Success == 0,]

newerrors  = errors[as.POSIXct(errors$ResultTime, format = "%Y-%M-%d %H") > t050115 , ]

times = as.POSIXct(errors$ResultTime, format = "%Y-%M-%d %H")


str(errors)

as.POSIXct(errors$ResultTime, format = "%Y-%M-%d %H") > t050115

head(errors)

errors$ResultTime[1]

times<-as.Date(errors$ResultTime)
head(times)
times <- as.POSIXct(as.character(errors$ResultTime), format = "%Y-%M-%d %H")
max(times)
min(times)
errors$ResultTime
t050115 <- as.POSIXct("2015-01-05 14:16:16", format = "%Y-%M-%d %H")

[1:1000]
tail(times)
times
testdate1 <- as.POSIXct("2014-10-06 14:16:16", format = "%Y-%M-%d %H")
testdate2 <- as.POSIXct("2014-07-04 14:16:16", format = "%Y-%M-%d %H")
testdate2
testdate1
testdate2 > testdate1

testNumber = c(564,584,585,595,651) 
Error =  c("Stop test request. Cannula process disabled",
          "Inlet gas for Baseline : 2.147642,Fill baseline bag failed: Code: FillBag_CollectingTimeout",
          "Inlet gas for Baseline : 0.1837055,Fill baseline bag failed: Code: FillBag_ShortTimeoutCollectionDidntStart",
          "Stop test request. Cannula process disabled",
          "pair number 7,DOB ~ 1, High Delta Error : 0.8125577 firest Baseline c12 0.0006 see Attched Graph",
          "Second Test with same gas No Gas! Fill baseline bag failed: Code: FillBag_TooLowPressure",
          "Stop test request. Cannula process disabled",
          "Inlet gas for Baseline : 2.13531, Fill baseline bag failed: Code: FillBag_CollectingTimeout",
          "Inlet gas for Baseline : 0.1742477, Fill baseline bag failed: Code: FillBag_ShortTimeoutCollectionDidntStart",
          "Inlet gas for Baseline : 0.8560217, Stop test request. Cannula process disabled",
          "Inlet gas for Baseline : 0.8461822, Stop test request. Cannula process disabled",
          "NULL",
          "Stop test request. Cannula process disabled",
          "Inlet gas for Baseline : 1.830943, Fill baseline bag failed: Code: FillBag_CollectingTimeout",
          "Inlet gas for Baseline : 0.184226 , Fill baseline bag failed: Code: FillBag_ShortTimeoutCollectionDidntStart",
          "Inlet gas for Baseline : 0.8481173,Stop test request. Cannula process disabled",
          "Inlet gas for Baseline : 0.8408949,Stop test request. Cannula process disabled",
          "Stop test request. Cannula process disabled",
          "Stop test request. Cannula process disabled",          
          
          
          
          
          ) 

