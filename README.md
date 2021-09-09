# Business-Intelligence-and-Business-Analytics

We have been hired from Olist firm with intend to increase Sales and Profit Margins. We have to perform analysis on the current system, and we have to come up with the approach to implement full business intelligence suite which will give better Insights on the Customer and Sales. Olist is Start-up in Brazil in E commerce industry. The Main objective is to analyse the Gaps in the current System and give the low-cost scalable Business intelligence system.

# Business Background, Marketplace Information and Operations

* Olist Store is a very large departmental store in Brazil and it connects various small stores across the country on a single platform without any issues. As many stores are in the rural areas which though having products are not able to sell across the country due to logistic issues and most important factor to outreach the large consumer base. Through integration with Olist marketplace, such small and medium level stores are given the opportunity to expand their consumer base across regions which were earlier not part of their manifesto.
* The marketplace under which Olist operates comes under E-commerce, which has seen a rapid increase in the consumer base. In Latin –America, Brazil has a strong place in the e-commerce market with a market share closing to around 43%. As many rural areas in Brazil are able to access things outside their regions via mobile phones, thus attracting a large consumer base, and with a market share approaching 50 percent share in the entire Latin America, Brazil as a country cannot be ignored as a prospective marketplace considering the large population and ownership of cashless payment facilities mainly through credit cards. Moreover the increasing mobile commerce across the country with a significant percentage of approximately 40 percent just next to United States of America, makes Brazil as the forerunner in the prospect of E-commerce business.
* The operations or processes involved in E-commerce from Olist perspective is that a seller has to fill a form so that we can tag them as our potential Leads who wants to expand their business with our firm. Once they fill their information our sales executives would get in touch with the prospective seller and will the close the deal meaning the seller would sigh up and then we would give access to the seller to list their products on Olist.

# BALANCED SCORECARD

Balance scorecard not just take financial measures into consideration but also certain non-financial motives into consideration. This is a methodology which helps to balance the both sides that are financial and non –financial growth in the organization.

# System Design

In this phase we discuss how the proposed solution will be implemented on our Current system. From the Figure we can see the proposed solution has been implemented on the current system. It starts with the user hitting the Olist website the data is fetched or store depending the on the type of User request we have Hosted database on Azure because of its redundancy also now Olist want to expand business not only in Brazil but across globe so Azure is the database we have proposed. We have also created the Data warehouse (DWH) because all the data should not be stored in the main database as it can slow down the processing and can put lot of load on the system. So, we will use Extraction, Transformation and Load (ETL) through which cleaned data is entered in the database. Also as compared to previous system we have used Tableau for better Visualization purpose like we can easily see which are the areas where company is getting more profit etc. Finally, we have integrated Dynamics CRM which is very important from both Customer and Company Prospective.

# Gaps identified in the current System

* Data of potential customers is collected in the form flat files thus making it difficult for analysis purpose and making out useful insights as importing many flat files complicates the dependency on the csv format.
* There is no proper Database Management System (DBMS), as above stated the data is dependent on flat files which as per industry standards should be modified.
* On doing analysis and visualizing the data, it’s been identified that certain demographic regions across Brazil do not have any Olist consumer base.
* There is no concept of loyalty program implemented that is rewarding the customers, who have been loyal customers for a long time are not provided with bonus awards. Implementing such strategies can increase the consumer base.

# Proposed Solutions

* To remove the dependency the data should be collected in API format as the No-SQL structured databases can provide a prominent solution to this issue as by implementing this we can retrieve the latest updated data and our visualizations implemented would be up to date as we are importing the latest data.
* By importing the data from API format and storing the same in a No-sql database such as MongoDB, we can pre-process the data using programming languages such as R or Python and store the resultant structured data in a structured database such as SQL server/Postgresql/Mysql.
* On fetching the latest data we can track the regions which are not performing well, and then doing analysis on the same we can get insights from the data, thus we can expand our user base with increased advertising/ ads/ Poster cards/ Pamphlets to let small sellers know the benefits of Online retail market and expand not only Olist consumer but also helping the sellers increase their profit margins.
* As mentioned in the gaps identified we can implement the Loyalty Programs which can not only benefit the sellers but also benefit the consumers on the other hand. For example, Olist can propose to sellers to give discounts on the payments types which are mostly used and getting the major chunk of profits.
* On visualizing and analyzing the data, Olist can able to for example identify the top 10 categories of products which hot selling in the market and can pass on the information to the sellers to have more inventory of those products in their pipeline so as to maximize the sales.

