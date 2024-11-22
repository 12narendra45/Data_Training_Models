
# Script to install all required R packages
packages <- c("e1071", "caret","rpart","rpart.plot","class","kernlab","ggplot")
# Check if packages are installed, if not install them
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

