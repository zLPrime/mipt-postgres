select
	customer_id,
	first_name,
	last_name,
	gender,
	DOB,
	job_title,
	jic.name as job_industry_category,
	ws.name as wealth_segment,
	deceased,
	owns_car,
	address,
	postcode,
	state.name as state,
	country.name as country,
	property_valuation
from customers c 
inner join job_industry_category jic on jic.id = job_industry_category_id
inner join wealth_segment ws on ws.id = wealth_segment_id 
inner join state on state.id = state_id 
inner join country on country.id = country_id 