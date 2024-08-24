# Olympics WebScrapping and Dashboard
 
### Project Overview
This project involves web scraping data from an Olympics website to gather information about medals won by various countries across different sports and events. The data was then cleaned, analyzed using Python, and visualized in an interactive Power BI dashboard.

### Data Collection
The data was collected using web scraping techniques. The following steps were taken:
Web Scraping: Python's BeautifulSoup and Requests libraries were used to scrape the Olympic medals data from the official Olympics website.
Data Extraction: The information gathered included details like country names, number of gold, silver, and bronze medals, and the sports/events associated with these medals.
Data Cleaning and Analysis
After collecting the data, it was cleaned and analyzed using Python. The following steps were performed:

### Data Cleaning
Removed duplicates and irrelevant data.
Handled missing values by appropriate imputation techniques.
Standardized country names and event categories.

### Data Analysis:
Calculated total medals per country.
Analyzed medal distribution by sport/event.
Identified trends in medals won over different Olympic years.
Generated key insights, such as the top-performing countries and sports.

### Python libraries used:
Pandas for data manipulation and analysis.
NumPy for numerical computations.
Matplotlib and Seaborn for basic visualizations.

### Power BI Dashboard
The cleaned and analyzed data was imported into Power BI to create an interactive dashboard. The dashboard features:

Country-wise Medal Count: A visual representation of total medals, broken down by gold, silver, and bronze.
Sport/Event Analysis: Insights into which sports/events are dominated by specific countries.
Interactive Filtering: Users can filter the data by country, sport, event, and year to explore specific details.
