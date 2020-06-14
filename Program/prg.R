rm(list = ls())
library(dplyr)
library(readxl)
library(lubridate)
library(tidyverse)
library(readxlsb)
#my version (change when you new version)
myvers <- 2
#file location 
root <-"/Users/sp/Desktop/CT/xls/Data/2020-05-08/Excel/"

# Read in Datasets 
adam <- read_xls(path = paste0(root,"ADaM Terminology.xls"),sheet = 2)
cdash <- read_xls(path = paste0(root,"CDASH Terminology.xls"),sheet = 2)
xml <- read_xls(path = paste0(root,"Define-XML Terminology.xls"), sheet = 2)
protocol <- read_xls(path = paste0(root,"Protocol Terminology.xls"), sheet = 2)
sdtm <- read_xls(path = paste0(root,"SDTM Terminology.xls"), sheet = 2)
send <- read_xls(path = paste0(root,"SEND Terminology.xls"), sheet = 2)


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

adam <-  mut(adam,"ADAM","2020-03-27",1,myver)
sdtm <-  mut(sdtm,"SDTM","2020-05-08",2,myver)
send <-  mut(send,"SEND","2020-05-08",3,myver)
xml <-  mut(xml,"Define.XML","2020-03-27",4,myver)
protocol <- mut(protocol,"PROTOCOL","2020-03-27",5,myver)
cdash <-  mut(cdash,"CDASH","2020-05-08",6,myver)
#stake all together 
all <- bind_rows(adam,cdash,protocol,sdtm,send,xml)
#Clean up all dataframe - not required 
rm(adam,sdtm,send,xml,cdash,protocol,myvers)

#Create parent dataset 
parent <- all %>% filter(is.na(all$`Codelist Code`))
parent <- parent %>% select(-c(2,4),) %>% rename(`Codelist Code` = Code)

#Child Dataset 
child <- all %>% select(-c(3),) %>% filter(!is.na(all$`Codelist Code`)) 

#adjust names 
parent <- parent %>% rename (Extyn=`Codelist Extensible (Yes/No)`,
                            p.cdsubval=`CDISC Submission Value`,
                            p.cdsyno=`CDISC Synonym(s)`,
                            p.cddef=`CDISC Definition`,
                            p.ncipt=`NCI Preferred Term`,
                            cdlstcd=`Codelist Code`)

child <- child %>% rename (cdlstcd=`Codelist Code`,
                             cp.cdlstname=`Codelist Name`,
                             c.cdsubval=`CDISC Submission Value`,
                             c.cdsyno=`CDISC Synonym(s)`,
                             c.cddef=`CDISC Definition`,
                             c.ncipt=`NCI Preferred Term`)

#resort inorder to merge - it will be merge on this keys 
# verdate, origin,intord,myver,cdlstcd
Alldata <- right_join(parent, child, by = c("verdate","origin","intord","myver","cdlstcd"))

Alldata <- Alldata %>% arrange(intord,myver,origin,verdate,cdlstcd)

#Some house keeping work

Alldata <- Alldata %>% mutate(Extyn=recode(Extyn, 
                  "Yes"="Codelist value is extensible",
                  "No"="Codelist values is NOT extensible",
                  " "="Not Applicable/No Data present/Blank value found"))

Alldata$last.update <- Sys.Date()
Alldata$srcinfo <- "The information is retrived from https://www.cancer.gov/research/resources/terminology/cdisc"
rm(all,child,parent)
rm(mut)
setwd("Users/sp/Desktop/CT/xls/Data/2020-05-08/R")
save(Alldata, file="Alldata.RData")

setwd("Users/sp/Desktop/CT/xls/WebApp")
save(Alldata, file="Alldata.RData")



