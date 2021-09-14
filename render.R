rm(list=ls())
# ------------------------------------
# Render: Rmd --> Html 
# ------------------------------------
.libPaths('/home/toto/R_library')
library(rmarkdown)
library(rmdformats)
library(knitr)
library(captioner)
library(rlang)  
library(vctrs)  
library(plotly)  
library(htmltools)
library(devtools)
library(ggmap)
library(shiny)

work.folder <- getwd()
listfile <- dir(work.folder,pattern="*.Rmd")

for (f in listfile){
    print(f)
    render(f)
}

print("OK")