# ETL PROCESS IMPLEMENTATION
We have collected the data from olist websites which has seven different entities or tables, and they were not correlated so it was becoming very difficult for Olist employees to fetch some information and give suggestions. Also, they have some unwanted data which can be cleaned so here we apply ETL methodology in which we clean the data and stored in a separate database.

* Extract: In this phase we extract the data from seven different tables in the form of csv files. We used read.csv command for that. Also during extraction, we have used file encoding "UTF-8-BOM" which is helpful if columns names have some special characters in between.

![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/extract.PNG)
* Transformation: In transformation we use filtering and grouping the data which we have extracted from above process. We have made first new data frame in R called cleaned Products which has the data from details, product id and product category. Then we use full join to join tables like “cleaned Products” and “cleaned_categorynames” by “product_category_name” and stored it in “Real category” data frame. We have used dplyr library containing filter, select and group by functions for the same. Below figure shows the implementation.

 ![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/load.PNG)
* Load: In the load part we will load the Cleaned data in SQL Server databases hosted on azure. This is the cleaned data where all the unnecessary information has been discarded and then creating the repositories in Azure SQL Server for the analysis and Visualization of data. Below figure shows the Loading of the resulting cleaned structured data in our Azure SQL Server for analysis and Visualizations in later stages.

 ![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/transformation.PNG)
 
# Tableau Powered Dashboards

As the scope of E-commerce is increasing day by day across different regions, we as Olist try to help our consumers which in this case are our sellers to help increase their business growth so that more and more sellers from different regions can be part of Olist eco-system which provides end to end demand and forecast handling in dealing with the customers. We have connected our Tableau directly with the database hosted on Azure SQL Server. The below figure shows Tableau direct connection with SQL Server, with database selected as BIBA_PROJECT and tables designated below the same.

 ![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/tableau_sql.PNG)
 
 ## Story Line for our Payments Segregation Dashboard
 
 ### Credit card as a payment type
 
Credit card is the most common type of payment method prevalent across the entire globe, where the consumer even if don’t have sufficient money in their accounts can make the payments. Therefore on selecting the credit card as payment type in highlighter, Tableau is able to highlight the key parts in the entire dashboard.
Below are the core modules and insights shown by our interactive dashboard.

1. Credit card accounts for approx... 90 percent of Payment segmentation, showing that many distinct payments are made through credit cards.
2. Approximately 78 % consumers opted credit card as the mode of payment, this gives us an interesting insight which can be used by our sellers to promote their products.
3. In 2016 credit card payments accounted merely 0.25 %, but increased in 2017 by 30%, owing up to 34 % and in 2018 accounted for 45%.

![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/paymenttype.PNG)

### Opting Boleto as a payment type

Boleto is a type of payment system in Brazil which is regulated by FEBRABAN, which is short for Brazilian Federation of Banks. Boleto’s can be used across different ATM machines, Outlets, Online Transactions and superstores till the expiration date.
Our dashboard below highlights some of the important aspects mentioned below:

1. Boleto as payment type accounts for approximately 20 percent as preferred payment type, second most after credit card usage.
2. Around 43.69 % distinct payments came through boleto payment type, again second most after credit card.
3. Payment type by year shows increasing trend ion usage of boleto as payment type, with stats as 0.06 % boleto usage in 2016, followed by approx... 10% in 2017 and finally 10.31% in 2018.

![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/boleto.PNG)

### Opting Debit Card as a payment type

Debit card is the least opted payment method opted by the consumers while buying products through Olist. The below observations describes the insights retrieved from the dashboards.
1. Marginally 2% of consumers opted for Debit card as their payment method as can be concluded from the dashboard.
2. While in 2016, debit card did not accounted for any transactions through Online payments via Olist , the figure marginally increased in the following year coming to 1.11%.

![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/debit.PNG)

# Customers Insights

The next Dashboard Gives information regarding Customer Insights.The First Bar Graph represents no. of customers by years like we can see in year 2016 we have less customers but there was a huge surge in the year 2017 which got increased from to 44,000 and then in year 2018 we again see huge margin increment in the no of customers of about 15000 customers.So already we can see lot of people start using E commerce websites for there buisness.We have also plotted the Demographic map which shows state wise Contribution of Customers and this Map tell us that Sao Paulo has highest no of customers in the year 2017 with count of 17.52 K customers, which finally got increased to 23.74 k customers in the year of 2018.As the Dashbiard is interactive we can see no of delivred product is also changing yearly.Also we can see delivered item also got increased which was natural as the no of cutomers got increased. We have also plotted Regression line in witn adjusted R Square 87 percent and the p value of 0.27 which is less then 0.5 means we are nearly correct in our Analysis.

![image](https://github.com/neil996/Business-Intelligence-and-Business-Analytics/blob/main/images/insights.PNG)
