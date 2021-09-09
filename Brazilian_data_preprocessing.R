##Installing relevant packages and importing the necessary Libraries

install.packages('datasets')
library(tidyverse)
library(googleVis)
library(leaflet)
library(maps)
library(datasets)

##Reading the .csv files to start the analysis

review_details = read.csv('olist_order_reviews_dataset.csv',
                   stringsAsFactors = F,fileEncoding="UTF-8-BOM")
pay_details = read.csv('olist_order_payments_dataset.csv',
                    stringsAsFactors = F,fileEncoding="UTF-8-BOM")
order_details = read.csv('olist_orders_dataset.csv',
                  stringsAsFactors = F,fileEncoding="UTF-8-BOM")
customers_details = read.csv('olist_customers_dataset.csv',
                    stringsAsFactors = F,fileEncoding="UTF-8-BOM")
prod_details = read.csv('olist_products_dataset.csv',
                    stringsAsFactors = F,fileEncoding="UTF-8-BOM")
item_details = read.csv('olist_order_items_dataset.csv',
                 stringsAsFactors = F,fileEncoding="UTF-8-BOM")
sellers_details = read.csv('olist_sellers_dataset.csv',
                   stringsAsFactors = F,fileEncoding="UTF-8-BOM")
geoloc_details = read.csv('olist_geolocation_dataset.csv',
                       stringsAsFactors = F,fileEncoding="UTF-8-BOM")
category_details = read.csv('product_category_name_translation.csv',
                         stringsAsFactors = F,fileEncoding="UTF-8-BOM")

# Cleaning category names

cleaned_products <-select(as.data.frame(prod_details),product_id, product_category_name)
cleaned_categorynames <-select(as.data.frame(category_details),product_category_name,product_category_name_english)
new_category <- full_join(cleaned_products ,cleaned_categorynames, by ='product_category_name')
Real_Category <- dplyr::select(new_category,product_id,product_category_name_english)

## Cleaning Geo-Location names

Geolocation  <-select(as.data.frame(geoloc_details),geolocation_zip_code_prefix,geolocation_lat,geolocation_lng,geolocation_city,geolocation_state)
view(Geolocation)

Group_geolocation <- group_by((Geolocation),geolocation_zip_code_prefix)
  
# Cleaning Payment Table

grouping_pay=as.data.frame(pay_details)%>% group_by(order_id)%>%summarise(calcPrice=sum(payment_value))
#duplicates=grouping_pay[duplicated(grouping_pay$order_id)|duplicated(grouping_pay$order_id,fromLast = TRUE)]
#length(unique(grouping_pay$order_id))==nrow(grouping_pay$order_id)

#Cleaning shipping
#grouping_ship=as.data.frame(item_details)%>%group_by(order_id)%>%summarise(freightPrice=sum(freight_value))

#Cleaning order
clean_order=order_details%>%select(order_id)%>%full_join(item_details,by='order_id')

#Merging the data
cust_order <- merge(order_details ,customers_details,on ='customer_id')
#view(cust_order)

cust_order_item <- merge(cust_order ,item_details,on ='order_id')
#view(cust_order_item)

##payment order and review
cust_order_item_pay <- merge(cust_order_item ,pay_details,on ='order_id')
#view(cust_order_item)


##payment order and review  and sellers

cust_order_item_pay_sell <- merge(cust_order_item_pay ,sellers_details,on ='seller_id')
#view(cust_order_item_pay_cat_sell)

write.csv(cust_order_item_pay_sell,file='E:\\BIBA_MAIN_PROJECT\\P1-Brazilian-E-Commerce-Dataset\\Mydata.csv')
write.csv(Real_Category,file='E:\\BIBA_MAIN_PROJECT\\P1-Brazilian-E-Commerce-Dataset\\Categories.csv')

