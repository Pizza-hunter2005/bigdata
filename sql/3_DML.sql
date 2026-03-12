
insert into pet_category(category_name)
select distinct pet_category from mock_data;

insert into customer_pet (
 customer_pet_type,
 customer_pet_name,
 customer_pet_breed,
 pet_category_id
)
select distinct
 m.customer_pet_type,
 m.customer_pet_name,
 m.customer_pet_breed,
 pc.category_id
from mock_data m
join pet_category pc
 on m.pet_category = pc.category_name;

insert into customer_info (
 customer_first_name,
 customer_last_name,
 customer_age
)
select distinct
 customer_first_name,
 customer_last_name,
 customer_age
from mock_data;

insert into customer_location (
 customer_country,
 customer_postal_code
)
select distinct
 customer_country,
 customer_postal_code
from mock_data;

insert into customer_contacts (
 customer_email
)
select distinct
 customer_email
from mock_data;

insert into customer (
 s_customer_id,
 customer_info_id,
 customer_location_id,
 customer_pet_id,
 customer_contact_id
)
select distinct on (m.sale_customer_id)
 m.sale_customer_id,
 ci.info_id,
 cl.location_id,
 cp.pet_id,
 cc.contact_id
from mock_data m
join customer_info ci
 on m.customer_first_name = ci.customer_first_name
 and m.customer_last_name = ci.customer_last_name
 and m.customer_age = ci.customer_age
join customer_location cl
 on m.customer_country = cl.customer_country
 and m.customer_postal_code = cl.customer_postal_code
join customer_contacts cc
 on m.customer_email = cc.customer_email
join customer_pet cp
 on m.customer_pet_name = cp.customer_pet_name
 and m.customer_pet_type = cp.customer_pet_type
 and m.customer_pet_breed = cp.customer_pet_breed;

insert into seller_info (
 seller_first_name,
 seller_last_name
)
select distinct
 seller_first_name,
 seller_last_name
from mock_data;

insert into seller_location (
 seller_country,
 seller_postal_code
)
select distinct
 seller_country,
 seller_postal_code
from mock_data;

insert into seller_contacts (
 seller_email
)
select distinct
 seller_email
from mock_data;

insert into seller (
 s_seller_id,
 seller_info_id,
 seller_location_id,
 seller_contact_id
)
select distinct on (m.sale_seller_id)
 m.sale_seller_id,
 si.info_id,
 sl.location_id,
 sc.contact_id
from mock_data m
join seller_info si
 on m.seller_first_name = si.seller_first_name
 and m.seller_last_name = si.seller_last_name
join seller_location sl
 on m.seller_country = sl.seller_country
 and m.seller_postal_code = sl.seller_postal_code
join seller_contacts sc
 on m.seller_email = sc.seller_email;

insert into store_info (
 store_name
)
select distinct
 store_name
from mock_data;

insert into store_location (
 store_location,
 store_city,
 store_state,
 store_country
)
select distinct
 store_location,
 store_city,
 store_state,
 store_country
from mock_data;

insert into store_contacts (
 store_phone,
 store_email
)
select distinct
 store_phone,
 store_email
from mock_data;

insert into store (
 store_info_id,
 store_location_id,
 store_contact_id
)
select distinct
 si.info_id,
 sl.location_id,
 sc.contact_id
from mock_data m
join store_info si
 on m.store_name = si.store_name
join store_location sl
 on m.store_location = sl.store_location
 and m.store_city = sl.store_city
 and m.store_state = sl.store_state
 and m.store_country = sl.store_country
join store_contacts sc
 on m.store_phone = sc.store_phone
 and m.store_email = sc.store_email;

insert into supplier_info (
 supplier_name
)
select distinct
 supplier_name
from mock_data;

insert into supplier_location (
 supplier_address,
 supplier_city,
 supplier_country
)
select distinct
 supplier_address,
 supplier_city,
 supplier_country
from mock_data;

insert into supplier_contacts (
 supplier_contact,
 supplier_email,
 supplier_phone
)
select distinct
 supplier_contact,
 supplier_email,
 supplier_phone
from mock_data;

insert into supplier (
 supplier_info_id,
 supplier_location_id,
 supplier_contact_id
)
select distinct
 si.info_id,
 sl.location_id,
 sc.contact_id
from mock_data m
join supplier_info si
 on m.supplier_name = si.supplier_name
join supplier_location sl
 on m.supplier_address = sl.supplier_address
 and m.supplier_city = sl.supplier_city
 and m.supplier_country = sl.supplier_country
join supplier_contacts sc
 on m.supplier_contact = sc.supplier_contact
 and m.supplier_email = sc.supplier_email
 and m.supplier_phone = sc.supplier_phone;

insert into product_category (
 product_category
)
select distinct
 product_category
from mock_data;

insert into product_brand (
 product_brand
)
select distinct
 product_brand
from mock_data;

insert into product_parameters (
 product_weight,
 product_color,
 product_size,
 product_material
)
select distinct
 product_weight,
 product_color,
 product_size,
 product_material
from mock_data;


insert into product_feedback (
 product_rating,
 product_reviews
)
select distinct
 product_rating,
 product_reviews
from mock_data;

insert into product_info (
 product_name,
 product_price,
 product_quantity,
 product_release_date,
 product_expiry_date,
 product_description
)
select distinct
 product_name,
 product_price,
 product_quantity,
 product_release_date,
 product_expiry_date,
 product_description
from mock_data;

insert into product (
 s_product_id,
 product_info_id,
 product_parameters_id,
 product_brand_id,
 product_feedback_id,
 product_category_id,
 product_supplier_id
)
select distinct on (m.sale_product_id)
 m.sale_product_id,
 pi.info_id,
 pp.parameters_id,
 pb.brand_id,
 pf.feedback_id,
 pc.category_id,
 s.supplier_id
from mock_data m

join product_info pi
 on m.product_name = pi.product_name

join product_parameters pp
 on m.product_weight = pp.product_weight
 and m.product_color = pp.product_color
 and m.product_size = pp.product_size
 and m.product_material = pp.product_material

join product_brand pb
 on m.product_brand = pb.product_brand

join product_feedback pf
 on m.product_rating = pf.product_rating
 and m.product_reviews = pf.product_reviews

join product_category pc
 on m.product_category = pc.product_category

join supplier_info si
 on m.supplier_name = si.supplier_name

join supplier s
 on s.supplier_info_id = si.info_id;

insert into sale_payment (
 sale_quantity,
 sale_total_price
)
select distinct
 sale_quantity,
 sale_total_price
from mock_data;

insert into sale (
 sale_date,
 sale_customer_id,
 sale_seller_id,
 sale_product_id,
 sale_payment_id,
 sale_store_id
)
select distinct 
 m.sale_date,
 m.sale_customer_id,
 m.sale_seller_id,
 m.sale_product_id,
 sp.payment_id,
 st.store_id
from mock_data m

join sale_payment sp
 on sp.sale_quantity = m.sale_quantity
 and sp.sale_total_price = m.sale_total_price

join store_contacts sc
 on sc.store_phone = m.store_phone
 and sc.store_email = m.store_email

join store_location sl
 on sl.store_location = m.store_location
 and sl.store_city = m.store_city
 and sl.store_state = m.store_state
 and sl.store_country = m.store_country

join store_info si
 on si.store_name = m.store_name

join store st
 on st.store_contact_id = sc.contact_id
 and st.store_location_id = sl.location_id
 and st.store_info_id = si.info_id;

select count(*) from mock_data;
select count(*) from customer;
select count(*) from seller;
select count(*) from product;
select count(*) from sale;