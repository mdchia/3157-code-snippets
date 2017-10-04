#!/bin/bash

# Updates to the standard class rep install system.
R -e 'install.packages("tidyverse", repos="http://cran.csiro.au/")'

echo('Updates complete!')
echo('Press enter to finish')
read
