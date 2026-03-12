
create table if not exists pet_category(
	category_id serial primary key,
	category_name text
);
	
create table if not exists customer_pet(
	pet_id serial primary key,
	customer_pet_type text,
	customer_pet_name text,
	customer_pet_breed text,
	pet_category_id int not null,
	foreign key(pet_category_id) references pet_category(category_id)
);	

create table if not exists customer_info (
	info_id serial primary key,
	customer_first_name text,
	customer_last_name text,
	customer_age int
);

create table if not exists customer_location (
	location_id SERIAL primary key,
	customer_country text,
	customer_postal_code text
);

create table if not exists customer_contacts(
	contact_id serial primary key,
	customer_email text
);

create table if not exists customer (
	customer_id serial,
	s_customer_id int primary key,
	customer_info_id int not null,
	customer_location_id int not null,
	customer_pet_id int not null,
	customer_contact_id int not null,
	foreign key(customer_info_id) references customer_info(info_id),
	foreign key(customer_location_id) references customer_location(location_id),
	foreign key(customer_pet_id) references customer_pet(pet_id),
	foreign key(customer_contact_id) references customer_contacts(contact_id)
);


create table if not exists seller_info (
	info_id serial primary key,
	seller_first_name text,
	seller_last_name text,
	seller_age int
);

create table if not exists seller_location (
	location_id serial primary key,
	seller_country text,
	seller_postal_code text
);

create table if not exists seller_contacts(
	contact_id serial primary key,
	seller_email text
);

create table if not exists seller (
	seller_id serial,
	s_seller_id int primary key,
	seller_info_id int not null,
	seller_location_id int not null,
	seller_contact_id int not null,
	foreign key(seller_info_id) references seller_info(info_id),
	foreign key(seller_location_id) references seller_location(location_id),
	foreign key(seller_contact_id) references seller_contacts(contact_id)
);

create table if not exists store_info (
	info_id serial primary key,
	store_name text
);

create table if not exists store_location (
	location_id serial primary key,
	store_location text,
	store_city text,
	store_state text,
	store_country text
);

create table if not exists store_contacts(
	contact_id serial primary key,
	store_phone text,
	store_email text
);

create table if not exists store (
	store_id serial primary key,
	store_info_id int not null,
	store_location_id int not null,
	store_contact_id int not null,
	foreign key(store_info_id) references store_info(info_id),
	foreign key(store_location_id) references store_location(location_id),
	foreign key(store_contact_id) references store_contacts(contact_id)
);


create table if not exists supplier_info (
	info_id serial primary key,
	supplier_name text
);

create table if not exists supplier_location (
	location_id serial primary key,
	supplier_address text,
	supplier_city text,
	supplier_country text
);

create table if not exists supplier_contacts(
	contact_id serial primary key,
	supplier_contact text,
	supplier_email text,
	supplier_phone text
);

create table if not exists supplier (
	supplier_id serial primary key,
	supplier_info_id int not null,
	supplier_location_id int not null,
	supplier_contact_id int not null,
	foreign key(supplier_info_id) references supplier_info(info_id),
	foreign key(supplier_location_id) references supplier_location(location_id),
	foreign key(supplier_contact_id) references supplier_contacts(contact_id)
);

create table if not exists product_info(
	info_id serial primary key,
	product_name text,
	product_price numeric,
	product_quantity int,
	product_release_date date,
	product_expiry_date date,
	product_description text
);

create table if not exists product_feedback (
	feedback_id serial primary key,
	product_rating numeric,
	product_reviews int
);

create table if not exists product_category (
	category_id serial primary key,
	product_category text
);

create table if not exists product_brand (
	brand_id serial primary key,
	product_brand text
);


create table if not exists product_parameters(
	parameters_id serial primary key,
	product_weight numeric,
	product_color text,
	product_size text,
	product_material text
);

create table if not exists product (
	product_id serial,
	s_product_id int primary key,
	product_info_id int not null,
	product_parameters_id int not null,
	product_brand_id int not null,
	product_feedback_id int not null,
	product_category_id int not null,
	product_supplier_id int not null,
	foreign key(product_info_id) references product_info(info_id),
	foreign key(product_parameters_id) references product_parameters(parameters_id),
	foreign key(product_brand_id) references product_brand(brand_id),
	foreign key(product_feedback_id) references product_feedback(feedback_id),
	foreign key(product_category_id) references product_category(category_id),
	foreign key(product_supplier_id) references supplier(supplier_id)
);


create table if not exists sale_payment(
	payment_id serial primary key,
	sale_quantity int,
	sale_total_price numeric
);

create table if not exists sale (
	sale_id serial primary key,
	sale_date date,
	sale_customer_id int,
	sale_seller_id int,
	sale_product_id int,
	sale_payment_id int,
	sale_store_id int,
	foreign key(sale_customer_id) references customer(s_customer_id),
	foreign key(sale_seller_id) references seller(s_seller_id),
	foreign key(sale_product_id) references product(s_product_id),
	foreign key(sale_payment_id) references sale_payment(payment_id),
	foreign key(sale_store_id) references store(store_id)
); 
