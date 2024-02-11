CREATE TABLE "product_line" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "product_class" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "product_size" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "brand" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "job_industry_category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "wealth_segment" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "state" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "country" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "item" (
  "id" SERIAL PRIMARY KEY,
  "brand_id" integer,
  "product_line_id" integer,
  "product_class_id" integer,
  "product_size_id" integer,
  "list_price" float,
  "standard_cost" float
);

CREATE TABLE "transactions" (
  "transaction_id" SERIAL PRIMARY KEY,
  "product_id" integer,
  "customer_id" integer,
  "transaction_date" date,
  "online_order" bool,
  "approved" bool,
  "item_id" integer
);

CREATE TABLE "customers" (
  "customer_id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "gender" char,
  "dob" date,
  "job_title" varchar,
  "job_industry_category_id" integer,
  "wealth_segment_id" integer,
  "deceased" bool,
  "owns_car" bool,
  "address" varchar,
  "postcode" varchar,
  "state_id" integer,
  "country_id" integer,
  "property_valuation" integer
);

ALTER TABLE "transactions" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("customer_id");

ALTER TABLE "item" ADD FOREIGN KEY ("brand_id") REFERENCES "brand" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("product_line_id") REFERENCES "product_line" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("product_class_id") REFERENCES "product_class" ("id");

ALTER TABLE "item" ADD FOREIGN KEY ("product_size_id") REFERENCES "product_size" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("item_id") REFERENCES "item" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("job_industry_category_id") REFERENCES "job_industry_category" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("wealth_segment_id") REFERENCES "wealth_segment" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("state_id") REFERENCES "state" ("id");

ALTER TABLE "customers" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("id");
