# 📱 Smartphone Market Analysis & Smart Shopping Assistant (2026)

Welcome to the repository for the **Smartphone Market Analysis** project! This end-to-end data analytics system acts as an unbiased, data-driven "smart shopping assistant." By focusing on advanced market segmentation and dynamic median-filtering, this project cuts through aggressive commercial marketing hype to expose true hardware value across multiple pricing tiers.

---

## 📊 Visual Dashboard Preview
I designed the interactive dashboard using a high-contrast, optimized **Dark Mode** "app-like" interface. The layout tracks real-time specification values, market performance medians, and hardware cluster metrics.

![Smartphone Market Analysis Power BI Dashboard]
<img width="1374" height="739" alt="17798775645795530348037900694507" src="https://github.com/user-attachments/assets/f920b785-8d2e-43ef-a2f4-030e3a4bd4fb" />



---

## 🛠️ Tech Stack & Tool Breakdown
To handle the data lifecycle cleanly, the project is structured across three distinct phases:
* **Data Cleaning & Preprocessing:** Done via **Microsoft Excel** to handle extreme price outliers, manage data imputation, and repair web scraping anomalies.
* **Database Engineering & Analytics:** Done via **Microsoft SQL Server (T-SQL)** using Common Table Expressions (CTEs) and window functions (`PERCENTILE_CONT`) to extract multi-variable performance insights.
* **Interactive Visual Architecture:** Done via **Microsoft Power BI** to create a custom, responsive, mobile app-like Dark Mode dashboard panel.

---

## 🚀 Quick Access Project Resources

To jump directly into any specific technical component, compiled data file, or comprehensive documentation of this project, use the live repository resource links below:

* 📊 **[Click Here to Download the Interactive Power BI Dashboard File (.pbix)](https://github.com/getkewar/smartphone-market-analysis/blob/2f6ab4a18c326a04c6dcd96a405ed2b16baca051/DashBoard/smartprix_smartphones_april_2026.pbix)**
* 📂 **[Click Here to Open the Full SQL Analysis Query Script (.sql)](https://github.com/getkewar/smartphone-market-analysis/blob/2f6ab4a18c326a04c6dcd96a405ed2b16baca051/SQL_File/smartprix_smartphones_april_2026.sql)**
* 📄 **[Click Here to Read the Full Written Project Report (PDF Document)](https://github.com/getkewar/smartphone-market-analysis/blob/2f6ab4a18c326a04c6dcd96a405ed2b16baca051/Project_Report/DOC-20260527-WA0000.%20(1).pdf)**
* 🧼 **[Click Here to View the Polished Clean Dataset (CSV File)](https://github.com/getkewar/smartphone-market-analysis/blob/2f6ab4a18c326a04c6dcd96a405ed2b16baca051/Clean_csv/smartprix_smartphones_april_2026_my_clean.csv)**
* 📂 **[Click Here to View the Original Unclean Dataset (Kaggle Source)](https://github.com/getkewar/smartphone-market-analysis/blob/2f6ab4a18c326a04c6dcd96a405ed2b16baca051/Kaggle_csv/smartprix_smartphones_april_2026.csv)**

---

## 🧼 Data Cleaning Highlights
Real-world data is messy. Excel was used to perform critical data-integrity transformations on **979 distinct smartphone profiles** without destroying the sample sizes:
* **Outlier Filtration:** Permanently excluded 18 extreme luxury smartphones (such as the ₹489,990 Vertu) that heavily skewed statistical calculations, successfully stabilizing the market price average down to a realistic ₹34,385.
* **Scraper Repair:** Successfully caught critical errors where diagonal display metrics (e.g., `6.2`) were accidentally pulled into the battery cell capacity column for select Apple iPhone devices, manually restoring them back to accurate 4000/4500 mAh hardware ratings.
* **Standardization:** Fixed text formatting anomalies, grouping split gaming brand lines under uniform labels (e.g., `Redmagic`) and cleaning naming formats across various mobile processors.

---

## 💻 SQL Analytical Deep-Dive
Instead of pulling random lists, custom mathematical logic was applied to partition the smartphone market across four strict budget tiers (*Budget, Mid-Range, Premium, and Flagship*). Key database topics solved include:
* **The Deal Finders:** Segmenting models into performance groups such as *Value Kings*, *Overpriced Devices*, and *Performance Beasts*.
* **Above-Median Smart Filters:** Isolating the exact devices within each budget category that beat the market middle-point (median) line for processor speed, total RAM block capacity, battery charging speed, and camera megapixel ratios.

---

## 📁 Repository Folder Structure
Your local project directory layout is accurately mapped into the repository branches as follows:
* `Clean_csv/` — Contains the final clean spreadsheet ready for database loading.
* `Kaggle_csv/` — Stores the raw original web-scraped smartphone dataset source.
* `DashBoard/` — Holds the interactive `.pbix` Power BI visual dashboard file.
* `SQL_File/` — Contains the structured `.sql` analytical and median query scripts.
* `Project_Report/` — Stores the comprehensive compiled final evaluation report in PDF format.
