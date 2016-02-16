### Follow along and check the results of every step.

library(devtools)

# Make sure your working directory is where
# you think it is.
getwd()


### Create the package framework
create(path = "demo2")
# This creates a folder for your package
# The important components are DESCRIPTION and NAMESPACE files
# as well as subdirectory called "R" for your R code.

# Once the package is created, things will be easier if
# the package folder itself is your working directory
setwd("demo2")
getwd() # just making sure we're good, this should be the package folder


### Add a function
# Add the samp function to the package.
# Open a new R script, paste in the code below,
# and save it as "samp.r" inside the "R" directory of your package


#' Quick random sample of a data frame
#'
#' \code{samp} can be used to quickly check on a data frame.
#' @param x data frame to sample from
#' @param n positive integer number of rows to return in the sample
#' @return Returns a data frame
#' @examples
#' samp(mtcars)
#' @export
samp <- function(x, n = 10) {
    if (n >= nrow(x)) return(x)
    return(x[sample(1:nrow(x), size = n), ])
}


### See the documentation in action!
# (optional - this can be done later)
# Run the devtools::document() command to process
# the roxygen comments and update your NAMESPACE

document()

# You should get a nice note saying
#    Updating demo2 documentation
#    Loading demo2
#    First time using roxygen2. Upgrading automatically...
#    Updating roxygen version in  C:\Dropbox\statr\statr\demo2/DESCRIPTION 
#    Writing NAMESPACE
#    Writing samp.Rd

# And you should also have a new folder inside your package called "man"
# Inside the "man" folder is a file called "samp.Rd"
# You can open it up and "preview" the documentation in RStudio


### Package-level documentation

# Once again, devtools creates a template for us

use_package_doc()

# creates demo2-package.r file in R directory
# We can edit it, fill out the description.
# The most recent recommendation is to replace the 

NULL

# line after the roxygen comments with the quoted string

"_PACKAGE"

# At this point, you can run document() again if you want 
# to see the demo2.Rd documentation file in the "man" directory.
# Make sure you saved your changes to demo2-package.r!!!

### Adding data to a package

# First get your data ready... maybe read it in, do some
# pre-processing. I'll make a modified copy of mtcars called mt

mt = mtcars
mt$model = row.names(mtcars)
row.names(mt) = 1:nrow(mt)
mt$cyl = factor(mt$cyl)
mt$carb = factor(mt$carb)
mt$gear = factor(mt$gear)

# When everything is ready, use devtools::use_data() to save 
# it in the package

use_data(mt)

# Creates "mt.rda" file in a new "data" directory.

# make sure to document the data in an .R file in the R directory!
# Add documentation to the demo2-package.r file, something like this:


#' mtcars data set with a shorter name and
#' better column types.
#' @docType data
#' @name mt
"mt"


# Once again, make sure your updates are **saved**, and 
# document!

document()

# Now you should have 3 .Rd files in the "man" folder:
#   1. demo2.Rd
#   2. mt.Rd
#   3. samp.Rd


### Add a vignette

# As always, devtools provides the template:

use_vignette(name = "demo2_sample_vignette")

# You can specify the name *of the .rmd file* - it does not need
# to match the official Title of the vignette.
# DO NOT use spaces in your vignette filename.

# You should now have a "vignettes" folder that has a 
# vignette with your file name in it.
# You can edit it like any other .Rmd document.


### Build the vignette(s)

# Make sure you've saved changes to your vignette .Rmd source, then

build_vignettes()

# This will compile the vignette and move the results to a
# new folder: inst/doc/
# Proofread there.


### Check for potential problems

check()

# This will result in *very* verbose output.
# It will (by default) update your documentation first,
# then set some environment variables, and go through
# a long list of checks.

# At this point, I have 2 Warnings:
#   1. non-standard license in my DESCRIPTION file
#   2. I don't have qpdf installed so if I had PDF vignette
#      (which I don't) it couldn't try to compress it.
# These are both very ignorable.

# On Windows, sometimes I have found that I need to run RStudio
# "as an administrator" (right-click while opening to see the option)
# to get it to work. I often have trouble accessing the log files
# in a temporary directory - they tend to have been deleted by Windows
# by the time I look for them. I just read the printed output instead :\



### Build the package

# Once everything is in place, you can build the package
# (which essentially just compresses it)

build()

# This should create a `.tar.gz` file in the same directory your package
# is in (one level up from the package). The `.tar.gz` file will be
# what you turn in for your final project.

# If you want to see what I will see, you can install it

setwd("..") # move the working directory one level up
install.packages("demo2_0.0.0.9000.tar.gz", repos = NULL, type = "source")
library("demo2")
