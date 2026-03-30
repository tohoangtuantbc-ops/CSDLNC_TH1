-- Đây là file script thực hành buổi 1
SELECT 'Chao mung ban den voi Oracle!' AS Loi_Chao FROM dual;

CREATE TABLE s_region (
id NUMBER(7) CONSTRAINT s_region_id_pk PRIMARY KEY,
name VARCHAR2(50) NOT NULL
);
CREATE TABLE s_dept (
id NUMBER(7) CONSTRAINT s_dept_id_pk PRIMARY KEY,
name VARCHAR2(25) NOT NULL,
region_id NUMBER(7) CONSTRAINT s_dept_region_id_fk REFERENCES s_region(id)
);
CREATE TABLE s_emp (
id NUMBER(7) CONSTRAINT s_emp_id_pk PRIMARY KEY,
last_name VARCHAR2(25) NOT NULL,
first_name VARCHAR2(25),
userid VARCHAR2(8) UNIQUE,
start_date DATE,
manager_id NUMBER(7),
title VARCHAR2(25),
dept_id NUMBER(7),
salary NUMBER(11,2),
commission_pct NUMBER(4,2)
);
CREATE TABLE s_customer (
id NUMBER(7) CONSTRAINT s_customer_id_pk PRIMARY KEY,
name VARCHAR2(25) NOT NULL,
Phone NUMBER(10) NOT NULL,
Address VARCHAR2(200) NOT NULL,
City VARCHAR2(100) NOT NULL,
State  VARCHAR2(100) NOT NULL,
Country  VARCHAR2(100) NOT NULL,
Zip_code VARCHAR2 (10) NOT NULL,
Credit_rating VARCHAR2(500),
Sale_rep_id NUMBER(7) NOT NULL UNIQUE,
Region_id NUMBER(7) CONSTRAINT s_customer_region_id_fk REFERENCES s_region(id),
Comments VARCHAR2(500)
);
CREATE TABLE s_product(
id NUMBER(7) CONSTRAINT s_product_id_pk PRIMARY KEY,
name VARCHAR2(200) NOT NULL,
Short_desc VARCHAR2(100) NOT NULL,
Longtext_id VARCHAR2(500) NOT NULL,
Image_id VARCHAR(100) UNIQUE,
Suggested_whlsl_price NUMBER(12, 0) CHECK (Suggested_whlsl_price >= 0),
Whlsl_units NVARCHAR2(50)
);
CREATE TABLE s_ord(
id NUMBER(7) CONSTRAINT s_ord_id_pk PRIMARY KEY,
Customer_id NUMBER(7) CONSTRAINT s_ord_customer_id_fk REFERENCES s_customer(id),
Date_ordered DATE,
Date_shipped DATE,
Sale_rep_id NUMBER(7) NOT NULL UNIQUE,
Total NUMBER(12, 0) CHECK (Total >= 0),
Payment_type VARCHAR2(20),
Order_filled NUMBER(1)
);
CREATE TABLE s_item(
Item_id NUMBER(7) CONSTRAINT s_item_id_pk PRIMARY KEY,
Ord_Id NUMBER(7) CONSTRAINT s_item_ord_id_fk REFERENCES s_ord(id),
Product_id  CONSTRAINT s_item_product_id_fk REFERENCES s_product(id),
Price  NUMBER(12, 0) CHECK (price >= 0),
Quantity NUMBER(7) CHECK (Quantity > 0),
Quantity_shipped NUMBER(7) CHECK (Quantity_shipped > 0)
);
CREATE TABLE s_warehouse(
id NUMBER(7) CONSTRAINT s_warehouse_id_pk PRIMARY KEY,
Region_id CONSTRAINT s_warehouse_region_id_fk REFERENCES s_region(id),
Address VARCHAR2(200) NOT NULL,
City VARCHAR2(100) NOT NULL,
State  VARCHAR2(100) NOT NULL,
Country  VARCHAR2(100) NOT NULL,
Zip_code VARCHAR2 (10) NOT NULL,
Phone NUMBER(10) NOT NULL,
Manager_id NUMBER(7) NOT NULL UNIQUE
);
CREATE TABLE s_inventory(
Product_id CONSTRAINT s_inventory_product_id_fk REFERENCES s_product(id),
Warehouse_id CONSTRAINT s_inventory_warehouse_id_fk REFERENCES s_warehouse(id),
Amount_in_stock NUMBER(7) CHECK (Amount_in_stock >= 0),
Reorder_point NUMBER(7) CHECK (Reorder_point >= 0),
Max_in_stock NUMBER(7) CHECK (Max_in_stock >= 0),
Out_of_stock_explanation NVARCHAR2(255),
Restock_date DATE
);
CREATE TABLE s_title(
title NVARCHAR2(255) CONSTRAINT s_title_title_pk PRIMARY KEY
);
CREATE TABLE s_image(
id NUMBER(7) CONSTRAINT s_image_id_pk PRIMARY KEY,
Format VARCHAR2(25) NOT NULL,
Use_filename NUMBER(1),
Filename VARCHAR2(255),
Image VARCHAR2(255)
);
CREATE TABLE s_longtext (
id NUMBER(7) CONSTRAINT s_longtext_id_pk PRIMARY KEY,
Use_filename NUMBER(1),
Filename VARCHAR2(255),
Text VARCHAR2(255)
);
