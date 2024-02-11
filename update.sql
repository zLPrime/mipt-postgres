insert into state(name) select distinct customer.state from customer;

insert into country(name) select distinct customer.country from customer;

insert into wealth_segment(name) select distinct customer.wealth_segment from customer;

insert into job_industry_category(name) select distinct customer.job_industry_category from customer;


insert into brand(name) select distinct transaction.brand from transaction;

insert into product_class (name) select distinct transaction.product_class from transaction;

insert into product_line (name) select distinct transaction.product_line from transaction;

insert into product_size (name) select distinct transaction.product_size from transaction;


insert into item(brand_id, product_line_id, product_class_id, product_size_id, list_price, standard_cost)
	select distinct
		brand.id as brand_id,
		product_line.id as product_line_id,
		product_class.id as product_class_id,
		product_size.id as product_size_id,
		transaction.list_price,
		transaction.standard_cost
	from transaction
	inner join brand 		 on brand.name         = transaction.brand
	inner join product_class on product_class.name = transaction.product_class
	inner join product_line  on product_line.name  = transaction.product_line
	inner join product_size  on product_size.name  = transaction.product_size
;

insert into customers(
	customer_id, first_name,	last_name,
	gender, dob, job_title, job_industry_category_id,
	wealth_segment_id, deceased,
	owns_car, address, postcode,
	state_id, country_id, property_valuation)
	select
		customer_id, first_name,	last_name,
		left(gender, 1) as gender, customer."DOB" as dob, job_title, job_industry_category.id as job_industry_category_id,
		wealth_segment.id as wealth_segment_id, deceased_indicator = 'Y' as deceased,
		customer.owns_car = 'Yes' as owns_car,
		address, postcode,
		state.id as state_id, country.id as country_id, property_valuation
	from customer
	inner join wealth_segment on wealth_segment."name" = customer.wealth_segment
	inner join state 		  on state."name" 		   = customer.state 
	inner join country 		  on country."name"        = customer.country
	inner join job_industry_category on job_industry_category."name" = customer.job_industry_category 
;

insert into "transactions"(
	transaction_id,
	product_id, customer_id, transaction_date,
	online_order, approved, item_id)
	select
		transaction_id, product_id, transaction.customer_id,
		transaction_date, online_order,
		order_status = 'Approved' as approved, item.id as item_id
	from "transaction"
	inner join brand 		 on brand.name    	   = transaction.brand 
	inner join product_class on product_class.name = transaction.product_class 
	inner join product_line  on product_line .name = transaction.product_line  
	inner join product_size  on product_size.name  = transaction.product_size 
	inner join item
		on  item.brand_id = brand.id
		and item.product_class_id = product_class.id 
		and item.product_line_id  = product_line.id 
		and item.product_size_id  = product_size.id
		and item.list_price 	  = transaction.list_price
		and item.standard_cost    = transaction.standard_cost
	inner join customers on customers.customer_id = transaction.customer_id
;

