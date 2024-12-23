# Analysis of Variance (ANOVA)

This project involves analyzing a dataset of counties across six Midwestern states to explore variance in educational attainment (`percollege`) based on state and density categories. Using statistical techniques such as **Levene's Test**, **One-Way ANOVA**, **Two-Way ANOVA**, and **Tukey HSD**, we identify significant differences between groups.

---

## Objectives
1. Perform variance analysis to understand the differences in `percollege` across states and density categories.
2. Validate assumptions using Levene's Test for homogeneity of variances.
3. Utilize One-Way and Two-Way ANOVA to identify significant mean differences.
4. Visualize results using Tukey HSD plots.

---

## Dataset Overview
The dataset contains:
- **Variables**: `state`, `popdensity`, `density.category`, `percollege`, and `inmetro`.
- **Source**: Contains data on 437 counties in six Midwestern states.

---

## Analysis Steps
### 1. Data Preparation
- Extract relevant variables: `state`, `popdensity`, `density.category`, `percollege`, `inmetro`.
- Create a random sample of 250 rows with proportional representation from each state.
- Convert categorical variables (`state`, `density.category`, `inmetro`) into factors.

### 2. Descriptive Analysis
- Generate the structure of the sampled data using `str()`.
- Count entries from each state using `table()`.

### 3. Variance Analysis
#### a. Levene's Test
- Determine if variances in `percollege` are equal across states and density categories.

#### b. One-Way ANOVA
- Test if `percollege` means differ significantly across:
  - **States**
  - **Density Categories**
- Perform Tukey HSD to identify pairwise differences.

#### c. Two-Way ANOVA
- Evaluate the combined effect of `state` and `density.category` on `percollege`.
- Conduct Tukey HSD to highlight specific differences.

---

## Results
### Levene's Test
- **Across States**: P-value > 0.05, no significant variance differences.
- **Across Density Categories**: P-value < 0.05, significant variance differences.

### One-Way ANOVA
- **States**:
  - Significant differences in mean `percollege` (P-value < 0.001).
  - Pairwise differences:
    - WI > IN, WI > OH, MI > IN.
- **Density Categories**:
  - Significant differences in mean `percollege` (P-value < 0.001).
  - Pairwise differences:
    - `250 to 749 > 100 to 249`.
    - `750 and Above > 50 to 99`.

### Two-Way ANOVA
- Both `state` and `density.category` significantly affect `percollege` (P-value < 0.001).
- Interaction effects not explored in detail but accounted for.

---

## Visualizations
1. **Boxplots**:
   - `percollege` distribution by `state` and `density.category`.
2. **Tukey HSD Plots**:
   - Highlight pairwise mean differences with confidence intervals.

---

## Tools Used
- **R**:
  - `rio` for data import.
  - `car` for Levene's Test.
  - `aov` for ANOVA.
  - `TukeyHSD` for post-hoc analysis.
- **Visualizations**:
  - Base R plots for boxplots and Tukey HSD results.

---

## Usage
1. **Prerequisites**:
   - Install required R packages: `rio`, `car`.
   - Load the dataset `6304 Module 9 Assignment Data.xlsx`.

2. **Run Analysis**:
   - Follow the provided code to replicate the ANOVA analysis.

---

## Future Improvements
1. Explore interaction effects between `state` and `density.category`.
2. Incorporate additional demographic or economic variables for richer insights.
3. Automate data visualization for scalable reporting.

---


