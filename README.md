# Cambridgeshire Primary Schools Dashboard 2024-25

Analysis of Cambridgeshire primary school performance, deprivation, and SEND data using publicly available DfE data.

Built as a portfolio project demonstrating Python, SQL, Tableau and Power BI skills applied to real local authority education data.

## What the data shows

- North East Cambridgeshire has the lowest attainment (49.9% meeting expected standard) and the highest deprivation (34.2% FSM ever)
- A clear relationship exists between free school meal eligibility and KS2 attainment across all constituencies
- Ely and East Cambridgeshire has the highest proportion of pupils with EHC plans (3.8% of roll) among mainstream primaries

## Data sources

- DfE School Census 2024-25 (Cambridgeshire LA 873)
- DfE KS2 Final Results 2024-25 (Cambridgeshire LA 873)
- Source: https://www.compare-school-performance.service.gov.uk/download-data

## Tools used

- Python (pandas) — data cleaning and merging
- SQLite — data storage and SQL queries
- Tableau Public — dashboard and visualisation
- Power BI — interactive dashboard with DAX measures and slicer filtering
  
## Project structure

data/          — raw and cleaned CSV files, SQLite database
notebooks/     — Python data cleaning and exploration
sql/           — SQL queries used in analysis
dashboard/     — Tableau workbook, Power BI .pbix file and dashboard screenshots

## Key SQL techniques demonstrated

- JOIN across two datasets on school URN
- GROUP BY aggregations by constituency
- Window functions (AVG OVER PARTITION BY) for school vs area comparisons
- CTEs for readable multi-step queries
- Filtering and calculated columns

## Power BI dashboard
Built a second dashboard in Power BI using the same dataset to demonstrate cross-tool capability.

Features:
- Four KPI cards: total schools, average attainment, average deprivation rate, percentage of schools below expected standard
- Bar chart showing average KS2 attainment by constituency, sorted descending
- Scatter plot showing deprivation vs attainment by individual school, coloured by constituency
- List slicer filtering all visuals by constituency simultaneously
- DAX measure calculating percentage of schools below the expected MAT threshold of 100

Key finding visible in Power BI: selecting Cambridge constituency shows 0% of schools below expected standard, consistent with it being the highest attaining constituency in the dataset.
