#!/usr/bin/env Rscript
r <- getOption("repos")             # hard code the US repo for CRAN
r["CRAN"] <- "http://cran.us.r-project.org"
options(repos = r)
rm(r)
install.packages('shiny', lib="~/R/x86_64-redhat-linux-gnu-library/3.6")
install.packages('httr', lib="~/R/x86_64-redhat-linux-gnu-library/3.6")
install.packages('cli', lib="~/R/x86_64-redhat-linux-gnu-library/3.6")
install.packages('usethis', lib="~/R/x86_64-redhat-linux-gnu-library/3.6")

install.packages("shiny.router", lib="~/R/x86_64-redhat-linux-gnu-library/3.6")
