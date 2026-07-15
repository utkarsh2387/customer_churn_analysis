## Customer Churn & Revenue Leakage Analysis

## Business Problem
Customer churn(26%) leads to significant revenue loss. This project analyzes churn drivers and identifies high-risk customer segments to support data-driven retention strategies.

## Project Overview
Analysis of 7,043 telecom customer records to identify churn drivers and quantify the impact of a targeted retention lever (contract-type conversion) using a logistic regression model.

### Key Steps in the Project

1) Data Cleaning: Identified that TotalCharges was stored as text with blank values for zero-tenure customers; converted to numeric and imputed missing values as MonthlyCharges × tenure.
2) Exploratory Data Analysis: Generated 11 visualizations (histograms, heatmaps, box plots) to surface churn patterns across tenure, charges, and contract type before any modeling.
3) Feature Engineering: Selected 12 features with a clear business rationale (tenure, charges, contract type, internet service, payment method, security/support add-ons, demographics); one-hot encoded categoricals, standardized numeric features.
4) Model Training: Built a logistic regression model — chosen specifically for coefficient interpretability over black-box predictive power — using an 80/20 stratified train/test split.
5) Model Evaluation: Assessed performance using accuracy, AUC, precision, and recall (not accuracy alone, given class imbalance).
6) Retention Scenario Simulation: Used the trained model to simulate a targeted intervention — shifting month-to-month customers to one-year contracts — and measured the projected change in churn probability, holding all other customer attributes constant.

### Tools Used
- SQL (MySQL)
- Python (Pandas, Matplotlib, Seaborn)
- Power BI

### Key Insights
- Month-to-month contracts have the highest churn rate
- Low-tenure customers are more likely to churn
- High monthly charges correlate with increased churn
- A small customer segment contributes to majority of revenue loss

## 📊 Dashboard Overview
![Dashboard Overview](dashboard/churn.png)

### Live Dashboard : [Link](https://app.powerbi.com/groups/06cdec44-3220-48a9-87bc-6d3241c1bca6/reports/65daef2f-cd8b-4527-b6d4-20a948c632bf/bba25b9641cb9af9ab42?ctid=2bb44e71-1601-4af2-a592-4224ddcfb1c3&experience=power-bi)

### Recommendations
- Promote long-term contracts
- Focus on early-tenure engagement
- Target high-revenue churn segments

