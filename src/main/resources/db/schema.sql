-- -----------------------------------------------------
-- Table "CATEGORIES"
-- -----------------------------------------------------
CREATE TABLE CATEGORIES (
  "id_category" SERIAL NOT NULL,
  "description" VARCHAR(45) NOT NULL,
  "state" BOOLEAN NOT NULL,
  PRIMARY KEY ("id_category"));


-- -----------------------------------------------------
-- Table "PRODUCTS"
-- -----------------------------------------------------
CREATE TABLE PRODUCTS (
  "id_product" SERIAL NOT NULL,
  "name" VARCHAR(45) NULL,
  "id_category" INT NOT NULL,
  "barcode" VARCHAR(150) NULL,
  "selling_price" DECIMAL(16,2) NULL,
  "stock_quantity" INT NOT NULL,
  "state" BOOLEAN NULL,
  PRIMARY KEY ("id_product"),
  CONSTRAINT "fk_PRODUCTS_CATEGORIES"
    FOREIGN KEY ("id_category")
    REFERENCES CATEGORIES ("id_category")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "CUSTOMERS"
-- -----------------------------------------------------
CREATE TABLE CUSTOMERS (
  "id" VARCHAR(20) NOT NULL,
  "name" VARCHAR(40) NULL,
  "last_name" VARCHAR(100) NULL,
  "cellphone" NUMERIC NULL,
  "address" VARCHAR(80) NULL,
  "email" VARCHAR(70) NULL,
  PRIMARY KEY ("id"));


-- -----------------------------------------------------
-- Table "PURCHASES"
-- -----------------------------------------------------
CREATE TABLE PURCHASES (
  "id_purchase" SERIAL NOT NULL,
  "id_customer" VARCHAR(20) NOT NULL,
  "date" TIMESTAMP NULL,
  "payment_method" CHAR(1) NULL,
  "comment" VARCHAR(300) NULL,
  "state" CHAR(1) NULL,
  PRIMARY KEY ("id_purchase"),
  CONSTRAINT "fk_PURCHASES_CUSTOMERS"
    FOREIGN KEY ("id_customer")
    REFERENCES CUSTOMERS ("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table "PURCHASES_PRODUCTS"
-- -----------------------------------------------------
CREATE TABLE PURCHASES_PRODUCTS (
  "id_purchase" INT NOT NULL,
  "id_product" INT NOT NULL,
  "quantity" INT NULL,
  "total" DECIMAL(16,2) NULL,
  "state" BOOLEAN NULL,
  PRIMARY KEY ("id_purchase", "id_product"),
  CONSTRAINT "fk_PURCHASES_PRODUCTS_PRODUCTS"
    FOREIGN KEY ("id_product")
    REFERENCES PRODUCTS ("id_product")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_PURCHASES_PRODUCTS_PURCHASES"
    FOREIGN KEY ("id_purchase")
    REFERENCES PURCHASES ("id_purchase")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
