SHOW USER;

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

DESC s_emp;
DESC s_dept;
-- Xem danh sach tat ca bang cua user hien tai:
SELECT table_name FROM user_tables ORDER BY table_name;

INSERT INTO s_region (id, name) VALUES (1, 'Mien Bac 1');
INSERT INTO s_region (id, name) VALUES (2, 'Mien Bac 2');
INSERT INTO s_region (id, name) VALUES (3, 'Mien Bac 3');
INSERT INTO s_region (id, name) VALUES (4, 'Mien Bac 4');
INSERT INTO s_region (id, name) VALUES (5, 'Mien Bac 5');
INSERT INTO s_region (id, name) VALUES (6, 'Mien Trung 1');
INSERT INTO s_region (id, name) VALUES (7, 'Mien Trung 2');
INSERT INTO s_region (id, name) VALUES (8, 'Mien Trung 3');
INSERT INTO s_region (id, name) VALUES (9, 'Mien Trung 4');
INSERT INTO s_region (id, name) VALUES (10, 'Mien Trung 5');
INSERT INTO s_region (id, name) VALUES (11, 'Mien Nam 1');
INSERT INTO s_region (id, name) VALUES (12, 'Mien Nam 2');
INSERT INTO s_region (id, name) VALUES (13, 'Mien Nam 3');
INSERT INTO s_region (id, name) VALUES (14, 'Mien Nam 4');
INSERT INTO s_region (id, name) VALUES (15, 'Mien Nam 5');
INSERT INTO s_region (id, name) VALUES (16, 'Tay Nguyen 1');
INSERT INTO s_region (id, name) VALUES (17, 'Tay Nguyen 2');
INSERT INTO s_region (id, name) VALUES (18, 'Tay Nguyen 3');
INSERT INTO s_region (id, name) VALUES (19, 'Dong Bang SCL 1');
INSERT INTO s_region (id, name) VALUES (20, 'Dong Bang SCL 2');
SELECT * FROM s_region;

INSERT INTO s_dept (id, name, region_id) VALUES (10, 'Kinh doanh MB 1', 1);
INSERT INTO s_dept (id, name, region_id) VALUES (20, 'Marketing MB 2', 2);
INSERT INTO s_dept (id, name, region_id) VALUES (30, 'Kho van MB 3', 3);
INSERT INTO s_dept (id, name, region_id) VALUES (40, 'Kinh doanh MB 4', 4);
INSERT INTO s_dept (id, name, region_id) VALUES (50, 'Nhan su MB 5', 5);
INSERT INTO s_dept (id, name, region_id) VALUES (60, 'Kinh doanh MT 1', 6);
INSERT INTO s_dept (id, name, region_id) VALUES (70, 'Ke toan MT 2', 7);
INSERT INTO s_dept (id, name, region_id) VALUES (80, 'Kho van MT 3', 8);
INSERT INTO s_dept (id, name, region_id) VALUES (90, 'Kinh doanh MT 4', 9);
INSERT INTO s_dept (id, name, region_id) VALUES (100, 'CSKH MT 5', 10);
INSERT INTO s_dept (id, name, region_id) VALUES (110, 'Kinh doanh MN 1', 11);
INSERT INTO s_dept (id, name, region_id) VALUES (120, 'IT MN 2', 12);
INSERT INTO s_dept (id, name, region_id) VALUES (130, 'Kho van MN 3', 13);
INSERT INTO s_dept (id, name, region_id) VALUES (140, 'Kinh doanh MN 4', 14);
INSERT INTO s_dept (id, name, region_id) VALUES (150, 'Marketing MN 5', 15);
INSERT INTO s_dept (id, name, region_id) VALUES (160, 'Kinh doanh TN 1', 16);
INSERT INTO s_dept (id, name, region_id) VALUES (170, 'Kho van TN 2', 17);
INSERT INTO s_dept (id, name, region_id) VALUES (180, 'Kinh doanh TN 3', 18);
INSERT INTO s_dept (id, name, region_id) VALUES (190, 'Kinh doanh DBSCL 1', 19);
INSERT INTO s_dept (id, name, region_id) VALUES (200, 'Kho van DBSCL 2', 20);
SELECT * FROM s_dept;

INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (1, 'Nguyen', 'An', 'nan1', TO_DATE('2023-01-10', 'YYYY-MM-DD'), NULL, 'Giam doc', 10, 30000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (2, 'Tran', 'Binh', 'tbinh', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 1, 'Truong phong KD', 10, 20000000, 5.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (3, 'Le', 'Chi', 'lchi', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 1, 'Ke toan truong', 70, 18000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (4, 'Pham', 'Dung', 'pdung', TO_DATE('2023-04-20', 'YYYY-MM-DD'), 1, 'Truong kho', 30, 15000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (5, 'Hoang', 'En', 'hen', TO_DATE('2023-05-10', 'YYYY-MM-DD'), 2, 'Sale Rep 1', 10, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (6, 'Vu', 'Phong', 'vphong', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 2, 'Sale Rep 2', 40, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (7, 'Vo', 'Giang', 'vgiang', TO_DATE('2023-07-12', 'YYYY-MM-DD'), 2, 'Sale Rep 3', 60, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (8, 'Dang', 'Hai', 'dhai', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 2, 'Sale Rep 4', 90, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (9, 'Bui', 'Inh', 'binh9', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 2, 'Sale Rep 5', 110, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (10, 'Do', 'Khoa', 'dkhoa', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 2, 'Sale Rep 6', 140, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (11, 'Ho', 'Linh', 'hlinh', TO_DATE('2023-11-01', 'YYYY-MM-DD'), 2, 'Sale Rep 7', 160, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (12, 'Ngo', 'Minh', 'nminh', TO_DATE('2023-12-10', 'YYYY-MM-DD'), 2, 'Sale Rep 8', 180, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (13, 'Duong', 'Nam', 'dnam', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 2, 'Sale Rep 9', 190, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (14, 'Ly', 'Oanh', 'loanh', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 2, 'Sale Rep 10', 10, 10000000, 10.0);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (15, 'Mac', 'Phu', 'mphu', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 4, 'Nhan vien kho', 30, 8000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (16, 'Chau', 'Quoc', 'cquoc', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 4, 'Nhan vien kho', 80, 8000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (17, 'Dinh', 'Sang', 'dsang', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 4, 'Nhan vien kho', 130, 8000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (18, 'Ton', 'Tu', 'ttu', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 1, 'Quan tri he thong', 120, 16000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (19, 'Truong', 'Uyen', 'tuyen', TO_DATE('2024-07-15', 'YYYY-MM-DD'), 1, 'Truong phong Marketing', 20, 18000000, NULL);
INSERT INTO s_emp (id, last_name, first_name, userid, start_date, manager_id, title, dept_id, salary, commission_pct) VALUES (20, 'Kieu', 'Vy', 'kvy', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 3, 'Ke toan vien', 70, 9000000, NULL);
Select * from s_emp;

INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (1, 'Cty Thoi Trang A', 901111222, '1 Hai Ba Trung', 'Ha Noi', 'Ha Noi', 'Viet Nam', '100000', 'Tot', 1, 1, 'Khach VIP');
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (2, 'Shop Da Cao Cap B', 902222333, '2 Le Loi', 'Hai Phong', 'Hai Phong', 'Viet Nam', '180000', 'Kha', 2, 2, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (3, 'Phu Kien C', 903333444, '3 Tran Phu', 'Quang Ninh', 'Quang Ninh', 'Viet Nam', '200000', 'Tot', 3, 3, 'Mua nhieu');
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (4, 'Do Da D', 904444555, '4 Nguyen Trai', 'Bac Ninh', 'Bac Ninh', 'Viet Nam', '790000', 'Kha', 4, 4, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (5, 'Thoi Trang E', 905555666, '5 Ba Trieu', 'Nam Dinh', 'Nam Dinh', 'Viet Nam', '420000', 'Tot', 5, 5, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (6, 'Cua hang F', 906666777, '6 Le Duan', 'Da Nang', 'Da Nang', 'Viet Nam', '550000', 'Tot', 6, 6, 'Giao som');
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (7, 'Shop G', 907777888, '7 Hung Vuong', 'Hue', 'Thua Thien Hue', 'Viet Nam', '530000', 'Trung binh', 7, 7, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (8, 'Do Da H', 908888999, '8 Tran Hung Dao', 'Nha Trang', 'Khanh Hoa', 'Viet Nam', '650000', 'Tot', 8, 8, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (9, 'Phu Kien I', 909999000, '9 Quang Trung', 'Quy Nhon', 'Binh Dinh', 'Viet Nam', '590000', 'Kha', 9, 9, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (10, 'Shop K', 910000111, '10 Ly Thuong Kiet', 'Dong Hoi', 'Quang Binh', 'Viet Nam', '510000', 'Tot', 10, 10, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (11, 'Thoi Trang L', 911111222, '11 Nguyen Hue', 'Ho Chi Minh', 'Ho Chi Minh', 'Viet Nam', '700000', 'Tot', 11, 11, 'Khach VIP');
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (12, 'Da Cao Cap M', 912222333, '12 Yersin', 'Thu Dau Mot', 'Binh Duong', 'Viet Nam', '820000', 'Kha', 12, 12, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (13, 'Shop N', 913333444, '13 Pham Van Thuan', 'Bien Hoa', 'Dong Nai', 'Viet Nam', '810000', 'Tot', 13, 13, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (14, 'Cua hang O', 914444555, '14 Le Hong Phong', 'Vung Tau', 'Ba Ria', 'Viet Nam', '790000', 'Trung binh', 14, 14, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (15, 'Do Da P', 915555666, '15 Cach Mang T8', 'Tay Ninh', 'Tay Ninh', 'Viet Nam', '840000', 'Kha', 15, 15, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (16, 'Phu Kien Q', 916666777, '16 Phan Chu Trinh', 'BMT', 'Dak Lak', 'Viet Nam', '630000', 'Tot', 16, 16, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (17, 'Shop R', 917777888, '17 Bui Thi Xuan', 'Da Lat', 'Lam Dong', 'Viet Nam', '670000', 'Kha', 17, 17, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (18, 'Thoi Trang S', 918888999, '18 Nguyen Tat Thanh', 'Pleiku', 'Gia Lai', 'Viet Nam', '600000', 'Tot', 18, 18, NULL);
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (19, 'Cty T', 919999000, '19 Hoa Binh', 'Can Tho', 'Can Tho', 'Viet Nam', '900000', 'Tot', 19, 19, 'Khach VIP');
INSERT INTO s_customer (id, name, Phone, Address, City, State, Country, Zip_code, Credit_rating, Sale_rep_id, Region_id, Comments) VALUES (20, 'Shop U', 920000111, '20 Tran Hung Dao', 'Long Xuyen', 'An Giang', 'Viet Nam', '880000', 'Kha', 20, 20, NULL);
Select * from s_customer;

INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (1, 'Vi da nam s1', 'Vi ngang da bo', '1', '1', 450000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (2, 'Vi da nam s2', 'Vi dung ca sau', '2', '2', 1200000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (3, 'Vi nu mini', 'Vi nu da mem', '3', '3', 350000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (4, 'That lung TL1', 'Khoa kim loai', '4', '4', 550000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (5, 'That lung TL2', 'Khoa tu dong', '5', '5', 650000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (6, 'Tui xach TX1', 'Tui cong so', '6', '6', 2500000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (7, 'Tui du lich DL1', 'Tui big size', '7', '7', 3200000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (8, 'Balo BL1', 'Balo laptop 15', '8', '8', 1800000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (9, 'Balo mini M1', 'Balo thoi trang', '9', '9', 1500000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (10, 'Tui cheo C1', 'Tui bao tu', '10', '10', 850000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (11, 'Day dong ho D1', 'Day Apple Watch', '11', '11', 400000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (12, 'Day dong ho D2', 'Day size 20mm', '12', '12', 450000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (13, 'Bao Ipad I1', 'Case ipad pro', '13', '13', 750000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (14, 'Bao Ipad I2', 'Case ipad mini', '14', '14', 650000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (15, 'Clutch nam C1', 'Clutch 2 khoa', '15', '15', 1600000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (16, 'Clutch nu C2', 'Clutch form cung', '16', '16', 1400000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (17, 'Moc khoa MK1', 'Moc khoa don', '17', '17', 50000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (18, 'Moc khoa MK2', 'Moc khoa cao cap', '18', '18', 120000, 'Chiec');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (19, 'So da S1', 'So tay bia da', '19', '19', 350000, 'Chuyen');
INSERT INTO s_product (id, name, Short_desc, Longtext_id, Image_id, Suggested_whlsl_price, Whlsl_units) VALUES (20, 'So da S2', 'So tay vintage', '20', '20', 400000, 'Chuyen');
select * from s_product;

INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (1, 1, TO_DATE('2025-10-01', 'YYYY-MM-DD'), TO_DATE('2025-10-05', 'YYYY-MM-DD'), 1, 15000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (2, 2, TO_DATE('2025-10-02', 'YYYY-MM-DD'), TO_DATE('2025-10-06', 'YYYY-MM-DD'), 2, 8500000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (3, 3, TO_DATE('2025-10-03', 'YYYY-MM-DD'), NULL, 3, 22000000, 'Chuyen Khoan', 0);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (4, 4, TO_DATE('2025-10-04', 'YYYY-MM-DD'), TO_DATE('2025-10-08', 'YYYY-MM-DD'), 4, 5500000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (5, 5, TO_DATE('2025-10-05', 'YYYY-MM-DD'), TO_DATE('2025-10-09', 'YYYY-MM-DD'), 5, 12000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (6, 6, TO_DATE('2025-10-06', 'YYYY-MM-DD'), TO_DATE('2025-10-10', 'YYYY-MM-DD'), 6, 9000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (7, 7, TO_DATE('2025-10-07', 'YYYY-MM-DD'), NULL, 7, 7500000, 'Tien Mat', 0);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (8, 8, TO_DATE('2025-10-08', 'YYYY-MM-DD'), TO_DATE('2025-10-12', 'YYYY-MM-DD'), 8, 18000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (9, 9, TO_DATE('2025-10-09', 'YYYY-MM-DD'), TO_DATE('2025-10-13', 'YYYY-MM-DD'), 9, 6000000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (10, 10, TO_DATE('2025-10-10', 'YYYY-MM-DD'), NULL, 10, 14000000, 'Chuyen Khoan', 0);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (11, 11, TO_DATE('2025-10-11', 'YYYY-MM-DD'), TO_DATE('2025-10-15', 'YYYY-MM-DD'), 11, 25000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (12, 12, TO_DATE('2025-10-12', 'YYYY-MM-DD'), TO_DATE('2025-10-16', 'YYYY-MM-DD'), 12, 4500000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (13, 13, TO_DATE('2025-10-13', 'YYYY-MM-DD'), NULL, 13, 11000000, 'Chuyen Khoan', 0);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (14, 14, TO_DATE('2025-10-14', 'YYYY-MM-DD'), TO_DATE('2025-10-18', 'YYYY-MM-DD'), 14, 8000000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (15, 15, TO_DATE('2025-10-15', 'YYYY-MM-DD'), TO_DATE('2025-10-19', 'YYYY-MM-DD'), 15, 16000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (16, 16, TO_DATE('2025-10-16', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), 16, 9500000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (17, 17, TO_DATE('2025-10-17', 'YYYY-MM-DD'), NULL, 17, 13000000, 'Chuyen Khoan', 0);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (18, 18, TO_DATE('2025-10-18', 'YYYY-MM-DD'), TO_DATE('2025-10-22', 'YYYY-MM-DD'), 18, 7000000, 'Tien Mat', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (19, 19, TO_DATE('2025-10-19', 'YYYY-MM-DD'), TO_DATE('2025-10-23', 'YYYY-MM-DD'), 19, 21000000, 'Chuyen Khoan', 1);
INSERT INTO s_ord (id, Customer_id, Date_ordered, Date_shipped, Sale_rep_id, Total, Payment_type, Order_filled) VALUES (20, 20, TO_DATE('2025-10-20', 'YYYY-MM-DD'), TO_DATE('2025-10-24', 'YYYY-MM-DD'), 20, 5000000, 'Tien Mat', 1);
select * from s_ord

INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (1, 1, 1, 450000, 20, 20);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (2, 2, 2, 1200000, 5, 5);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (3, 3, 6, 2500000, 8, 4);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (4, 4, 3, 350000, 15, 15);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (5, 5, 8, 1800000, 6, 6);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (6, 6, 4, 550000, 10, 10);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (7, 7, 7, 3200000, 2, 0);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (8, 8, 9, 1500000, 12, 12);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (9, 9, 10, 850000, 7, 7);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (10, 10, 15, 1600000, 8, 4);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (11, 11, 16, 1400000, 15, 15);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (12, 12, 11, 400000, 10, 10);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (13, 13, 13, 750000, 12, 5);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (14, 14, 19, 350000, 20, 20);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (15, 15, 20, 400000, 30, 30);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (16, 16, 17, 50000, 100, 100);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (17, 17, 18, 120000, 50, 25);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (18, 18, 5, 650000, 10, 10);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (19, 19, 12, 450000, 40, 40);
INSERT INTO s_item (Item_id, Ord_Id, Product_id, Price, Quantity, Quantity_shipped) VALUES (20, 20, 14, 650000, 5, 5);
select * from s_item

INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (1, 1, '12 Lang Ha', 'Ha Noi', 'Ha Noi', 'Viet Nam', '100000', 981111111, 1);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (2, 2, '34 Tran Phu', 'Hai Phong', 'Hai Phong', 'Viet Nam', '180000', 982222222, 2);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (3, 3, '56 Le Loi', 'Quang Ninh', 'Quang Ninh', 'Viet Nam', '200000', 983333333, 3);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (4, 4, '78 Nguyen Van Cu', 'Bac Ninh', 'Bac Ninh', 'Viet Nam', '790000', 984444444, 4);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (5, 5, '90 Hung Vuong', 'Nam Dinh', 'Nam Dinh', 'Viet Nam', '420000', 985555555, 5);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (6, 6, '123 Le Duan', 'Da Nang', 'Da Nang', 'Viet Nam', '550000', 986666666, 6);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (7, 7, '456 Tran Hung Dao', 'Hue', 'Thua Thien Hue', 'Viet Nam', '530000', 987777777, 7);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (8, 8, '789 Nguyen Thi Minh Khai', 'Nha Trang', 'Khanh Hoa', 'Viet Nam', '650000', 988888888, 8);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (9, 9, '321 Dien Bien Phu', 'Quy Nhon', 'Binh Dinh', 'Viet Nam', '590000', 989999999, 9);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (10, 10, '654 Pham Van Dong', 'Dong Hoi', 'Quang Binh', 'Viet Nam', '510000', 990000000, 10);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (11, 11, '11 Cong Hoa', 'Ho Chi Minh', 'Ho Chi Minh', 'Viet Nam', '700000', 991111111, 11);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (12, 12, '22 Binh Duong', 'Thu Dau Mot', 'Binh Duong', 'Viet Nam', '820000', 992222222, 12);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (13, 13, '33 Dong Khoi', 'Bien Hoa', 'Dong Nai', 'Viet Nam', '810000', 993333333, 13);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (14, 14, '44 Vung Tau', 'Vung Tau', 'Ba Ria', 'Viet Nam', '790000', 994444444, 14);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (15, 15, '55 Tay Ninh', 'Tay Ninh', 'Tay Ninh', 'Viet Nam', '840000', 995555555, 15);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (16, 16, '66 Buon Ma Thuot', 'BMT', 'Dak Lak', 'Viet Nam', '630000', 996666666, 16);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (17, 17, '77 Da Lat', 'Da Lat', 'Lam Dong', 'Viet Nam', '670000', 997777777, 17);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (18, 18, '88 Pleiku', 'Pleiku', 'Gia Lai', 'Viet Nam', '600000', 998888888, 18);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (19, 19, '99 30 Thang 4', 'Can Tho', 'Can Tho', 'Viet Nam', '900000', 999999999, 19);
INSERT INTO s_warehouse (id, Region_id, Address, City, State, Country, Zip_code, Phone, Manager_id) VALUES (20, 20, '100 Long Xuyen', 'Long Xuyen', 'An Giang', 'Viet Nam', '880000', 900000000, 20);
select *  from s_warehouse

INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (1, 1, 500, 50, 2000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (2, 2, 100, 20, 500, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (3, 3, 300, 30, 1000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (4, 4, 400, 40, 1500, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (5, 5, 10, 50, 1000, 'Dang cho nhap khau', TO_DATE('2025-11-01', 'YYYY-MM-DD'));
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (6, 6, 150, 15, 600, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (7, 7, 5, 10, 300, 'San xuat cham', TO_DATE('2025-11-05', 'YYYY-MM-DD'));
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (8, 8, 200, 20, 800, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (9, 9, 250, 25, 1000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (10, 10, 0, 30, 1200, 'Het nguyen lieu da', TO_DATE('2025-11-10', 'YYYY-MM-DD'));
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (11, 11, 600, 60, 3000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (12, 12, 450, 45, 2000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (13, 13, 80, 20, 500, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (14, 14, 120, 15, 600, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (15, 15, 0, 10, 400, 'Doi phien ban moi', TO_DATE('2025-11-15', 'YYYY-MM-DD'));
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (16, 16, 90, 10, 400, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (17, 17, 1000, 100, 5000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (18, 18, 800, 80, 4000, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (19, 19, 350, 35, 1500, NULL, NULL);
INSERT INTO s_inventory (Product_id, Warehouse_id, Amount_in_stock, Reorder_point, Max_in_stock, Out_of_stock_explanation, Restock_date) VALUES (20, 20, 400, 40, 2000, NULL, NULL);
select * from s_inventory

INSERT INTO s_title (title) VALUES ('Giam doc');
INSERT INTO s_title (title) VALUES ('Pho giam doc');
INSERT INTO s_title (title) VALUES ('Truong phong KD');
INSERT INTO s_title (title) VALUES ('Truong phong Marketing');
INSERT INTO s_title (title) VALUES ('Ke toan truong');
INSERT INTO s_title (title) VALUES ('Quan tri he thong');
INSERT INTO s_title (title) VALUES ('Truong kho');
INSERT INTO s_title (title) VALUES ('Nhan vien kho');
INSERT INTO s_title (title) VALUES ('Chuyen vien CSKH');
INSERT INTO s_title (title) VALUES ('Ke toan vien');
INSERT INTO s_title (title) VALUES ('Sale Rep 1');
INSERT INTO s_title (title) VALUES ('Sale Rep 2');
INSERT INTO s_title (title) VALUES ('Sale Rep 3');
INSERT INTO s_title (title) VALUES ('Sale Rep 4');
INSERT INTO s_title (title) VALUES ('Sale Rep 5');
INSERT INTO s_title (title) VALUES ('Sale Rep 6');
INSERT INTO s_title (title) VALUES ('Sale Rep 7');
INSERT INTO s_title (title) VALUES ('Sale Rep 8');
INSERT INTO s_title (title) VALUES ('Sale Rep 9');
INSERT INTO s_title (title) VALUES ('Sale Rep 10');
select * from s_title

INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (1, 'jpg', 1, 'vi_da_nam_01.jpg', 'img_data_1');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (2, 'png', 1, 'vi_da_nam_02.png', 'img_data_2');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (3, 'jpg', 1, 'vi_da_nu_01.jpg', 'img_data_3');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (4, 'jpg', 0, 'that_lung_01.jpg', 'img_data_4');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (5, 'png', 1, 'that_lung_02.png', 'img_data_5');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (6, 'jpg', 1, 'tui_xach_01.jpg', 'img_data_6');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (7, 'jpg', 0, 'tui_xach_02.jpg', 'img_data_7');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (8, 'png', 1, 'balo_da_01.png', 'img_data_8');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (9, 'jpg', 1, 'balo_da_02.jpg', 'img_data_9');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (10, 'jpg', 1, 'tui_cheo_01.jpg', 'img_data_10');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (11, 'png', 1, 'day_dong_ho_1.png', 'img_data_11');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (12, 'jpg', 0, 'day_dong_ho_2.jpg', 'img_data_12');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (13, 'jpg', 1, 'bao_da_ipad_1.jpg', 'img_data_13');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (14, 'png', 1, 'bao_da_ipad_2.png', 'img_data_14');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (15, 'jpg', 1, 'vi_cam_tay_1.jpg', 'img_data_15');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (16, 'jpg', 0, 'vi_cam_tay_2.jpg', 'img_data_16');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (17, 'png', 1, 'mockhoa_da_1.png', 'img_data_17');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (18, 'jpg', 1, 'mockhoa_da_2.jpg', 'img_data_18');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (19, 'jpg', 1, 'so_da_01.jpg', 'img_data_19');
INSERT INTO s_image (id, Format, Use_filename, Filename, Image) VALUES (20, 'png', 0, 'so_da_02.png', 'img_data_20');
Select * from s_image

INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (1, 1, 'desc_vida1.txt', 'Vi da bo sap nguyen tam');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (2, 1, 'desc_vida2.txt', 'Vi da ca sau that 100%');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (3, 1, 'desc_vidanu.txt', 'Vi nu nho gon tien loi');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (4, 1, 'desc_thatlung1.txt', 'That lung nam khoa dong');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (5, 1, 'desc_thatlung2.txt', 'That lung da Epsom');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (6, 1, 'desc_tuixach1.txt', 'Tui xach cong so cao cap');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (7, 1, 'desc_tuixach2.txt', 'Tui du lich dung tich lon');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (8, 1, 'desc_balo1.txt', 'Balo laptop da that');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (9, 1, 'desc_balo2.txt', 'Balo mini thoi trang');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (10, 1, 'desc_tuicheo.txt', 'Tui deo cheo nang dong');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (11, 1, 'desc_daydh1.txt', 'Day dong ho da Vegtan');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (12, 1, 'desc_daydh2.txt', 'Day dong ho da ky da');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (13, 1, 'desc_ipad1.txt', 'Bao da Ipad Pro 11');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (14, 1, 'desc_ipad2.txt', 'Bao da Ipad Mini');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (15, 1, 'desc_vicamtay1.txt', 'Clutch da nam du tiec');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (16, 1, 'desc_vicamtay2.txt', 'Clutch nu dinh da');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (17, 1, 'desc_mockhoa1.txt', 'Moc khoa khac ten');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (18, 1, 'desc_mockhoa2.txt', 'Moc khoa xe hoi');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (19, 1, 'desc_soda1.txt', 'So tay bia da A5');
INSERT INTO s_longtext (id, Use_filename, Filename, Text) VALUES (20, 1, 'desc_soda2.txt', 'So tay ruot thay the');
select * from s_longtext

SELECT name AS "Ten khach hang",
id AS "Ma khach hang"
FROM s_customer
ORDER BY id DESC;

SELECT first_name || ' ' || last_name AS "Employees",
dept_id
FROM s_emp
WHERE dept_id IN (10, 50)
ORDER BY first_name;

SELECT last_name, first_name
FROM s_emp
WHERE first_name LIKE '%S%'
OR last_name LIKE '%S%';

SELECT userid, start_date
FROM s_emp
WHERE start_date BETWEEN TO_DATE('14/05/2007','DD/MM/YYYY')
AND TO_DATE('26/05/2026','DD/MM/YYYY');

SELECT last_name, salary
FROM s_emp
WHERE salary BETWEEN 1000 AND 2000;

SELECT last_name || ' ' || first_name AS "Employee Name",
salary AS "Monthly Salary"
FROM s_emp
WHERE dept_id IN (31, 42, 50)
AND salary > 1350;

SELECT last_name, start_date
FROM s_emp
WHERE start_date BETWEEN TO_DATE('01/01/1991','DD/MM/YYYY')
AND TO_DATE('31/12/1991','DD/MM/YYYY');

SELECT last_name, first_name
FROM s_emp
WHERE id NOT IN (SELECT DISTINCT manager_id
FROM s_emp
WHERE manager_id IS NOT NULL);

SELECT name
FROM s_product
WHERE name LIKE 'Pro%'
ORDER BY name ASC;

SELECT name, short_desc
FROM s_product
WHERE LOWER(short_desc) LIKE '%bicycle%';

SELECT short_desc
FROM s_product;

SELECT last_name || ' ' || first_name || ' (' || title || ')' AS "Nhan vien"
FROM s_emp;

SELECT id,
last_name,
ROUND(salary * 1.15, 2) AS "Luong moi"
FROM s_emp;

SELECT last_name,
start_date,
TO_CHAR(
NEXT_DAY(ADD_MONTHS(start_date, 6), 'MONDAY'),
'Ddspth "of" Month YYYY'
) AS "Ngay xet tang luong"
FROM s_emp;

SELECT name
FROM s_product
WHERE LOWER(name) LIKE '%ski%';

SELECT last_name,
ROUND(MONTHS_BETWEEN(SYSDATE, start_date)) AS "So thang tham
nien"
FROM s_emp
ORDER BY MONTHS_BETWEEN(SYSDATE, start_date) ASC;

SELECT COUNT(DISTINCT manager_id) AS "So nguoi quan ly"
FROM s_emp
WHERE manager_id IS NOT NULL;

SELECT MAX(total) AS "Highest",
MIN(total) AS "Lowest"
FROM s_ord;

SELECT p.name,
p.id,
i.quantity AS "ORDERED"
FROM s_product p, s_item i
WHERE p.id = i.product_id
AND i.ord_id = 101;

SELECT c.id AS "Ma khach hang",
o.id AS "Ma don hang"
FROM s_customer c LEFT JOIN s_ord o
ON c.id = o.customer_id
ORDER BY c.id;

SELECT o.customer_id,
i.product_id,
i.quantity
FROM s_ord o, s_item i
WHERE o.id = i.ord_id
AND o.total > 100000;

SELECT manager_id AS "Ma quan ly",
COUNT(id) AS "So nhan vien"
FROM s_emp
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id;

SELECT manager_id AS "Ma quan ly",
COUNT(id) AS "So nhan vien"
FROM s_emp
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING COUNT(id) >= 20;

SELECT r.id AS "Ma vung",
r.name AS "Ten vung",
COUNT(d.id) AS "So phong ban"
FROM s_region r, s_dept d
WHERE r.id = d.region_id
GROUP BY r.id, r.name
ORDER BY r.id;

SELECT c.name AS "Ten khach hang",
COUNT(o.id) AS "So don dat hang"
FROM s_customer c, s_ord o
WHERE c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY c.name;

SELECT c.name, COUNT(o.id) AS "So don hang"
FROM s_customer c, s_ord o
WHERE c.id = o.customer_id
GROUP BY c.id, c.name
HAVING COUNT(o.id) = (
SELECT MAX(COUNT(id))
FROM s_ord
GROUP BY customer_id
);

SELECT c.name, SUM(o.total) AS "Tong tien"
FROM s_customer c, s_ord o
WHERE c.id = o.customer_id
GROUP BY c.id, c.name
HAVING SUM(o.total) = (
SELECT MAX(SUM(total))
FROM s_ord
GROUP BY customer_id
);

SELECT last_name, first_name, start_date
FROM s_emp
WHERE dept_id = (
SELECT dept_id
FROM s_emp
WHERE first_name = 'Lan'
)
AND first_name != 'Lan';

SELECT id, last_name, first_name, userid
FROM s_emp
WHERE salary > (SELECT AVG(salary) FROM s_emp);

SELECT id, last_name, first_name
FROM s_emp
WHERE salary > (SELECT AVG(salary) FROM s_emp)
AND (UPPER(first_name) LIKE '%L%'
OR UPPER(last_name) LIKE '%L%');

SELECT c.name
FROM s_customer c
WHERE NOT EXISTS (
SELECT 1
FROM s_ord o
WHERE o.customer_id = c.id
);
