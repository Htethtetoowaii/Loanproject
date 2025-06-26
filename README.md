# 🏦 Loan Approval Prediction Using SAS

This project predicts loan approval decisions using SAS-based data analysis, cleansing, and logistic regression modeling. It uses both rule-based logic and statistical techniques to clean, explore, and model training and testing datasets.

---

## 📁 Dataset Overview

- **Source:** Internal SAS library `OCTDAP`
- **Datasets:**
  - `TRAINING_DS` — Training dataset for model building
  - `TESTING_DS` — Testing dataset for prediction
- **Target Variable:** `loan_approval_status` (`Y` for approved, `N` for not approved)

---

## 🔍 Project Features

- 📊 Univariate and Bivariate Analysis (Categorical & Continuous Variables)
- 🔧 Missing Value Imputation:
  - Mode for Categorical Variables (e.g., gender, employment)
  - Mean for Continuous Variables (e.g., loan amount, loan duration)
- 🛠️ Data Cleaning:
  - Removal of special characters (e.g., '+' in `family_members`)
  - Frequency checks for missing data
- 🧠 Logistic Regression Modeling:
  - Model trained with `PROC LOGISTIC`
  - Prediction generated using `SCORE` on testing data
- 📈 Visualizations:
  - Bar Charts (`PROC SGPLOT`)
  - 3D Pie Chart (`PROC GCHART`)
- 📋 Reporting:
  - Generated with `ODS PDF`, `PROC REPORT`, and SAS macros
  - Gender- and location-specific logic-based commentaries

---

## 📄 Technologies Used

- **Language:** SAS
- **Tools:** SAS Studio, ODS PDF, SQL procedures
- **Techniques:** Logistic Regression, Macro Programming, Conditional Logic

---

## 📦 Output

- PDF reports with predicted loan statuses
- Charts and tables grouped by loan location, family size, and more
- Final predicted dataset: `TESTING_LAS_Predicted_DS`

---

## 📄 Notable Files

- `my_dap_projects_tp081940.sas` — Main SAS program (analysis, modeling, reporting)
- `report1.pdf`, `report2.pdf` — Final outputs via `ODS PDF`
