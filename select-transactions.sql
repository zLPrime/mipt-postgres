	select
		transaction_id,
		product_id,
		customer_id,
		transaction_date,
		approved,
		online_order,
		brand.name as brand,
		product_line.name as product_line,
		product_class.name as product_class,
		product_size.name as product_size,
		list_price,
		standard_cost 
	from "transactions"
	inner join item on item.id = item_id 
	inner join brand on brand.id = brand_id
	inner join product_line on product_line.id = product_line_id
	inner join product_class on product_class.id = product_class_id
	inner join product_size on product_size.id = product_size_id