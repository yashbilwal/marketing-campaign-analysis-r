# 📊 Customer Marketing Campaign Analysis

**Project Type**: Customer Segmentation, Marketing Analytics  
**Tools Used**: R, dplyr, ggplot2, lubridate, cluster, factoextra  
**Author**: Yashkumar Bilwal  
**Status**: Completed ✅

---

## 📌 Project Overview

This project is an end-to-end customer segmentation and marketing analysis using real-world-style data from a Portuguese retail company. The dataset contains information about customer demographics, purchase history, and responses to multiple marketing campaigns — both online and offline.

The objective is to segment customers based on their behavior and demographics, evaluate campaign effectiveness, and recommend targeted marketing strategies to improve engagement and ROI.

---

## 🎯 Business Objective

> "Who are our most valuable customers, and how can we engage them better across online and offline channels?"

Retail stakeholders want to identify:
- Which customer segments are most profitable?
- How marketing campaigns are performing across demographics and channels?
- What strategies can re-engage passive or low-spending customers?

---

## 🧭 Project Workflow

1. **Ask** – Define stakeholder-driven business questions  
2. **Prepare** – Import, clean, and structure the data  
3. **Process** – Handle missing values, transform variables  
4. **Analyze** – Perform segmentation, feature engineering, and RFM-style grouping  
5. **Visualize** – Generate insightful charts with ggplot2  
6. **Share** – Communicate findings, insights, and business recommendations

---

## 🛠 Feature Engineering Highlights

| Feature             | Description                                   |
|---------------------|-----------------------------------------------|
| `Age`               | Calculated from Year_Birth                    |
| `Customer_Tenure`   | Number of years since enrollment              |
| `TotalSpend`        | Combined spend across all product categories |
| `TotalChildren`     | Sum of Kidhome + Teenhome                     |
| `CampaignsAccepted` | Total number of campaigns accepted            |
| `EngagementScore`   | Custom metric based on spend, visits, campaigns|
| `AgeGroup` & `IncomeBracket` | Binned categories for analysis       |

---

## 📈 Key Business Insights

1. **Cluster 1** (high-income, older adults) are top spenders and highly responsive to campaigns — especially wine and meat products.
2. **Younger customers** prefer web/catalog purchases but show lower engagement and spend.
3. **Seniors and families with children** are under-engaged and require reactivation strategies.
4. **Customer tenure** positively correlates with loyalty and total spend.

---

## 💡 Strategic Recommendations

- 🎯 Personalize marketing campaigns based on cluster behaviors and demographics  
- 💰 Focus premium offers on high-spend clusters (Cluster 1)  
- 🔄 Launch re-engagement campaigns for low-responders (Cluster 3 & 4)  
- 📊 Use `EngagementScore` to drive targeting, retention, and upsell strategies  
- 🛍️ Optimize offers for web and catalog channels — especially for younger, digital-first customers

---

## 📦 Dataset

- **Name**: Marketing Campaign Dataset  
- **Source**: [Kaggle - Rodolfo Saldanha](https://www.kaggle.com/datasets/rodsaldanha/arketing-campaign)  
- **Size**: 2,239 rows × 29 columns  
- **Domain**: Retail, Marketing, Customer Analytics

## “Data without action is just noise — this project turns insights into impact.”

## Let's Connect 
- **💼 LinkedIn**: [Yash Bilwal](https://www.linkedin.com/in/yash-bilwal-4b38b4203/)
- **🖥️ Portfolio**: [yashbilwal.app](https://yashbilwal.vercel.app/)
- **✉️ yashkumarbilwal@gmail.com**
