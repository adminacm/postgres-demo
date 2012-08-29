CREATE TABLE products (
    id serial,
    title character varying(255),
    description text,
    price numeric(10,2)
);

CREATE TABLE purchases (
    id serial,
    user_id integer,
    items decimal(10,2) [100][1],
	occurred_at timestamp
);

CREATE EXTENSION hstore;

CREATE TABLE users (
    id serial,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(255),
	data hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    last_login timestamp without time zone
);

COPY products (title, description, price) FROM stdin;
Django Pony	The Django Pony	50.00
Pink Pony	A Pink Pony	299.99
Ruby Gem	All the Rubies!	49.50
Purple Gem	Its purple...	9.99
Cooking 101	Cookbook for getting started	9.99
Cooking 102	Cookbook for getting started	15.00
Cooking 401	Cookbook for getting started	29.99
Heroku Dyno	A single process on heroku	36.00
\.

CREATE OR REPLACE FUNCTION total(decimal(10,2)[][]) RETURNS decimal(10,2) AS $$
DECLARE
  s decimal(10,2) := 0;
  x decimal[];
BEGIN
  FOREACH x SLICE 1 IN ARRAY $1
  LOOP
    s := s + (x[2] * x[3]);
  END LOOP;
  RETURN s;
END;
$$ LANGUAGE plpgsql;

