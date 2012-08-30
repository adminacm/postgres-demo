CREATE EXTENSION hstore;

CREATE TABLE users (
  id serial PRIMARY KEY,
  first_name character varying(50),
  last_name character varying(50),
  email character varying(255),
  data hstore,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  last_login timestamp without time zone
);

CREATE TABLE products (
  id serial PRIMARY KEY,
  title character varying(255),
  description text,
  price numeric(10,2),
  tags text[]
);

CREATE TABLE line_items (
  id serial PRIMARY KEY,
  user_id integer references users(id),
  product_id integer references products(id),
  order_id integer,
  occurred_at timestamp
);


COPY products (title, description, price, tags) FROM stdin;
Django Pony	The Django Pony	50.00	{Animal,Programming}
Pink Pony	A Pink Pony	299.99	{Animal}
Ruby Gem	All the Rubies!	49.50	{Programming,Jewelry}
Purple Gem	Its purple...	9.99	{Jewelry}
Cooking 101	Cookbook for getting started	9.99	{Cooking,Book}
Cooking 102	Cookbook for getting started	15.00	{Cooking,Book}
Cooking 401	Cookbook for getting started	29.99	{Cooking,Book}
Heroku Dyno	A single process on heroku	36.00	{Programming}
\.
