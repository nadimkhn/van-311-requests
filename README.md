# Vancouver 311 Service Request Dashboard

This project analyzes 311 service request data sourced from the [City of Vancouver](https://opendata.vancouver.ca/explore/dataset/3-1-1-service-requests/information/?disjunctive.service_request_type&disjunctive.status&disjunctive.channel&disjunctive.local_area&disjunctive.department&disjunctive.closure_reason) using SQL for exploratory data analysis and Tableau for data transformation and dashboard creation. The dashboard surfaces key insights into public service delivery trends, geographic distribution, resolution performance, and request types.

<a href="https://public.tableau.com/app/profile/nadim.khan2804/viz/311_van_complaints/Dashboard1">
  <img src="https://img.shields.io/badge/View-Tableau%20Dashboard-blue" width="200"/>
</a>

## Project Scope

- Perform exploratory analysis using PostgreSQL to identify data issues and surface early trends
- Use Tableau’s calculated fields and date functions to handle most of the data transformations
- Build a fully interactive dashboard to explore volume, resolution, and operational patterns

## Data Exploration (SQL)

Using PostgreSQL, exploratory queries included:
- Request counts by type, department, and channel
- Resolution duration distributions
- Top local areas by request count
- Incomplete or inconsistent records flagged for Tableau handling

## Data Transformation (Tableau)

All feature engineering for the dashboard—such as:
- Extracting date parts (year, month)
- Calculating resolution duration
- Filtering
was handled **within Tableau**, using calculated fields and filter logic.

## Dashboard Highlights

**Available Interactions:**
- Filter by request type, department, local area, and time range
- Explore volume patterns across time and geography

**Visual Elements:**
- Time series for daily request trends and resolution days trend
- Choropleth maps by neighborhood
- Category bar charts by service type, department and channel
- Scorecards summarizing resolution rate, closed percentage and total service requests

## 📝 Notes

- Data is updated manually; no automated pipeline is in place.
- Dashboard data is sourced from a static Tableau extract.
