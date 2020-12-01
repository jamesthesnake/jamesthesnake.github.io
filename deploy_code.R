if(!require("devtools")) install.packages("devtools")
if(!require("servr")) install.packages("servr") 
if(!require("knitr")) install.packages("knitr") 

library(servr)
#devtools::install_github("choux130/servr_2")
library(devtools)
#ls("package:servr")
#jekyll
#build_jekyll
#trace("jekyll",edit=TRUE)
#dev_mode()
servr::jekyll(dir = ".", input = c(".", "_source", "_posts"),
       output = c(".", "_posts", "_posts"),
       script = c("Makefile", "build.R"),
       serve = TRUE,
       command = "bundle exec jekyll build")
# command = "jekyll build"
# bundle exec jekyll serve? 

