# 📊 Customer Behavior Analysis

## 📌 Project Overview
This project focuses on **end-to-end data analysis** of customer shopping behavior using **Python, PostgreSQL, SQL, and Power BI**.  
The goal is to clean, transform, analyze, and visualize customer data to derive **actionable business insights**.

The dataset contains **10,000 rows** of customer purchase records and covers demographics, purchasing patterns, discounts, subscriptions, and payment behavior.

---

## 🧰 Tech Stack Used

- **Python**
  - pandas (data cleaning & transformation)
  - numpy (numerical operations)
- **PostgreSQL**
  - pgAdmin 4
- **SQLAlchemy**
  - Data transfer from Python to PostgreSQL
- **Power BI**
  - Data visualization & dashboarding
- **GitHub**
  - Version control & project documentation

---

## 📂 Dataset Description

The dataset includes the following key columns:

- Customer details: `customer_id`, `age`, `gender`, `age_group`
- Product details: `item_purchased`, `category`, `size`, `color`
- Purchase data: `purchase_amount`, `previous_purchases`, `frequency_of_purchases`
- Discounts & promotions: `discount_applied`, `promo_code_used`
- Subscription & logistics: `subscription_status`, `shipping_type`, `payment_method`
- Contextual data: `season`, `location`, `review_rating`

**Total records:** 10,000 rows

---

## 🧹 Data Cleaning & Preprocessing (Python)

Using **pandas** and **numpy**, the following steps were performed:

- Removed unwanted characters (e.g., `\r`) from columns
- Handled missing and inconsistent values
- Converted data types for numerical and categorical fields
- Created derived columns such as `age_group`
- Standardized categorical values (Yes/No fields)
- Ensured schema compatibility for PostgreSQL upload

---

## 🗄️ Data Storage (PostgreSQL)

- Cleaned data was exported from Python to **PostgreSQL** using **SQLAlchemy**
- Database managed using **pgAdmin 4**
- Tables were structured to support analytical queries
- SQL queries were written to perform:
  - Aggregations
  - Joins
  - Subqueries
  - Window functions
  - KPI calculations

---

## 🧠 SQL Analysis Performed

Some key analyses include:

- Total and average sales by category, season, and location
- Discount and promo code impact on revenue
- Customer segmentation by age group and subscription status
- Top-performing products and categories
- Payment method and shipping preference analysis
- Ranking customers and products using window functions
- KPI metrics for executive dashboards

---

## 📈 Data Visualization (Power BI)

The analyzed data was exported to **Power BI** to build an interactive dashboard using:

### Visual Elements Used
- **Bar Charts** – category sales, payment methods
- **Pie / Donut Charts** – discount and subscription distribution
- **Cards (KPIs)** – total revenue, average purchase, customer count
- **Slicers** – season, category, gender, subscription status

### Dashboard Capabilities
- Interactive filtering using slicers
- Drill-down analysis
- Business-friendly KPIs
- Clear storytelling with data

---

## 📊 Key Business Insights

- Certain categories rely heavily on discounts to drive sales
- Subscribers show higher average spending than non-subscribers
- Seasonal trends significantly impact purchase behavior
- Promo codes influence customer purchasing frequency
- Payment and shipping preferences vary across age groups

---

## 📁 Project Structure

```text
customer_behavior_analysis/
│
├── data/
│   └── customer_data.csv
│
├── sql/
│   └── analysis_queries.sql
│
├── notebooks/
│   └── d
