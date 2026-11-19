[View Full Project Report](Report_Small_Hospitals_Seasonal_Disease_and_Resource_Analysis_Project)

# 1 Project Overview
## 1.1 Background and Context
Small hospitals routinely maintain a stringent audit of their resource usage, keeping track of seasonal trends in diseases to manage their inventory and optimise healthcare provision efficiency. In fact, they “often struggle to forecast demand for critical resources such as beds, ICU capacity, oxygen supply, and ventilators” (Shrivastava, 2026). By using Diya Shrivastava’s synthetic Hospital Operations Dataset (Unclean), this project will analyse patient admission and seasonal disease trends, as well as seasonal resource usage. Insights from this analysis will thus illuminate small hospitals’ current adequacies in resource management and help them better prepare for future surges in certain diseases and resource usage through the seasons.

## 1.2	 Project Requirements
### 1.2.1 Building the Data Warehouse (Data Engineering)
### 1.2.1.1 Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.
### 1.2.1.2 Specifications
•	Data Sources: Import Diya Shrivastava’s synthetic Hospital Operations Dataset (Unclean) dataset provided as a CSV file.
•	Data Quality: Cleanse and resolve data quality issues prior to analysis.
•	Integration: Design a user-friendly data model to prepare for analytical queries.
•	Scope: Focus on the latest dataset only; historicisation of data is not required.
•	Documentation: Provide clear documentation of the data model to support analytics team.
### 1.2.2 BI: Analytics and Reporting (Data Analysis)
### 1.2.2.1 Objective
Develop SQL-based analytics to deliver detailed insights into:
•	How Disease Affects Admission Metrics
•	Seasonal Admission Trends
•	Seasonal Disease Trends
•	Seasonal Resource Usage Trends
Develop a Power BI dashboard for non-technical users to easily understand detailed insights.

# 2 Dataset Description
The dataset comprises 22 columns and 5075 rows (excluding column title row) of patient visit records. The records span from January 2023 to December 2024. They are “synthetic but realistic” (Shrivastava, 2026).

# 3 Conclusion
This project involved the development of an end-to-end data analytics workflow, beginning with the construction of a SQL Server data warehouse using the Medallion Architecture. Raw datasets were ingested into the Bronze layer, cleaned and transformed in the Silver layer, and organised into analytical fact and dimension tables in the Gold layer. This established a structured foundation for subsequent exploratory data analysis (EDA) and analytical queries.
Through SQL-based analysis, the project examined hospital visit patterns across disease categories, patient demographics, readmission outcomes, length of stay and resource utilisation. The findings revealed notable differences across disease categories and seasonal periods. In particular, stroke and heart disease featured prominently in both readmission rates and average length of stay, while distinct seasonal distributions were observed across diseases such as dengue and influenza. Resource utilisation also exhibited differing seasonal peaks, with general bed occupancy and oxygen usage highest in winter, compared to ICU bed occupancy in autumn.
The analytical findings were subsequently translated into an interactive Power BI dashboard, presenting key metrics and patterns across hospital visits, patient and clinical characteristics, and resource utilisation. This enabled the exploration of relationships and variations across multiple dimensions through visual analysis.
Overall, the project demonstrates the application of data engineering, SQL-based data transformation, exploratory data analysis and business intelligence visualisation within a single analytical workflow. It also highlights the value of structuring and transforming raw data into meaningful analytical outputs that can support a more informed understanding of healthcare utilisation and resource planning.

# 4 Limitations
•	Synthetic dataset: The dataset contains simulated hospital records rather than actual patient or hospital data. Consequently, the findings do not accurately reflect real-world healthcare utilisation, patient outcomes or hospital operations.
•	Limited time period: The dataset covers January 2023 to December 2024, providing only two years of observations. This limits the ability to identify long-term trends or establish whether seasonal patterns persist over multiple years.
•	Limited geographical and institutional context: The dataset does not provide sufficient information about the geographical location or institutional context of the hospitals. Therefore, the findings cannot be used to draw conclusions about a particular healthcare system or population.
•	Potentially simplified patient records: The dataset represents individual hospital visits, but does not necessarily provide a complete longitudinal view of each patient's medical history. This limits the ability to examine more complex patterns of healthcare utilisation over time.
•	No statistical significance testing: Differences observed across diseases, seasons and patient groups are based on descriptive comparisons. Statistical tests were not conducted to determine whether these differences are statistically significant.
•	No causal analysis: The observed relationships between variables do not establish causation. For example, differences in readmission rates across diseases do not demonstrate that a particular disease directly causes a higher likelihood of readmission.
•	Aggregation may conceal variation: Metrics such as average length of stay and average resource utilisation summarise observations across groups. These averages may conceal substantial variation between individual visits, hospitals or time periods.

# References
Shrivastava, D. (2026). Hospital Operations Dataset (Unclean) [Dataset]. Kaggle. https://www.kaggle.com/datasets/diyashrivastava12/hospital-operations-dataset-unclean
