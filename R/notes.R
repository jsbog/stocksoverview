
### EXAMPLE:
# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#hello <- function() {
#  print("Hello, world!")
#}



### NOTES:
conc <- seq(1:10)
OD <- seq(1:10) + rnorm (10)

# didn't work
calib(conc, OD)

# use namespace of package and it works
stocksoverview:::calib(conc, OD)

# to resolve this we have to export the function (see f_calib.R, important
# to do it the way it is done there so 1st line is title, 2nd line blanco
# and 3th line @export). Afterwards then (1) More and Document (now we see the
# namespace is changed) and then (2) Install en Restart

# now it works
calib(conc, OD)
# and also this works
?calib

library(openxlsx)
library(tidyverse)
linegraph_all("rendement.xlsx")

# Use '@importFrom stats lm to import the lm function from stats package.
# So always import all functions that you need.
# Also add 'Imports: stats' in Description file!

# We could also just put all @importFrom statements in one R-script instead of
# doing it for every function

# If you have a function which doesn't need explanation or a help page we can
# get rid of the the roxygen syntax so we are not bothered by the warning that
# the help page is not completed. (Perhaps just import in a different R-script
# and that is it.)

# Another possibility: \code{\link{function_name}} to refer to another help
# page and perhaps also add @seealso \code{\link{function_name}} in the syntax.

# create source package in More and Build source packages
# Create binary packages in More and Build binary package (for this we don't
# need RTools, in contrary to the source package.)
