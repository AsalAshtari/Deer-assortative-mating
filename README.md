# Deer assortative mating
This repository contains the R code for organisation and viualization of data output from the _Populusancestry_ and _Estpost_ softwares.

**Files in this Repository**

### Code Files

- **Data_organization.R**

  This script organizes the output file from _Estpost_ and generates an organized table.

- **Correlation_test_and_plots.R**

  Performs correlation test betweeen mother and father q scores and generates plots.

- **Triangle_plots.R**

  Generates triangle plots to visualize the relationship between intersource ancestry (Q12) and estimated admixture (q scores).

### Data Files

- **mother_foetus_Qadmixture.txt**

  Contains output data from _Estpost_, used in 'Data_organization.R'

- **outputestpost_allQ12.txt**

  Contains output data from _Estpost_, used in 'Data_organization.R'

- **formatted_final_scores.txt**

  Organized intersource ancestry (Q12) and estimated admixture(q score) of fathers, mothers and progeny, used in                 'Correlation_test_and_plots.R' and 'Triangle_plots.R'.
