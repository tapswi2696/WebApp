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
library(plotly)

termData <- load(file = "/Users/sp/Desktop/CT/xls/WebApp/Alldata.RData")

grati <- data.frame("SN" = 1:3, 
                    "Contributor.List" = c("Parth Shah","Vishal Zaveri","Toral Patel"), 
                    "Email" = c("tapswi2696@gmail.com", "vbzaveri1@gmail.com","toral2306@gmail.com"),
                    "Role" = c("Product Owner & Developer","Developer & Technical Architect","Feature Product Owner & Technical Architect"),
                    "Phone" = c("Based on scheduled appointments only","Based on scheduled appointments only","Based on scheduled appointments only"))



