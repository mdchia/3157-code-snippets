#!/bin/bash

# Updates to the standard class rep install system.

# initial testing
Rscript -e 'install.packages("tidyverse", repos="http://cran.csiro.au/")'

echo('Updates complete!')
echo('Press enter to finish')
read
