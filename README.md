# Business-Intelligence-and-Business-Analytics

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
* Transformation: In transformation we use filtering and grouping the data which we have extracted from above process. We have made first new data frame in R called cleaned Products which has the data from details, product id and product category. Then we use full join to join tables like “cleaned Products” and “cleaned_categorynames” by “product_category_name” and stored it in “Real category” data frame. We have used dplyr library containing filter, select and group by functions for the same. Below figure shows the implementation.
* Load: In the load part we will load the Cleaned data in SQL Server databases hosted on azure. This is the cleaned data where all the unnecessary information has been discarded and then creating the repositories in Azure SQL Server for the analysis and Visualization of data. Below figure shows the Loading of the resulting cleaned structured data in our Azure SQL Server for analysis and Visualizations in later stages.
