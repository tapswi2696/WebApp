rm(list = ls())
#setwd("~/Desktop/CT/xls/WebApp")
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
library(plotly)
library(shinydashboard)
library(shinyglide)
library(slickR)

load(file = "Alldata.RData")
load(file = "AlldataIg.RData")
termData <- Alldata
IgData <- Alldataig
termData$last.update <- as.character.POSIXt(termData$last.update)
rm(Alldata)

grati <- data.frame("SN" = 1:3, 
                    "Contributor.List" = c("Parth Shah","Vishal Zaveri","Toral Patel"), 
                    "Email" = c("tapswi2696@gmail.com", "vbzaveri1@gmail.com","toral2306@gmail.com"),
                    "Role" = c("Product Owner & Developer","Developer & Technical Architect","Feature Product Owner & Technical Architect"),
                    "Phone" = c("Based on scheduled appointments only","Based on scheduled appointments only","Based on scheduled appointments only"))
