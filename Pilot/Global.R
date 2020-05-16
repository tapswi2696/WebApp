rm(list = ls())
library(readxl)
library(shiny)
library(shinythemes)
library(tidyverse)
library(lubridate)
library(dplyr)
library(haven)
library(DT)
library(units)
library(shinyWidgets)
library(data.table)
library(stringr)
library(stringi)

termData <- read_sas("final.sas7bdat")
#/Users/sp/HandyCTWebApp/Pilot/
termData <- termData %>% 
  rename(CT.Type = origin,
         Codelist.extensible = codelistext,
         CDISC.Synonym = cdiscsyno,
         L1.Code = codelistcodex,
         L1.Label = codelistnamex,
         L1.Name = cdiscsubvalx,
         L2.Code = code,
         L2.Name = cdiscsubval,
         CDISC.Definition = cdiscdef,
         NCI.Preferred.Term = NCIPT,
         VerDate = verdate)

grati <- data.frame("SN" = 1:3, 
                    "Contributor.List" = c("Parth Shah","Vishal Zaveri","Toral Patel"), 
                    "Email" = c("tapswi2696@gmail.com", "vbzaveri1@gmail.com"," -- "),
                    "Phone" = c("Based on scheduled appointments only","Based on scheduled appointments only","Based on scheduled appointments only"), 
                    "Task/Role" = c("Design, Development, Maintenance","Backend Dataset Validator, Techical Review","Design, Technical Review, Quality Management"))



