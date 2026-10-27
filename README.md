# Autism Prevalence Disparities Among Asian American Subgroups (2007–2015 Birth Cohorts)

## Overview
This project examines variation in recorded autism spectrum disorder (ASD) prevalence across Asian American subgroups and birth cohorts from 2007 through 2015. It combines descriptive prevalence estimates, subgroup-specific temporal trends, and multivariable logistic regression.

**Research question:** How does recorded ASD prevalence differ between Asian American subgroups, and how does it change across birth cohorts?

## Data and outcome
- Linked birth records and developmental-services (DDS) records; ASD cases are identified from a recorded DDS autism designation.
- Subgroups include Chinese, Japanese, Korean, Vietnamese, Cambodian, Thai, Laotian, Hmong, Indian, Filipino, and other classifications represented in the source data.
- Individual-level records are **restricted** and are not distributed in this repository.
- The precise geographic jurisdiction, data custodian, and case-ascertainment details should be confirmed from the original data-use documentation before citing this analysis.

**Interpretation:** Recorded service-system ASD prevalence is not necessarily equivalent to population-wide ASD prevalence; differences in access, identification, and enrollment may affect comparisons.

## Methods
1. Construct the ASD indicator and extract birth year from linked records.
2. Estimate subgroup-by-year prevalence and **95% Wilson confidence intervals**.
3. Fit logistic regression with **Chinese** as the subgroup reference:
   - **Model A:** subgroup, child sex, birth year, and maternal age.
   - **Model B:** Model A plus maternal education, birth order, and WIC participation.
4. Conduct within-subgroup logistic trend tests (`ASD ~ Year`).

## Selected findings
| Subgroup | Reported birth-cohort pattern | Trend test |
|---|---|---|
| Filipino | Approximately 1.2% (2007) to 2.3% (2014) | p < 0.001 |
| Vietnamese | Approximately 1.6% to 2.1–2.2% over the reported period | p = 0.0008 |
| Chinese | Approximately 1.0% to 0.6–0.7% over the reported period | p < 0.001 |
| Korean | No statistically significant linear trend at the 0.05 threshold | p = 0.063 |

The reported figures are descriptive and approximate. The figure below illustrates selected subgroup trends; the regression scripts generate adjusted odds ratios, but numerical Model B estimates are not asserted here without a verified exported model table.

![ASD prevalence by birth cohort](results/ASD%20prevalence%20trends.png)

## Repository structure
```text
scripts/
  01_setup_packages.R
  02_data_preparation.R
  03_descriptive_analysis.R
  04_trend_analysis.R
  05_regression_models.R
results/
  ASD prevalence trends.png
data/
  (restricted individual-level records not published)
```

## Reproducibility
1. Open the project in **R** and install the packages referenced in `scripts/01_setup_packages.R`.
2. Set the local restricted-data input path in `scripts/02_data_preparation.R` to a permitted copy of the linked dataset.
3. Execute scripts `01` through `05` in numerical order, preferably in the same R session.
4. Check output paths before running: `05_regression_models.R` writes `model_results.docx` to the working directory, and existing plots may need to be saved explicitly.

**Code note:** In `04_trend_analysis.R`, the optional plot subtitle references `ptrend$p_text`, a column not created in the shown script. Create/formulate that label before running the final faceted plot. This does not affect the preceding trend model calculations.

## Limitations
Observational prevalence comparisons do not demonstrate causal subgroup effects. Birth-cohort follow-up and ascertainment, service access, subgroup sample sizes, and unmeasured characteristics may affect recorded prevalence and trends. Restricted source data prevents fully independent reproduction without authorized access.

## Data availability
No restricted or personally identifiable source records are supplied. Contact the relevant data custodian for access procedures and approvals.
