# Cambridgeshire Primary Schools Dashboard 2024-25

Analysis of Cambridgeshire primary school performance, deprivation, and SEND data using publicly available DfE data.

Built as a portfolio project demonstrating Python, SQL, and Tableau skills applied to real local authority education data.

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

## Project structure
data/          — raw and cleaned CSV files, SQLite database
notebooks/     — Python data cleaning and exploration
sql/           — SQL queries used in analysis
dashboard/     — Tableau workbook and dashboard screenshot

## Key SQL techniques demonstrated
- JOIN across two datasets on school URN
- GROUP BY aggregations by constituency
- Window functions (AVG OVER PARTITION BY) for school vs area comparisons
- CTEs for readable multi-step queries
- Filtering and calculated columns