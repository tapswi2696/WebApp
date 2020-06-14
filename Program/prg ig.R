rm(list = ls())
library(dplyr)
library(readxl)
library(lubridate)
library(tidyverse)
library(readxlsb)
library(shinyglide)
verbatimTextOutput()
#my version (change when you new version)
myvers <- 2
#file location 
root <-"/Users/sp/Desktop/CT/xls/Data/2020-05-08/Excel/"

# Read in Datasets 

ig2 <- read_xlsb(path = paste0(root,"sdtmig.xlsb"), sheet = 2)
ig3 <- read_xlsb(path = paste0(root,"sdtmig.xlsb"), sheet = 3)

ig3$Domain.Name[ig3$Domain.Name=="SUPP--"] <- "SUPPQUAL"

ig3$Domain.Label[ig3$Domain.Label=="Supplemental Qualifiers for [domain name]"] <- "Supplemental Qualifiers"

#Put additional Variables 
#a- origin 
#b- version date 
#c- interal version num for dataset intord
#d- my version 
mut <- function(df,a,b,c,d) {
    df %>%
    as_tibble() %>%
    mutate(origin = as.character(a) , verdate = as.character(b), intord=as.numeric(c), myver=as.numeric(myvers))
}

#Create parent dataset 
#adjust names 
parent <- ig3 %>% rename (Domain.Prefix=Domain.Name,
                          P.Observation.Class=Observation.Class,
                          P.Domain.Label=Domain.Label,
                          P.Domain.Structure=Domain.Structure)

child <- ig2 %>% rename (rt.var=Variable.Name..minus.domain.prefix.,
                         cdisc.notes=CDISC.Notes..for.domains..Description..for.General.Classes.)
rm(ig3,ig2)

#resort inorder to merge - it will be merge on this keys 
# verdate, origin,intord,myver,cdlstcd
Alldataig <- right_join(parent, child, by = "Domain.Prefix")

#Some house keeping work

Alldataig$last.update <- as.character.Date(Sys.Date())
Alldataig$srcinfo <- "The information is retrived from https://www.cdisc.org/"
rm(child,parent)

Alldataig$v2 <- paste0(Alldataig$Domain.Prefix,"-",Alldataig$P.Domain.Label)
Alldataig$Version.x <- paste0(Alldataig$Version.x,"(Draft Version)")

Alldataig <- Alldataig %>% 
  mutate(P.Prelab = if_else(Alldataig$Domain.Prefix == "SUPPQUALXX", Alldataig$Domain.Prefix, Alldataig$v2))


drop <- c("v2","Version.y")
Alldataig = Alldataig[,!(names(Alldataig) %in% drop)]

dir <-"~/Desktop/CT/xls/Data/2020-05-08/R"
setwd(dir)

save(Alldataig, file="AlldataIg.RData")

setwd("~/Desktop/CT/xls/WebApp")

save(Alldataig, file="AlldataIg.RData")



