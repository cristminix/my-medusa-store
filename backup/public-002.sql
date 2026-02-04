/*
 Navicat Premium Dump SQL

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 160011 (160011)
 Source Host           : localhost:5432
 Source Catalog        : medusa-my-medusa-store
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160011 (160011)
 File Encoding         : 65001

 Date: 04/02/2026 09:28:30
*/


-- ----------------------------
-- Type structure for claim_reason_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."claim_reason_enum";
CREATE TYPE "public"."claim_reason_enum" AS ENUM (
  'missing_item',
  'wrong_item',
  'production_failure',
  'other'
);

-- ----------------------------
-- Type structure for order_claim_type_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."order_claim_type_enum";
CREATE TYPE "public"."order_claim_type_enum" AS ENUM (
  'refund',
  'replace'
);

-- ----------------------------
-- Type structure for order_status_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."order_status_enum";
CREATE TYPE "public"."order_status_enum" AS ENUM (
  'pending',
  'completed',
  'draft',
  'archived',
  'canceled',
  'requires_action'
);

-- ----------------------------
-- Type structure for return_status_enum
-- ----------------------------
DROP TYPE IF EXISTS "public"."return_status_enum";
CREATE TYPE "public"."return_status_enum" AS ENUM (
  'open',
  'requested',
  'received',
  'partially_received',
  'canceled'
);

-- ----------------------------
-- Sequence structure for link_module_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."link_module_migrations_id_seq";
CREATE SEQUENCE "public"."link_module_migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for mikro_orm_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."mikro_orm_migrations_id_seq";
CREATE SEQUENCE "public"."mikro_orm_migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_change_action_ordering_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_change_action_ordering_seq";
CREATE SEQUENCE "public"."order_change_action_ordering_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_claim_display_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_claim_display_id_seq";
CREATE SEQUENCE "public"."order_claim_display_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_display_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_display_id_seq";
CREATE SEQUENCE "public"."order_display_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_exchange_display_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_exchange_display_id_seq";
CREATE SEQUENCE "public"."order_exchange_display_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for return_display_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."return_display_id_seq";
CREATE SEQUENCE "public"."return_display_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for script_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."script_migrations_id_seq";
CREATE SEQUENCE "public"."script_migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for account_holder
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_holder";
CREATE TABLE "public"."account_holder" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "external_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default",
  "data" jsonb NOT NULL DEFAULT '{}'::jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of account_holder
-- ----------------------------

-- ----------------------------
-- Table structure for api_key
-- ----------------------------
DROP TABLE IF EXISTS "public"."api_key";
CREATE TABLE "public"."api_key" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "token" text COLLATE "pg_catalog"."default" NOT NULL,
  "salt" text COLLATE "pg_catalog"."default" NOT NULL,
  "redacted" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "last_used_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "revoked_by" text COLLATE "pg_catalog"."default",
  "revoked_at" timestamptz(6),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of api_key
-- ----------------------------
INSERT INTO "public"."api_key" VALUES ('apk_01KGH9CNXSAB7F4FDPV3ZGB8BP', 'pk_7ed9642efbc3ab13e2560b82aad4c055f1d5e3c3785268d93c1b08158c9b37b3', '', 'pk_7ed***7b3', 'Default Publishable API Key', 'publishable', NULL, '', '2026-02-03 15:20:04.154+07', NULL, NULL, '2026-02-03 15:20:04.154+07', NULL);

-- ----------------------------
-- Table structure for application_method_buy_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_method_buy_rules";
CREATE TABLE "public"."application_method_buy_rules" (
  "application_method_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_rule_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of application_method_buy_rules
-- ----------------------------

-- ----------------------------
-- Table structure for application_method_target_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."application_method_target_rules";
CREATE TABLE "public"."application_method_target_rules" (
  "application_method_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_rule_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of application_method_target_rules
-- ----------------------------

-- ----------------------------
-- Table structure for auth_identity
-- ----------------------------
DROP TABLE IF EXISTS "public"."auth_identity";
CREATE TABLE "public"."auth_identity" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "app_metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of auth_identity
-- ----------------------------
INSERT INTO "public"."auth_identity" VALUES ('authid_01KGHB0RGJZNXSYYHE1CQTT5A5', '{"user_id": "user_01KGHB0RKENB87PPDE870FQMKH"}', '2026-02-03 15:48:30.739+07', '2026-02-03 15:48:30.867+07', NULL);

-- ----------------------------
-- Table structure for capture
-- ----------------------------
DROP TABLE IF EXISTS "public"."capture";
CREATE TABLE "public"."capture" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "payment_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default",
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of capture
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart";
CREATE TABLE "public"."cart" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "region_id" text COLLATE "pg_catalog"."default",
  "customer_id" text COLLATE "pg_catalog"."default",
  "sales_channel_id" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "shipping_address_id" text COLLATE "pg_catalog"."default",
  "billing_address_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "completed_at" timestamptz(6),
  "locale" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO "public"."cart" VALUES ('cart_01KGHG0CGTQNPT4SF5GA2CM86Z', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', NULL, 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', NULL, 'idr', NULL, NULL, NULL, '2026-02-03 17:15:41.341+07', '2026-02-03 17:15:41.341+07', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cart_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_address";
CREATE TABLE "public"."cart_address" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" text COLLATE "pg_catalog"."default",
  "company" text COLLATE "pg_catalog"."default",
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "address_1" text COLLATE "pg_catalog"."default",
  "address_2" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default",
  "province" text COLLATE "pg_catalog"."default",
  "postal_code" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of cart_address
-- ----------------------------

-- ----------------------------
-- Table structure for cart_line_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_line_item";
CREATE TABLE "public"."cart_line_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "cart_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "subtitle" text COLLATE "pg_catalog"."default",
  "thumbnail" text COLLATE "pg_catalog"."default",
  "quantity" int4 NOT NULL,
  "variant_id" text COLLATE "pg_catalog"."default",
  "product_id" text COLLATE "pg_catalog"."default",
  "product_title" text COLLATE "pg_catalog"."default",
  "product_description" text COLLATE "pg_catalog"."default",
  "product_subtitle" text COLLATE "pg_catalog"."default",
  "product_type" text COLLATE "pg_catalog"."default",
  "product_collection" text COLLATE "pg_catalog"."default",
  "product_handle" text COLLATE "pg_catalog"."default",
  "variant_sku" text COLLATE "pg_catalog"."default",
  "variant_barcode" text COLLATE "pg_catalog"."default",
  "variant_title" text COLLATE "pg_catalog"."default",
  "variant_option_values" jsonb,
  "requires_shipping" bool NOT NULL DEFAULT true,
  "is_discountable" bool NOT NULL DEFAULT true,
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "compare_at_unit_price" numeric,
  "raw_compare_at_unit_price" jsonb,
  "unit_price" numeric NOT NULL,
  "raw_unit_price" jsonb NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "product_type_id" text COLLATE "pg_catalog"."default",
  "is_custom_price" bool NOT NULL DEFAULT false,
  "is_giftcard" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of cart_line_item
-- ----------------------------
INSERT INTO "public"."cart_line_item" VALUES ('cali_01KGGTC3ARRT5ZNJZZ93G8QZ6C', 'cart_01KGHG0CGTQNPT4SF5GA2CM86Z', 'Medusa Sweatpants', 'S', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', 1, 'variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'prod_01KGH9CW124AGG4YGFJ9X41SH0', 'Medusa Sweatpants', 'Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.', NULL, NULL, NULL, 'sweatpants', 'SWEATPANTS-S', NULL, 'S', NULL, 't', 't', 'f', NULL, NULL, 1500000, '{"value": "1500000", "precision": 20}', '{}', '2026-02-03 10:57:36.473+07', '2026-02-03 10:58:03.921+07', '2026-02-03 10:58:03.921+07', NULL, 'f', 'f');
INSERT INTO "public"."cart_line_item" VALUES ('cali_01KGGTD6CM3ER5J522T8QY8JEX', 'cart_01KGHG0CGTQNPT4SF5GA2CM86Z', 'Medusa Sweatpants', 'S', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', 1, 'variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'prod_01KGH9CW124AGG4YGFJ9X41SH0', 'Medusa Sweatpants', 'Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.', NULL, NULL, NULL, 'sweatpants', 'SWEATPANTS-S', NULL, 'S', NULL, 't', 't', 'f', NULL, NULL, 1500000, '{"value": "1500000", "precision": 20}', '{}', '2026-02-03 10:58:12.372+07', '2026-02-03 11:26:28.856+07', '2026-02-03 11:26:28.854+07', NULL, 'f', 'f');
INSERT INTO "public"."cart_line_item" VALUES ('cali_01KGHQC9A8GPMB5EF43Y4ZNX7D', 'cart_01KGHG0CGTQNPT4SF5GA2CM86Z', 'MOLI Flavored Syrup', 'Vanilla', 'http://localhost:9000/static/1770092878428-vanilla-copy.jpg', 1, 'variant_01KGGXFGH6ZFDFS6JMG05ST45Y', 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'MOLI Flavored Syrup', 'Sirup MOLI dengan berbagai varian rasa', NULL, 'Food & Baverage', NULL, 'moli-flavored-syrup', NULL, NULL, 'Vanilla', NULL, 't', 't', 'f', NULL, NULL, 19000, '{"value": "19000", "precision": 20}', '{}', '2026-02-03 19:24:31.304+07', '2026-02-03 19:24:31.304+07', NULL, 'ptyp_01KGGY0TH6663F5C20QTB5K6J1', 'f', 'f');
INSERT INTO "public"."cart_line_item" VALUES ('cali_01KGHQDRQ9N23882QJ96DF4VYK', 'cart_01KGHG0CGTQNPT4SF5GA2CM86Z', 'MOLI Flavored Syrup', 'Strawberry', 'http://localhost:9000/static/1770092878422-strawberry-copy.jpg', 1, 'variant_01KGGX56WAEVMET9KPE4R9BQ38', 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'MOLI Flavored Syrup', 'Sirup MOLI dengan berbagai varian rasa', NULL, 'Food & Baverage', NULL, 'moli-flavored-syrup', NULL, NULL, 'Strawberry', NULL, 't', 't', 'f', NULL, NULL, 24000, '{"value": "24000", "precision": 20}', '{}', '2026-02-03 19:25:19.849+07', '2026-02-03 19:25:19.849+07', NULL, 'ptyp_01KGGY0TH6663F5C20QTB5K6J1', 'f', 'f');

-- ----------------------------
-- Table structure for cart_line_item_adjustment
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_line_item_adjustment";
CREATE TABLE "public"."cart_line_item_adjustment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "promotion_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "item_id" text COLLATE "pg_catalog"."default",
  "is_tax_inclusive" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of cart_line_item_adjustment
-- ----------------------------

-- ----------------------------
-- Table structure for cart_line_item_tax_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_line_item_tax_line";
CREATE TABLE "public"."cart_line_item_tax_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "tax_rate_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate" float4 NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "item_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cart_line_item_tax_line
-- ----------------------------

-- ----------------------------
-- Table structure for cart_payment_collection
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_payment_collection";
CREATE TABLE "public"."cart_payment_collection" (
  "cart_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "payment_collection_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of cart_payment_collection
-- ----------------------------

-- ----------------------------
-- Table structure for cart_promotion
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_promotion";
CREATE TABLE "public"."cart_promotion" (
  "cart_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of cart_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for cart_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_shipping_method";
CREATE TABLE "public"."cart_shipping_method" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "cart_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" jsonb,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "shipping_option_id" text COLLATE "pg_catalog"."default",
  "data" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of cart_shipping_method
-- ----------------------------

-- ----------------------------
-- Table structure for cart_shipping_method_adjustment
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_shipping_method_adjustment";
CREATE TABLE "public"."cart_shipping_method_adjustment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "promotion_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "shipping_method_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cart_shipping_method_adjustment
-- ----------------------------

-- ----------------------------
-- Table structure for cart_shipping_method_tax_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_shipping_method_tax_line";
CREATE TABLE "public"."cart_shipping_method_tax_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "tax_rate_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate" float4 NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "shipping_method_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of cart_shipping_method_tax_line
-- ----------------------------

-- ----------------------------
-- Table structure for credit_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."credit_line";
CREATE TABLE "public"."credit_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "cart_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "reference" text COLLATE "pg_catalog"."default",
  "reference_id" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of credit_line
-- ----------------------------

-- ----------------------------
-- Table structure for currency
-- ----------------------------
DROP TABLE IF EXISTS "public"."currency";
CREATE TABLE "public"."currency" (
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "symbol" text COLLATE "pg_catalog"."default" NOT NULL,
  "symbol_native" text COLLATE "pg_catalog"."default" NOT NULL,
  "decimal_digits" int4 NOT NULL DEFAULT 0,
  "rounding" numeric NOT NULL DEFAULT 0,
  "raw_rounding" jsonb NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of currency
-- ----------------------------
INSERT INTO "public"."currency" VALUES ('usd', '$', '$', 2, 0, '{"value": "0", "precision": 20}', 'US Dollar', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('cad', 'CA$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Canadian Dollar', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('eur', '€', '€', 2, 0, '{"value": "0", "precision": 20}', 'Euro', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('aed', 'AED', 'د.إ.‏', 2, 0, '{"value": "0", "precision": 20}', 'United Arab Emirates Dirham', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('afn', 'Af', '؋', 0, 0, '{"value": "0", "precision": 20}', 'Afghan Afghani', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('all', 'ALL', 'Lek', 0, 0, '{"value": "0", "precision": 20}', 'Albanian Lek', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('amd', 'AMD', 'դր.', 0, 0, '{"value": "0", "precision": 20}', 'Armenian Dram', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('ars', 'AR$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Argentine Peso', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('aud', 'AU$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Australian Dollar', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('azn', 'man.', 'ман.', 2, 0, '{"value": "0", "precision": 20}', 'Azerbaijani Manat', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bam', 'KM', 'KM', 2, 0, '{"value": "0", "precision": 20}', 'Bosnia-Herzegovina Convertible Mark', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bdt', 'Tk', '৳', 2, 0, '{"value": "0", "precision": 20}', 'Bangladeshi Taka', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bgn', 'BGN', 'лв.', 2, 0, '{"value": "0", "precision": 20}', 'Bulgarian Lev', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bhd', 'BD', 'د.ب.‏', 3, 0, '{"value": "0", "precision": 20}', 'Bahraini Dinar', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bif', 'FBu', 'FBu', 0, 0, '{"value": "0", "precision": 20}', 'Burundian Franc', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bnd', 'BN$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Brunei Dollar', '2026-02-03 15:19:55.876+07', '2026-02-03 15:19:55.876+07', NULL);
INSERT INTO "public"."currency" VALUES ('bob', 'Bs', 'Bs', 2, 0, '{"value": "0", "precision": 20}', 'Bolivian Boliviano', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('brl', 'R$', 'R$', 2, 0, '{"value": "0", "precision": 20}', 'Brazilian Real', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('bwp', 'BWP', 'P', 2, 0, '{"value": "0", "precision": 20}', 'Botswanan Pula', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('byn', 'Br', 'руб.', 2, 0, '{"value": "0", "precision": 20}', 'Belarusian Ruble', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('bzd', 'BZ$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Belize Dollar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('cdf', 'CDF', 'FrCD', 2, 0, '{"value": "0", "precision": 20}', 'Congolese Franc', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('chf', 'CHF', 'CHF', 2, 0.05, '{"value": "0.05", "precision": 20}', 'Swiss Franc', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('clp', 'CL$', '$', 0, 0, '{"value": "0", "precision": 20}', 'Chilean Peso', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('cny', 'CN¥', 'CN¥', 2, 0, '{"value": "0", "precision": 20}', 'Chinese Yuan', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('cop', 'CO$', '$', 0, 0, '{"value": "0", "precision": 20}', 'Colombian Peso', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('crc', '₡', '₡', 0, 0, '{"value": "0", "precision": 20}', 'Costa Rican Colón', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('cve', 'CV$', 'CV$', 2, 0, '{"value": "0", "precision": 20}', 'Cape Verdean Escudo', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('czk', 'Kč', 'Kč', 2, 0, '{"value": "0", "precision": 20}', 'Czech Republic Koruna', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('djf', 'Fdj', 'Fdj', 0, 0, '{"value": "0", "precision": 20}', 'Djiboutian Franc', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('dkk', 'Dkr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Danish Krone', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('dop', 'RD$', 'RD$', 2, 0, '{"value": "0", "precision": 20}', 'Dominican Peso', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('dzd', 'DA', 'د.ج.‏', 2, 0, '{"value": "0", "precision": 20}', 'Algerian Dinar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('eek', 'Ekr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Estonian Kroon', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('egp', 'EGP', 'ج.م.‏', 2, 0, '{"value": "0", "precision": 20}', 'Egyptian Pound', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('ern', 'Nfk', 'Nfk', 2, 0, '{"value": "0", "precision": 20}', 'Eritrean Nakfa', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('etb', 'Br', 'Br', 2, 0, '{"value": "0", "precision": 20}', 'Ethiopian Birr', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('gbp', '£', '£', 2, 0, '{"value": "0", "precision": 20}', 'British Pound Sterling', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('gel', 'GEL', 'GEL', 2, 0, '{"value": "0", "precision": 20}', 'Georgian Lari', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('ghs', 'GH₵', 'GH₵', 2, 0, '{"value": "0", "precision": 20}', 'Ghanaian Cedi', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('gnf', 'FG', 'FG', 0, 0, '{"value": "0", "precision": 20}', 'Guinean Franc', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('gtq', 'GTQ', 'Q', 2, 0, '{"value": "0", "precision": 20}', 'Guatemalan Quetzal', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('hkd', 'HK$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Hong Kong Dollar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('hnl', 'HNL', 'L', 2, 0, '{"value": "0", "precision": 20}', 'Honduran Lempira', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('hrk', 'kn', 'kn', 2, 0, '{"value": "0", "precision": 20}', 'Croatian Kuna', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('huf', 'Ft', 'Ft', 0, 0, '{"value": "0", "precision": 20}', 'Hungarian Forint', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('idr', 'Rp', 'Rp', 0, 0, '{"value": "0", "precision": 20}', 'Indonesian Rupiah', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('ils', '₪', '₪', 2, 0, '{"value": "0", "precision": 20}', 'Israeli New Sheqel', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('inr', 'Rs', '₹', 2, 0, '{"value": "0", "precision": 20}', 'Indian Rupee', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('iqd', 'IQD', 'د.ع.‏', 0, 0, '{"value": "0", "precision": 20}', 'Iraqi Dinar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('irr', 'IRR', '﷼', 0, 0, '{"value": "0", "precision": 20}', 'Iranian Rial', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('isk', 'Ikr', 'kr', 0, 0, '{"value": "0", "precision": 20}', 'Icelandic Króna', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('jmd', 'J$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Jamaican Dollar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('jod', 'JD', 'د.أ.‏', 3, 0, '{"value": "0", "precision": 20}', 'Jordanian Dinar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('jpy', '¥', '￥', 0, 0, '{"value": "0", "precision": 20}', 'Japanese Yen', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('kes', 'Ksh', 'Ksh', 2, 0, '{"value": "0", "precision": 20}', 'Kenyan Shilling', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('khr', 'KHR', '៛', 2, 0, '{"value": "0", "precision": 20}', 'Cambodian Riel', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('kmf', 'CF', 'FC', 0, 0, '{"value": "0", "precision": 20}', 'Comorian Franc', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('krw', '₩', '₩', 0, 0, '{"value": "0", "precision": 20}', 'South Korean Won', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('kwd', 'KD', 'د.ك.‏', 3, 0, '{"value": "0", "precision": 20}', 'Kuwaiti Dinar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('kzt', 'KZT', 'тңг.', 2, 0, '{"value": "0", "precision": 20}', 'Kazakhstani Tenge', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('lbp', 'LB£', 'ل.ل.‏', 0, 0, '{"value": "0", "precision": 20}', 'Lebanese Pound', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('lkr', 'SLRs', 'SL Re', 2, 0, '{"value": "0", "precision": 20}', 'Sri Lankan Rupee', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('ltl', 'Lt', 'Lt', 2, 0, '{"value": "0", "precision": 20}', 'Lithuanian Litas', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('lvl', 'Ls', 'Ls', 2, 0, '{"value": "0", "precision": 20}', 'Latvian Lats', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('lyd', 'LD', 'د.ل.‏', 3, 0, '{"value": "0", "precision": 20}', 'Libyan Dinar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mad', 'MAD', 'د.م.‏', 2, 0, '{"value": "0", "precision": 20}', 'Moroccan Dirham', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mdl', 'MDL', 'MDL', 2, 0, '{"value": "0", "precision": 20}', 'Moldovan Leu', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mga', 'MGA', 'MGA', 0, 0, '{"value": "0", "precision": 20}', 'Malagasy Ariary', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mkd', 'MKD', 'MKD', 2, 0, '{"value": "0", "precision": 20}', 'Macedonian Denar', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mmk', 'MMK', 'K', 0, 0, '{"value": "0", "precision": 20}', 'Myanma Kyat', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mnt', 'MNT', '₮', 0, 0, '{"value": "0", "precision": 20}', 'Mongolian Tugrig', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mop', 'MOP$', 'MOP$', 2, 0, '{"value": "0", "precision": 20}', 'Macanese Pataca', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mur', 'MURs', 'MURs', 0, 0, '{"value": "0", "precision": 20}', 'Mauritian Rupee', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mwk', 'K', 'K', 2, 0, '{"value": "0", "precision": 20}', 'Malawian Kwacha', '2026-02-03 15:19:55.877+07', '2026-02-03 15:19:55.877+07', NULL);
INSERT INTO "public"."currency" VALUES ('mxn', 'MX$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Mexican Peso', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('myr', 'RM', 'RM', 2, 0, '{"value": "0", "precision": 20}', 'Malaysian Ringgit', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('mzn', 'MTn', 'MTn', 2, 0, '{"value": "0", "precision": 20}', 'Mozambican Metical', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('nad', 'N$', 'N$', 2, 0, '{"value": "0", "precision": 20}', 'Namibian Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('ngn', '₦', '₦', 2, 0, '{"value": "0", "precision": 20}', 'Nigerian Naira', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('nio', 'C$', 'C$', 2, 0, '{"value": "0", "precision": 20}', 'Nicaraguan Córdoba', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('nok', 'Nkr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Norwegian Krone', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('npr', 'NPRs', 'नेरू', 2, 0, '{"value": "0", "precision": 20}', 'Nepalese Rupee', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('nzd', 'NZ$', '$', 2, 0, '{"value": "0", "precision": 20}', 'New Zealand Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('omr', 'OMR', 'ر.ع.‏', 3, 0, '{"value": "0", "precision": 20}', 'Omani Rial', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('pab', 'B/.', 'B/.', 2, 0, '{"value": "0", "precision": 20}', 'Panamanian Balboa', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('pen', 'S/.', 'S/.', 2, 0, '{"value": "0", "precision": 20}', 'Peruvian Nuevo Sol', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('php', '₱', '₱', 2, 0, '{"value": "0", "precision": 20}', 'Philippine Peso', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('pkr', 'PKRs', '₨', 0, 0, '{"value": "0", "precision": 20}', 'Pakistani Rupee', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('pln', 'zł', 'zł', 2, 0, '{"value": "0", "precision": 20}', 'Polish Zloty', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('pyg', '₲', '₲', 0, 0, '{"value": "0", "precision": 20}', 'Paraguayan Guarani', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('qar', 'QR', 'ر.ق.‏', 2, 0, '{"value": "0", "precision": 20}', 'Qatari Rial', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('ron', 'RON', 'RON', 2, 0, '{"value": "0", "precision": 20}', 'Romanian Leu', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('rsd', 'din.', 'дин.', 0, 0, '{"value": "0", "precision": 20}', 'Serbian Dinar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('rub', 'RUB', '₽.', 2, 0, '{"value": "0", "precision": 20}', 'Russian Ruble', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('rwf', 'RWF', 'FR', 0, 0, '{"value": "0", "precision": 20}', 'Rwandan Franc', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('sar', 'SR', 'ر.س.‏', 2, 0, '{"value": "0", "precision": 20}', 'Saudi Riyal', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('sdg', 'SDG', 'SDG', 2, 0, '{"value": "0", "precision": 20}', 'Sudanese Pound', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('sek', 'Skr', 'kr', 2, 0, '{"value": "0", "precision": 20}', 'Swedish Krona', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('sgd', 'S$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Singapore Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('sos', 'Ssh', 'Ssh', 0, 0, '{"value": "0", "precision": 20}', 'Somali Shilling', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('syp', 'SY£', 'ل.س.‏', 0, 0, '{"value": "0", "precision": 20}', 'Syrian Pound', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('thb', '฿', '฿', 2, 0, '{"value": "0", "precision": 20}', 'Thai Baht', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('tnd', 'DT', 'د.ت.‏', 3, 0, '{"value": "0", "precision": 20}', 'Tunisian Dinar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('top', 'T$', 'T$', 2, 0, '{"value": "0", "precision": 20}', 'Tongan Paʻanga', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('tjs', 'TJS', 'с.', 2, 0, '{"value": "0", "precision": 20}', 'Tajikistani Somoni', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('try', '₺', '₺', 2, 0, '{"value": "0", "precision": 20}', 'Turkish Lira', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('ttd', 'TT$', '$', 2, 0, '{"value": "0", "precision": 20}', 'Trinidad and Tobago Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('twd', 'NT$', 'NT$', 2, 0, '{"value": "0", "precision": 20}', 'New Taiwan Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('tzs', 'TSh', 'TSh', 0, 0, '{"value": "0", "precision": 20}', 'Tanzanian Shilling', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('uah', '₴', '₴', 2, 0, '{"value": "0", "precision": 20}', 'Ukrainian Hryvnia', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('ugx', 'USh', 'USh', 0, 0, '{"value": "0", "precision": 20}', 'Ugandan Shilling', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('uyu', '$U', '$', 2, 0, '{"value": "0", "precision": 20}', 'Uruguayan Peso', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('uzs', 'UZS', 'UZS', 0, 0, '{"value": "0", "precision": 20}', 'Uzbekistan Som', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('vef', 'Bs.F.', 'Bs.F.', 2, 0, '{"value": "0", "precision": 20}', 'Venezuelan Bolívar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('vnd', '₫', '₫', 0, 0, '{"value": "0", "precision": 20}', 'Vietnamese Dong', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('xaf', 'FCFA', 'FCFA', 0, 0, '{"value": "0", "precision": 20}', 'CFA Franc BEAC', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('xof', 'CFA', 'CFA', 0, 0, '{"value": "0", "precision": 20}', 'CFA Franc BCEAO', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('xpf', '₣', '₣', 0, 0, '{"value": "0", "precision": 20}', 'CFP Franc', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('yer', 'YR', 'ر.ي.‏', 0, 0, '{"value": "0", "precision": 20}', 'Yemeni Rial', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('zar', 'R', 'R', 2, 0, '{"value": "0", "precision": 20}', 'South African Rand', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('zmk', 'ZK', 'ZK', 0, 0, '{"value": "0", "precision": 20}', 'Zambian Kwacha', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);
INSERT INTO "public"."currency" VALUES ('zwl', 'ZWL$', 'ZWL$', 0, 0, '{"value": "0", "precision": 20}', 'Zimbabwean Dollar', '2026-02-03 15:19:55.878+07', '2026-02-03 15:19:55.878+07', NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "company_name" text COLLATE "pg_catalog"."default",
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "has_account" bool NOT NULL DEFAULT false,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for customer_account_holder
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer_account_holder";
CREATE TABLE "public"."customer_account_holder" (
  "customer_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "account_holder_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of customer_account_holder
-- ----------------------------

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer_address";
CREATE TABLE "public"."customer_address" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "address_name" text COLLATE "pg_catalog"."default",
  "is_default_shipping" bool NOT NULL DEFAULT false,
  "is_default_billing" bool NOT NULL DEFAULT false,
  "company" text COLLATE "pg_catalog"."default",
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "address_1" text COLLATE "pg_catalog"."default",
  "address_2" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default",
  "province" text COLLATE "pg_catalog"."default",
  "postal_code" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of customer_address
-- ----------------------------

-- ----------------------------
-- Table structure for customer_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer_group";
CREATE TABLE "public"."customer_group" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_by" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for customer_group_customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer_group_customer";
CREATE TABLE "public"."customer_group_customer" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "customer_group_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "created_by" text COLLATE "pg_catalog"."default",
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of customer_group_customer
-- ----------------------------

-- ----------------------------
-- Table structure for fulfillment
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment";
CREATE TABLE "public"."fulfillment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "location_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "packed_at" timestamptz(6),
  "shipped_at" timestamptz(6),
  "delivered_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "data" jsonb,
  "provider_id" text COLLATE "pg_catalog"."default",
  "shipping_option_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "delivery_address_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "marked_shipped_by" text COLLATE "pg_catalog"."default",
  "created_by" text COLLATE "pg_catalog"."default",
  "requires_shipping" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of fulfillment
-- ----------------------------

-- ----------------------------
-- Table structure for fulfillment_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment_address";
CREATE TABLE "public"."fulfillment_address" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "company" text COLLATE "pg_catalog"."default",
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "address_1" text COLLATE "pg_catalog"."default",
  "address_2" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default",
  "province" text COLLATE "pg_catalog"."default",
  "postal_code" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of fulfillment_address
-- ----------------------------

-- ----------------------------
-- Table structure for fulfillment_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment_item";
CREATE TABLE "public"."fulfillment_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "sku" text COLLATE "pg_catalog"."default" NOT NULL,
  "barcode" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantity" numeric NOT NULL,
  "raw_quantity" jsonb NOT NULL,
  "line_item_id" text COLLATE "pg_catalog"."default",
  "inventory_item_id" text COLLATE "pg_catalog"."default",
  "fulfillment_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of fulfillment_item
-- ----------------------------

-- ----------------------------
-- Table structure for fulfillment_label
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment_label";
CREATE TABLE "public"."fulfillment_label" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "tracking_number" text COLLATE "pg_catalog"."default" NOT NULL,
  "tracking_url" text COLLATE "pg_catalog"."default" NOT NULL,
  "label_url" text COLLATE "pg_catalog"."default" NOT NULL,
  "fulfillment_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of fulfillment_label
-- ----------------------------

-- ----------------------------
-- Table structure for fulfillment_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment_provider";
CREATE TABLE "public"."fulfillment_provider" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_enabled" bool NOT NULL DEFAULT true,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of fulfillment_provider
-- ----------------------------
INSERT INTO "public"."fulfillment_provider" VALUES ('manual_manual', 't', '2026-02-03 15:19:55.89+07', '2026-02-03 15:19:55.89+07', NULL);

-- ----------------------------
-- Table structure for fulfillment_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."fulfillment_set";
CREATE TABLE "public"."fulfillment_set" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of fulfillment_set
-- ----------------------------
INSERT INTO "public"."fulfillment_set" VALUES ('fuset_01KGH9CVS4QD6AVTDSK9Z4XM7F', 'European Warehouse delivery', 'shipping', NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."fulfillment_set" VALUES ('fuset_01KGGTVWVCA4NPQ2VE2WYZNPAX', 'Pawon Factory pick up', 'pickup', NULL, '2026-02-03 11:06:14.125+07', '2026-02-03 11:06:14.125+07', NULL);

-- ----------------------------
-- Table structure for geo_zone
-- ----------------------------
DROP TABLE IF EXISTS "public"."geo_zone";
CREATE TABLE "public"."geo_zone" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'country'::text,
  "country_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "province_code" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "service_zone_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "postal_expression" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of geo_zone
-- ----------------------------
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS3E3AS9GN3R6DDMA2M', 'country', 'gb', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS326540KY3JN59PQ0R', 'country', 'de', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS3H2BF9CHTCNNW5XVE', 'country', 'dk', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS3K9EX9A43N0P6HHRJ', 'country', 'se', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS3YPF626PG2WV6W1P7', 'country', 'fr', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS30DMXA72HNVFTCPDG', 'country', 'es', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);
INSERT INTO "public"."geo_zone" VALUES ('fgz_01KGH9CVS3RZ9JSTA5G7YNM8A7', 'country', 'it', NULL, NULL, 'serzo_01KGH9CVS4886QV2REFPZ7SA89', NULL, NULL, '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS "public"."image";
CREATE TABLE "public"."image" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "url" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "rank" int4 NOT NULL DEFAULT 0,
  "product_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO "public"."image" VALUES ('img_01KGH9CW17N23GPK1M0HXY6FX6', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW18PQ9R2Y0XGB72Y318', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-back.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 1, 'prod_01KGH9CW12Y141GAAN2M752MVW');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW18DXAFPQ2145VZKFKB', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-front.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 2, 'prod_01KGH9CW12Y141GAAN2M752MVW');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW18730XDV8MM7MJXWYY', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-white-back.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 3, 'prod_01KGH9CW12Y141GAAN2M752MVW');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1AW7QB2WBCDCQCBY8G', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 0, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1ADASHCTP90GSFNHMM', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-back.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 1, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1BS98Z104C58HXAAW0', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 0, 'prod_01KGH9CW124AGG4YGFJ9X41SH0');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1BWBKED12JW1TFEY4H', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-back.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 1, 'prod_01KGH9CW124AGG4YGFJ9X41SH0');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1B9DDVJTZ4P1F1E2ZC', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 0, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB');
INSERT INTO "public"."image" VALUES ('img_01KGH9CW1CP2JNY5PXH5KYCQZG', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-back.png', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL, 1, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB');
INSERT INTO "public"."image" VALUES ('f4iv7n', 'http://localhost:9000/static/1770092672153-SIRUP.jpg', NULL, '2026-02-03 11:24:32.249+07', '2026-02-03 11:24:32.249+07', NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('z5l4na', 'http://localhost:9000/static/1770092878397-caramel-copy.jpg', NULL, '2026-02-03 11:27:58.565+07', '2026-02-03 11:27:58.565+07', NULL, 1, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('mqk6cp', 'http://localhost:9000/static/1770092878403-hazelnut-copy.jpg', NULL, '2026-02-03 11:27:58.565+07', '2026-02-03 11:27:58.565+07', NULL, 2, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('2e9t1n', 'http://localhost:9000/static/1770092878410-lychee-copy.jpg', NULL, '2026-02-03 11:27:58.565+07', '2026-02-03 11:27:58.565+07', NULL, 3, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('us4u6', 'http://localhost:9000/static/1770092878417-peach-copy.jpg', NULL, '2026-02-03 11:27:58.565+07', '2026-02-03 11:27:58.566+07', NULL, 4, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('r37kq', 'http://localhost:9000/static/1770092878422-strawberry-copy.jpg', NULL, '2026-02-03 11:27:58.566+07', '2026-02-03 11:27:58.566+07', NULL, 5, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');
INSERT INTO "public"."image" VALUES ('6lb3qr', 'http://localhost:9000/static/1770092878428-vanilla-copy.jpg', NULL, '2026-02-03 11:27:58.566+07', '2026-02-03 11:27:58.566+07', NULL, 6, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54');

-- ----------------------------
-- Table structure for inventory_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."inventory_item";
CREATE TABLE "public"."inventory_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "sku" text COLLATE "pg_catalog"."default",
  "origin_country" text COLLATE "pg_catalog"."default",
  "hs_code" text COLLATE "pg_catalog"."default",
  "mid_code" text COLLATE "pg_catalog"."default",
  "material" text COLLATE "pg_catalog"."default",
  "weight" int4,
  "length" int4,
  "height" int4,
  "width" int4,
  "requires_shipping" bool NOT NULL DEFAULT true,
  "description" text COLLATE "pg_catalog"."default",
  "title" text COLLATE "pg_catalog"."default",
  "thumbnail" text COLLATE "pg_catalog"."default",
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of inventory_item
-- ----------------------------
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW54P0N88Z51DSVX3TPA', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATSHIRT-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'S', 'S', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW5476PNDBC60YG5GX5C', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATSHIRT-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'M', 'M', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW547CVJ2H8SYFQ05TZN', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATSHIRT-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'L', 'L', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW543JS0NYNDDDMGD4WC', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATSHIRT-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'XL', 'XL', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW55SKQFNK46R534CKMN', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATPANTS-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'S', 'S', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW55XPTHFAR2GRD9V47B', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATPANTS-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'L', 'L', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW55AG8AFARD7GAB9FE7', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SWEATPANTS-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'XL', 'XL', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW557N0YTHPCVA1RXYXZ', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SHORTS-S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'S', 'S', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW55N9GWCY079B18PKAW', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SHORTS-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'M', 'M', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW551MYRYPP1XE06KVN0', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SHORTS-L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'L', 'L', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW554270QETZNXF3CC28', '2026-02-03 15:20:10.534+07', '2026-02-03 15:20:10.534+07', NULL, 'SHORTS-XL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'XL', 'XL', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW537DAPH50YA7Q430D5', '2026-02-03 15:20:10.533+07', '2026-02-03 10:48:07.47+07', '2026-02-03 10:48:07.467+07', 'SHIRT-S-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'S / Black', 'S / Black', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW542SQHYCCY6ZWRBE5F', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:11.186+07', '2026-02-03 10:48:11.186+07', 'SHIRT-M-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'M / Black', 'M / Black', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW541ZAXSCMSAJP2KHQ8', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:14.199+07', '2026-02-03 10:48:14.199+07', 'SHIRT-L-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'L / White', 'L / White', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW54C1QDDQT7XSSKG4F5', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:17.168+07', '2026-02-03 10:48:17.167+07', 'SHIRT-M-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'M / White', 'M / White', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW54XVH2YRQRVHVMEDY6', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:20.027+07', '2026-02-03 10:48:20.027+07', 'SHIRT-L-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'L / Black', 'L / Black', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW53VY41D7CY2PPFB4AC', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:24.074+07', '2026-02-03 10:48:24.073+07', 'SHIRT-S-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'S / White', 'S / White', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW5428DQC7B6D0R857XX', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:27.16+07', '2026-02-03 10:48:27.16+07', 'SHIRT-XL-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'XL / White', 'XL / White', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW54J82CJ1RJJSN7YC33', '2026-02-03 15:20:10.534+07', '2026-02-03 10:48:30.389+07', '2026-02-03 10:48:30.389+07', 'SHIRT-XL-BLACK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'XL / Black', 'XL / Black', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGH9CW55XVRW0QFR6DN3TFVB', '2026-02-03 15:20:10.534+07', '2026-02-03 10:56:49.578+07', '2026-02-03 10:56:49.577+07', 'SWEATPANTS-M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'M', 'M', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGW96A42HWNQ97EFHA10T38', '2026-02-03 11:30:58.373+07', '2026-02-03 11:30:58.373+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL, 'Moli Flavoured Syrup Caramel', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGWV3GH5QPSX400H3B78XS6', '2026-02-03 11:40:45.33+07', '2026-02-03 11:40:45.33+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'Hezelnut', 'Hezelnut', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGX113PCMV2MBM7GB29WW6D', '2026-02-03 11:43:59.48+07', '2026-02-03 11:43:59.48+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'Lychee', 'Lychee', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGX56XBKBSEJP7ABAP7XN2Q', '2026-02-03 11:46:16.492+07', '2026-02-03 11:46:16.492+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'Strawberry', 'Strawberry', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGXCE8QH22NAE6HT6KPD3VQ', '2026-02-03 11:50:13.4+07', '2026-02-03 11:50:13.4+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'Peach', 'Peach', NULL, NULL);
INSERT INTO "public"."inventory_item" VALUES ('iitem_01KGGXFGJC7YV5YMV19NW4R99E', '2026-02-03 11:51:54.061+07', '2026-02-03 11:51:54.061+07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', 'Vanilla', 'Vanilla', NULL, NULL);

-- ----------------------------
-- Table structure for inventory_level
-- ----------------------------
DROP TABLE IF EXISTS "public"."inventory_level";
CREATE TABLE "public"."inventory_level" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "inventory_item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "location_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "stocked_quantity" numeric NOT NULL DEFAULT 0,
  "reserved_quantity" numeric NOT NULL DEFAULT 0,
  "incoming_quantity" numeric NOT NULL DEFAULT 0,
  "metadata" jsonb,
  "raw_stocked_quantity" jsonb,
  "raw_reserved_quantity" jsonb,
  "raw_incoming_quantity" jsonb
)
;

-- ----------------------------
-- Records of inventory_level
-- ----------------------------
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8MKA0DG4B5FK2NYNS4', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW543JS0NYNDDDMGD4WC', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8MPZ65QTQ363QSEHMX', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW5476PNDBC60YG5GX5C', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8M8KCPZQYVNV91MJ8Z', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW547CVJ2H8SYFQ05TZN', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NV47GJMBBE2BV4VR1', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW54P0N88Z51DSVX3TPA', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NS45QZAWETG6J16JY', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW551MYRYPP1XE06KVN0', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8N5XR65EXTYTDJ4ZKB', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW554270QETZNXF3CC28', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NSNK18KTGEGQTZYMF', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW557N0YTHPCVA1RXYXZ', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NMD670A0VAY87QE5R', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW55AG8AFARD7GAB9FE7', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8N7G1ZFNB6BQ8ZD7V4', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW55N9GWCY079B18PKAW', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NP1YG8QAY63GSGGZ6', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW55SKQFNK46R534CKMN', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NF5G9QKEVXQJBZ4VH', '2026-02-03 15:20:10.646+07', '2026-02-03 15:20:10.646+07', NULL, 'iitem_01KGH9CW55XPTHFAR2GRD9V47B', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8M5JS8408N74MNE1KR', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:07.484+07', '2026-02-03 10:48:07.467+07', 'iitem_01KGH9CW537DAPH50YA7Q430D5', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8M1HWARCA26E6YQ0XN', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:11.196+07', '2026-02-03 10:48:11.186+07', 'iitem_01KGH9CW542SQHYCCY6ZWRBE5F', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8M5CFA8ARJ3FKYZQGA', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:14.209+07', '2026-02-03 10:48:14.199+07', 'iitem_01KGH9CW541ZAXSCMSAJP2KHQ8', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8N7B9THZFR5FA8K9CG', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:17.175+07', '2026-02-03 10:48:17.167+07', 'iitem_01KGH9CW54C1QDDQT7XSSKG4F5', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NRPKPEG4Q0D77Z5D0', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:20.034+07', '2026-02-03 10:48:20.027+07', 'iitem_01KGH9CW54XVH2YRQRVHVMEDY6', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8M468BD6GCYZ0HRJMX', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:24.082+07', '2026-02-03 10:48:24.073+07', 'iitem_01KGH9CW53VY41D7CY2PPFB4AC', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8MY08JGHTVS8CT0CW8', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:27.166+07', '2026-02-03 10:48:27.16+07', 'iitem_01KGH9CW5428DQC7B6D0R857XX', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8NX1761HE0FEJDQ0EA', '2026-02-03 15:20:10.646+07', '2026-02-03 10:48:30.4+07', '2026-02-03 10:48:30.389+07', 'iitem_01KGH9CW54J82CJ1RJJSN7YC33', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGH9CW8N92Y2T1Y8QF6QVCE1', '2026-02-03 15:20:10.646+07', '2026-02-03 10:56:49.587+07', '2026-02-03 10:56:49.577+07', 'iitem_01KGH9CW55XVRW0QFR6DN3TFVB', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000000, 0, 0, NULL, '{"value": "1000000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGW96DEQSMY6VAE0GEEM06W', '2026-02-03 11:30:58.479+07', '2026-02-03 11:30:58.479+07', NULL, 'iitem_01KGGW96A42HWNQ97EFHA10T38', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 1000, 0, 0, NULL, '{"value": "1000", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGWXCC1HGTGFST75BQHWFJS', '2026-02-03 11:41:59.937+07', '2026-02-03 11:42:15.951+07', NULL, 'iitem_01KGGWV3GH5QPSX400H3B78XS6', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 500, 0, 0, NULL, '{"value": "500", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGX254S794A40ZMAQQ4MPDE', '2026-02-03 11:44:36.377+07', '2026-02-03 11:45:20.173+07', NULL, 'iitem_01KGGX113PCMV2MBM7GB29WW6D', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 500, 0, 0, NULL, '{"value": "500", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGX6AE1EM0DHBZWXZTS5VWB', '2026-02-03 11:46:52.865+07', '2026-02-03 11:48:42.671+07', NULL, 'iitem_01KGGX56XBKBSEJP7ABAP7XN2Q', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 600, 0, 0, NULL, '{"value": "600", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGXDHEWGYGR4N15SNVVWM24', '2026-02-03 11:50:49.437+07', '2026-02-03 11:51:19.791+07', NULL, 'iitem_01KGGXCE8QH22NAE6HT6KPD3VQ', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 500, 0, 0, NULL, '{"value": "500", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');
INSERT INTO "public"."inventory_level" VALUES ('ilev_01KGGXGY6MRDWRRE1JAFNK3YCH', '2026-02-03 11:52:40.788+07', '2026-02-03 11:53:10.11+07', NULL, 'iitem_01KGGXFGJC7YV5YMV19NW4R99E', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 600, 0, 0, NULL, '{"value": "600", "precision": 20}', '{"value": "0", "precision": 20}', '{"value": "0", "precision": 20}');

-- ----------------------------
-- Table structure for invite
-- ----------------------------
DROP TABLE IF EXISTS "public"."invite";
CREATE TABLE "public"."invite" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "accepted" bool NOT NULL DEFAULT false,
  "token" text COLLATE "pg_catalog"."default" NOT NULL,
  "expires_at" timestamptz(6) NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of invite
-- ----------------------------
INSERT INTO "public"."invite" VALUES ('invite_01KGH9CNYS0QKSSEX6RWW109PV', 'admin@medusa-test.com', 'f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Imludml0ZV8wMUtHSDlDTllTMFFLU1NFWDZSV1cxMDlQViIsImVtYWlsIjoiYWRtaW5AbWVkdXNhLXRlc3QuY29tIiwiaWF0IjoxNzcwMTA2ODA0LCJleHAiOjE3NzAxOTMyMDQsImp0aSI6Ijg5ODQ2NDVlLTljZDUtNDAyZS1iNzE2LTlkMGY3NzljNDhhNyJ9.X0VZoCGfhB7vSYbZW2MkCk4Hz1uhcGkn41lCAwyVkXM', '2026-02-04 15:20:04.185+07', NULL, '2026-02-03 15:20:04.192+07', '2026-02-03 15:48:30.86+07', '2026-02-03 15:48:30.858+07');

-- ----------------------------
-- Table structure for link_module_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."link_module_migrations";
CREATE TABLE "public"."link_module_migrations" (
  "id" int4 NOT NULL DEFAULT nextval('link_module_migrations_id_seq'::regclass),
  "table_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "link_descriptor" jsonb NOT NULL DEFAULT '{}'::jsonb,
  "created_at" timestamp(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of link_module_migrations
-- ----------------------------
INSERT INTO "public"."link_module_migrations" VALUES (1, 'cart_payment_collection', '{"toModel": "payment_collection", "toModule": "payment", "fromModel": "cart", "fromModule": "cart"}', '2026-02-03 15:19:51.567132');
INSERT INTO "public"."link_module_migrations" VALUES (2, 'cart_promotion', '{"toModel": "promotions", "toModule": "promotion", "fromModel": "cart", "fromModule": "cart"}', '2026-02-03 15:19:51.5906');
INSERT INTO "public"."link_module_migrations" VALUES (3, 'customer_account_holder', '{"toModel": "account_holder", "toModule": "payment", "fromModel": "customer", "fromModule": "customer"}', '2026-02-03 15:19:51.609957');
INSERT INTO "public"."link_module_migrations" VALUES (4, 'location_fulfillment_provider', '{"toModel": "fulfillment_provider", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}', '2026-02-03 15:19:51.633066');
INSERT INTO "public"."link_module_migrations" VALUES (5, 'location_fulfillment_set', '{"toModel": "fulfillment_set", "toModule": "fulfillment", "fromModel": "location", "fromModule": "stock_location"}', '2026-02-03 15:19:51.654161');
INSERT INTO "public"."link_module_migrations" VALUES (6, 'order_cart', '{"toModel": "cart", "toModule": "cart", "fromModel": "order", "fromModule": "order"}', '2026-02-03 15:19:51.673831');
INSERT INTO "public"."link_module_migrations" VALUES (7, 'order_fulfillment', '{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "order", "fromModule": "order"}', '2026-02-03 15:19:51.693507');
INSERT INTO "public"."link_module_migrations" VALUES (8, 'order_payment_collection', '{"toModel": "payment_collection", "toModule": "payment", "fromModel": "order", "fromModule": "order"}', '2026-02-03 15:19:51.710961');
INSERT INTO "public"."link_module_migrations" VALUES (9, 'order_promotion', '{"toModel": "promotions", "toModule": "promotion", "fromModel": "order", "fromModule": "order"}', '2026-02-03 15:19:51.726651');
INSERT INTO "public"."link_module_migrations" VALUES (10, 'return_fulfillment', '{"toModel": "fulfillments", "toModule": "fulfillment", "fromModel": "return", "fromModule": "order"}', '2026-02-03 15:19:51.741776');
INSERT INTO "public"."link_module_migrations" VALUES (11, 'product_sales_channel', '{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "product", "fromModule": "product"}', '2026-02-03 15:19:51.757113');
INSERT INTO "public"."link_module_migrations" VALUES (12, 'product_shipping_profile', '{"toModel": "shipping_profile", "toModule": "fulfillment", "fromModel": "product", "fromModule": "product"}', '2026-02-03 15:19:51.772503');
INSERT INTO "public"."link_module_migrations" VALUES (13, 'product_variant_inventory_item', '{"toModel": "inventory", "toModule": "inventory", "fromModel": "variant", "fromModule": "product"}', '2026-02-03 15:19:51.785908');
INSERT INTO "public"."link_module_migrations" VALUES (14, 'product_variant_price_set', '{"toModel": "price_set", "toModule": "pricing", "fromModel": "variant", "fromModule": "product"}', '2026-02-03 15:19:51.803753');
INSERT INTO "public"."link_module_migrations" VALUES (15, 'publishable_api_key_sales_channel', '{"toModel": "sales_channel", "toModule": "sales_channel", "fromModel": "api_key", "fromModule": "api_key"}', '2026-02-03 15:19:51.821974');
INSERT INTO "public"."link_module_migrations" VALUES (16, 'region_payment_provider', '{"toModel": "payment_provider", "toModule": "payment", "fromModel": "region", "fromModule": "region"}', '2026-02-03 15:19:51.839008');
INSERT INTO "public"."link_module_migrations" VALUES (17, 'sales_channel_stock_location', '{"toModel": "location", "toModule": "stock_location", "fromModel": "sales_channel", "fromModule": "sales_channel"}', '2026-02-03 15:19:51.850333');
INSERT INTO "public"."link_module_migrations" VALUES (18, 'shipping_option_price_set', '{"toModel": "price_set", "toModule": "pricing", "fromModel": "shipping_option", "fromModule": "fulfillment"}', '2026-02-03 15:19:51.862935');
INSERT INTO "public"."link_module_migrations" VALUES (19, 'user_rbac_role', '{"toModel": "rbac_role", "toModule": "rbac", "fromModel": "user", "fromModule": "user"}', '2026-02-03 15:19:51.875133');

-- ----------------------------
-- Table structure for location_fulfillment_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."location_fulfillment_provider";
CREATE TABLE "public"."location_fulfillment_provider" (
  "stock_location_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fulfillment_provider_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of location_fulfillment_provider
-- ----------------------------
INSERT INTO "public"."location_fulfillment_provider" VALUES ('sloc_01KGH9CVQVG2NWRSH88F8HF551', 'manual_manual', 'locfp_01KGH9CVRMM56QWKS6WBZQY5KN', '2026-02-03 15:20:10.132282+07', '2026-02-03 15:20:10.132282+07', NULL);

-- ----------------------------
-- Table structure for location_fulfillment_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."location_fulfillment_set";
CREATE TABLE "public"."location_fulfillment_set" (
  "stock_location_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fulfillment_set_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of location_fulfillment_set
-- ----------------------------
INSERT INTO "public"."location_fulfillment_set" VALUES ('sloc_01KGH9CVQVG2NWRSH88F8HF551', 'fuset_01KGH9CVS4QD6AVTDSK9Z4XM7F', 'locfs_01KGH9CVSY8Y8F4N9N8RRBGRXE', '2026-02-03 15:20:10.174304+07', '2026-02-03 15:20:10.174304+07', NULL);
INSERT INTO "public"."location_fulfillment_set" VALUES ('sloc_01KGH9CVQVG2NWRSH88F8HF551', 'fuset_01KGGTVWVCA4NPQ2VE2WYZNPAX', 'locfs_01KGGTVWVT4SM1GBSBCQCK16GE', '2026-02-03 11:06:14.138271+07', '2026-02-03 11:06:14.138271+07', NULL);

-- ----------------------------
-- Table structure for mikro_orm_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."mikro_orm_migrations";
CREATE TABLE "public"."mikro_orm_migrations" (
  "id" int4 NOT NULL DEFAULT nextval('mikro_orm_migrations_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "executed_at" timestamptz(6) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of mikro_orm_migrations
-- ----------------------------
INSERT INTO "public"."mikro_orm_migrations" VALUES (1, 'Migration20240307161216', '2026-02-03 15:19:44.169328+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (2, 'Migration20241210073813', '2026-02-03 15:19:44.169328+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (3, 'Migration20250106142624', '2026-02-03 15:19:44.169328+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (4, 'Migration20250120110820', '2026-02-03 15:19:44.169328+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (5, 'Migration20240307132720', '2026-02-03 15:19:44.361063+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (6, 'Migration20240719123015', '2026-02-03 15:19:44.361063+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (7, 'Migration20241213063611', '2026-02-03 15:19:44.361063+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (8, 'Migration20251010131115', '2026-02-03 15:19:44.361063+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (9, 'InitialSetup20240401153642', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (10, 'Migration20240601111544', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (11, 'Migration202408271511', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (12, 'Migration20241122120331', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (13, 'Migration20241125090957', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (14, 'Migration20250411073236', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (15, 'Migration20250516081326', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (16, 'Migration20250910154539', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (17, 'Migration20250911092221', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (18, 'Migration20250929204438', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (19, 'Migration20251008132218', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (20, 'Migration20251011090511', '2026-02-03 15:19:44.638156+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (21, 'Migration20230929122253', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (22, 'Migration20240322094407', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (23, 'Migration20240322113359', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (24, 'Migration20240322120125', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (25, 'Migration20240626133555', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (26, 'Migration20240704094505', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (27, 'Migration20241127114534', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (28, 'Migration20241127223829', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (29, 'Migration20241128055359', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (30, 'Migration20241212190401', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (31, 'Migration20250408145122', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (32, 'Migration20250409122219', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (33, 'Migration20251009110625', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (34, 'Migration20251112192723', '2026-02-03 15:19:45.214764+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (35, 'Migration20240227120221', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (36, 'Migration20240617102917', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (37, 'Migration20240624153824', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (38, 'Migration20241211061114', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (39, 'Migration20250113094144', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (40, 'Migration20250120110700', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (41, 'Migration20250226130616', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (42, 'Migration20250508081510', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (43, 'Migration20250828075407', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (44, 'Migration20250909083125', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (45, 'Migration20250916120552', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (46, 'Migration20250917143818', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (47, 'Migration20250919122137', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (48, 'Migration20251006000000', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (49, 'Migration20251015113934', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (50, 'Migration20251107050148', '2026-02-03 15:19:45.680433+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (51, 'Migration20240124154000', '2026-02-03 15:19:46.084914+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (52, 'Migration20240524123112', '2026-02-03 15:19:46.084914+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (53, 'Migration20240602110946', '2026-02-03 15:19:46.084914+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (54, 'Migration20241211074630', '2026-02-03 15:19:46.084914+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (55, 'Migration20251010130829', '2026-02-03 15:19:46.084914+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (56, 'Migration20240115152146', '2026-02-03 15:19:46.243085+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (57, 'Migration20240222170223', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (58, 'Migration20240831125857', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (59, 'Migration20241106085918', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (60, 'Migration20241205095237', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (61, 'Migration20241216183049', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (62, 'Migration20241218091938', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (63, 'Migration20250120115059', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (64, 'Migration20250212131240', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (65, 'Migration20250326151602', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (66, 'Migration20250508081553', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (67, 'Migration20251017153909', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (68, 'Migration20251208130704', '2026-02-03 15:19:46.362095+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (69, 'Migration20240205173216', '2026-02-03 15:19:46.763605+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (70, 'Migration20240624200006', '2026-02-03 15:19:46.763605+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (71, 'Migration20250120110744', '2026-02-03 15:19:46.763605+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (72, 'InitialSetup20240221144943', '2026-02-03 15:19:46.912432+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (73, 'Migration20240604080145', '2026-02-03 15:19:46.912432+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (74, 'Migration20241205122700', '2026-02-03 15:19:46.912432+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (75, 'Migration20251015123842', '2026-02-03 15:19:46.912432+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (76, 'InitialSetup20240227075933', '2026-02-03 15:19:47.110719+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (77, 'Migration20240621145944', '2026-02-03 15:19:47.110719+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (78, 'Migration20241206083313', '2026-02-03 15:19:47.110719+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (79, 'Migration20251202184737', '2026-02-03 15:19:47.110719+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (80, 'Migration20251212161429', '2026-02-03 15:19:47.110719+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (81, 'Migration20240227090331', '2026-02-03 15:19:47.304369+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (82, 'Migration20240710135844', '2026-02-03 15:19:47.304369+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (83, 'Migration20240924114005', '2026-02-03 15:19:47.304369+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (84, 'Migration20241212052837', '2026-02-03 15:19:47.304369+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (85, 'InitialSetup20240228133303', '2026-02-03 15:19:47.475779+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (86, 'Migration20240624082354', '2026-02-03 15:19:47.475779+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (87, 'Migration20240225134525', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (88, 'Migration20240806072619', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (89, 'Migration20241211151053', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (90, 'Migration20250115160517', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (91, 'Migration20250120110552', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (92, 'Migration20250123122334', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (93, 'Migration20250206105639', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (94, 'Migration20250207132723', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (95, 'Migration20250625084134', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (96, 'Migration20250924135437', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (97, 'Migration20250929124701', '2026-02-03 15:19:47.618645+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (98, 'Migration20240219102530', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (99, 'Migration20240604100512', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (100, 'Migration20240715102100', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (101, 'Migration20240715174100', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (102, 'Migration20240716081800', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (103, 'Migration20240801085921', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (104, 'Migration20240821164505', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (105, 'Migration20240821170920', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (106, 'Migration20240827133639', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (107, 'Migration20240902195921', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (108, 'Migration20240913092514', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (109, 'Migration20240930122627', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (110, 'Migration20241014142943', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (111, 'Migration20241106085223', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (112, 'Migration20241129124827', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (113, 'Migration20241217162224', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (114, 'Migration20250326151554', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (115, 'Migration20250522181137', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (116, 'Migration20250702095353', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (117, 'Migration20250704120229', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (118, 'Migration20250910130000', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (119, 'Migration20251016160403', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (120, 'Migration20251016182939', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (121, 'Migration20251017155709', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (122, 'Migration20251114100559', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (123, 'Migration20251125164002', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (124, 'Migration20251210112909', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (125, 'Migration20251210112924', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (126, 'Migration20251225120947', '2026-02-03 15:19:47.947062+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (127, 'Migration20250717162007', '2026-02-03 15:19:48.659869+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (128, 'Migration20240205025928', '2026-02-03 15:19:48.743465+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (129, 'Migration20240529080336', '2026-02-03 15:19:48.743465+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (130, 'Migration20241202100304', '2026-02-03 15:19:48.743465+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (131, 'Migration20240214033943', '2026-02-03 15:19:49.040709+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (132, 'Migration20240703095850', '2026-02-03 15:19:49.040709+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (133, 'Migration20241202103352', '2026-02-03 15:19:49.040709+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (134, 'Migration20240311145700_InitialSetupMigration', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (135, 'Migration20240821170957', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (136, 'Migration20240917161003', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (137, 'Migration20241217110416', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (138, 'Migration20250113122235', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (139, 'Migration20250120115002', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (140, 'Migration20250822130931', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (141, 'Migration20250825132614', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (142, 'Migration20251114133146', '2026-02-03 15:19:49.192245+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (143, 'Migration20240509083918_InitialSetupMigration', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (144, 'Migration20240628075401', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (145, 'Migration20240830094712', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (146, 'Migration20250120110514', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (147, 'Migration20251028172715', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (148, 'Migration20251121123942', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (149, 'Migration20251121150408', '2026-02-03 15:19:49.528252+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (150, 'Migration20231228143900', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (151, 'Migration20241206101446', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (152, 'Migration20250128174331', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (153, 'Migration20250505092459', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (154, 'Migration20250819104213', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (155, 'Migration20250819110924', '2026-02-03 15:19:49.937495+07');
INSERT INTO "public"."mikro_orm_migrations" VALUES (156, 'Migration20250908080305', '2026-02-03 15:19:49.937495+07');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS "public"."notification";
CREATE TABLE "public"."notification" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "to" text COLLATE "pg_catalog"."default" NOT NULL,
  "channel" text COLLATE "pg_catalog"."default" NOT NULL,
  "template" text COLLATE "pg_catalog"."default",
  "data" jsonb,
  "trigger_type" text COLLATE "pg_catalog"."default",
  "resource_id" text COLLATE "pg_catalog"."default",
  "resource_type" text COLLATE "pg_catalog"."default",
  "receiver_id" text COLLATE "pg_catalog"."default",
  "original_notification_id" text COLLATE "pg_catalog"."default",
  "idempotency_key" text COLLATE "pg_catalog"."default",
  "external_id" text COLLATE "pg_catalog"."default",
  "provider_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending'::text,
  "from" text COLLATE "pg_catalog"."default",
  "provider_data" jsonb
)
;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for notification_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."notification_provider";
CREATE TABLE "public"."notification_provider" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "handle" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_enabled" bool NOT NULL DEFAULT true,
  "channels" text[] COLLATE "pg_catalog"."default" NOT NULL DEFAULT '{}'::text[],
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of notification_provider
-- ----------------------------
INSERT INTO "public"."notification_provider" VALUES ('local', 'local', 'local', 't', '{feed}', '2026-02-03 15:19:55.902+07', '2026-02-03 15:19:55.902+07', NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS "public"."order";
CREATE TABLE "public"."order" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "region_id" text COLLATE "pg_catalog"."default",
  "display_id" int4 DEFAULT nextval('order_display_id_seq'::regclass),
  "customer_id" text COLLATE "pg_catalog"."default",
  "version" int4 NOT NULL DEFAULT 1,
  "sales_channel_id" text COLLATE "pg_catalog"."default",
  "status" "public"."order_status_enum" NOT NULL DEFAULT 'pending'::order_status_enum,
  "is_draft_order" bool NOT NULL DEFAULT false,
  "email" text COLLATE "pg_catalog"."default",
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "shipping_address_id" text COLLATE "pg_catalog"."default",
  "billing_address_id" text COLLATE "pg_catalog"."default",
  "no_notification" bool,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "custom_display_id" text COLLATE "pg_catalog"."default",
  "locale" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_address";
CREATE TABLE "public"."order_address" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "customer_id" text COLLATE "pg_catalog"."default",
  "company" text COLLATE "pg_catalog"."default",
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "address_1" text COLLATE "pg_catalog"."default",
  "address_2" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default",
  "province" text COLLATE "pg_catalog"."default",
  "postal_code" text COLLATE "pg_catalog"."default",
  "phone" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_address
-- ----------------------------

-- ----------------------------
-- Table structure for order_cart
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_cart";
CREATE TABLE "public"."order_cart" (
  "order_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cart_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_cart
-- ----------------------------

-- ----------------------------
-- Table structure for order_change
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_change";
CREATE TABLE "public"."order_change" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending'::text,
  "internal_note" text COLLATE "pg_catalog"."default",
  "created_by" text COLLATE "pg_catalog"."default",
  "requested_by" text COLLATE "pg_catalog"."default",
  "requested_at" timestamptz(6),
  "confirmed_by" text COLLATE "pg_catalog"."default",
  "confirmed_at" timestamptz(6),
  "declined_by" text COLLATE "pg_catalog"."default",
  "declined_reason" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "declined_at" timestamptz(6),
  "canceled_by" text COLLATE "pg_catalog"."default",
  "canceled_at" timestamptz(6),
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "change_type" text COLLATE "pg_catalog"."default",
  "deleted_at" timestamptz(6),
  "return_id" text COLLATE "pg_catalog"."default",
  "claim_id" text COLLATE "pg_catalog"."default",
  "exchange_id" text COLLATE "pg_catalog"."default",
  "carry_over_promotions" bool
)
;

-- ----------------------------
-- Records of order_change
-- ----------------------------

-- ----------------------------
-- Table structure for order_change_action
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_change_action";
CREATE TABLE "public"."order_change_action" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default",
  "version" int4,
  "ordering" int8 NOT NULL DEFAULT nextval('order_change_action_ordering_seq'::regclass),
  "order_change_id" text COLLATE "pg_catalog"."default",
  "reference" text COLLATE "pg_catalog"."default",
  "reference_id" text COLLATE "pg_catalog"."default",
  "action" text COLLATE "pg_catalog"."default" NOT NULL,
  "details" jsonb,
  "amount" numeric,
  "raw_amount" jsonb,
  "internal_note" text COLLATE "pg_catalog"."default",
  "applied" bool NOT NULL DEFAULT false,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "return_id" text COLLATE "pg_catalog"."default",
  "claim_id" text COLLATE "pg_catalog"."default",
  "exchange_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order_change_action
-- ----------------------------

-- ----------------------------
-- Table structure for order_claim
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_claim";
CREATE TABLE "public"."order_claim" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "return_id" text COLLATE "pg_catalog"."default",
  "order_version" int4 NOT NULL,
  "display_id" int4 NOT NULL DEFAULT nextval('order_claim_display_id_seq'::regclass),
  "type" "public"."order_claim_type_enum" NOT NULL,
  "no_notification" bool,
  "refund_amount" numeric,
  "raw_refund_amount" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order_claim
-- ----------------------------

-- ----------------------------
-- Table structure for order_claim_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_claim_item";
CREATE TABLE "public"."order_claim_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "claim_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_additional_item" bool NOT NULL DEFAULT false,
  "reason" "public"."claim_reason_enum",
  "quantity" numeric NOT NULL,
  "raw_quantity" jsonb NOT NULL,
  "note" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_claim_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_claim_item_image
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_claim_item_image";
CREATE TABLE "public"."order_claim_item_image" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "claim_item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "url" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_claim_item_image
-- ----------------------------

-- ----------------------------
-- Table structure for order_credit_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_credit_line";
CREATE TABLE "public"."order_credit_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "reference" text COLLATE "pg_catalog"."default",
  "reference_id" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "version" int4 NOT NULL DEFAULT 1
)
;

-- ----------------------------
-- Records of order_credit_line
-- ----------------------------

-- ----------------------------
-- Table structure for order_exchange
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_exchange";
CREATE TABLE "public"."order_exchange" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "return_id" text COLLATE "pg_catalog"."default",
  "order_version" int4 NOT NULL,
  "display_id" int4 NOT NULL DEFAULT nextval('order_exchange_display_id_seq'::regclass),
  "no_notification" bool,
  "allow_backorder" bool NOT NULL DEFAULT false,
  "difference_due" numeric,
  "raw_difference_due" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for order_exchange_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_exchange_item";
CREATE TABLE "public"."order_exchange_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "exchange_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantity" numeric NOT NULL,
  "raw_quantity" jsonb NOT NULL,
  "note" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_exchange_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_fulfillment
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_fulfillment";
CREATE TABLE "public"."order_fulfillment" (
  "order_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fulfillment_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_fulfillment
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_item";
CREATE TABLE "public"."order_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL,
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantity" numeric NOT NULL,
  "raw_quantity" jsonb NOT NULL,
  "fulfilled_quantity" numeric NOT NULL,
  "raw_fulfilled_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "shipped_quantity" numeric NOT NULL,
  "raw_shipped_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "return_requested_quantity" numeric NOT NULL,
  "raw_return_requested_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "return_received_quantity" numeric NOT NULL,
  "raw_return_received_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "return_dismissed_quantity" numeric NOT NULL,
  "raw_return_dismissed_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "written_off_quantity" numeric NOT NULL,
  "raw_written_off_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "delivered_quantity" numeric NOT NULL DEFAULT 0,
  "raw_delivered_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "unit_price" numeric,
  "raw_unit_price" jsonb,
  "compare_at_unit_price" numeric,
  "raw_compare_at_unit_price" jsonb
)
;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_line_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_line_item";
CREATE TABLE "public"."order_line_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "totals_id" text COLLATE "pg_catalog"."default",
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "subtitle" text COLLATE "pg_catalog"."default",
  "thumbnail" text COLLATE "pg_catalog"."default",
  "variant_id" text COLLATE "pg_catalog"."default",
  "product_id" text COLLATE "pg_catalog"."default",
  "product_title" text COLLATE "pg_catalog"."default",
  "product_description" text COLLATE "pg_catalog"."default",
  "product_subtitle" text COLLATE "pg_catalog"."default",
  "product_type" text COLLATE "pg_catalog"."default",
  "product_collection" text COLLATE "pg_catalog"."default",
  "product_handle" text COLLATE "pg_catalog"."default",
  "variant_sku" text COLLATE "pg_catalog"."default",
  "variant_barcode" text COLLATE "pg_catalog"."default",
  "variant_title" text COLLATE "pg_catalog"."default",
  "variant_option_values" jsonb,
  "requires_shipping" bool NOT NULL DEFAULT true,
  "is_discountable" bool NOT NULL DEFAULT true,
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "compare_at_unit_price" numeric,
  "raw_compare_at_unit_price" jsonb,
  "unit_price" numeric NOT NULL,
  "raw_unit_price" jsonb NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "is_custom_price" bool NOT NULL DEFAULT false,
  "product_type_id" text COLLATE "pg_catalog"."default",
  "is_giftcard" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of order_line_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_line_item_adjustment
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_line_item_adjustment";
CREATE TABLE "public"."order_line_item_adjustment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "promotion_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "deleted_at" timestamptz(6),
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "version" int4 NOT NULL DEFAULT 1
)
;

-- ----------------------------
-- Records of order_line_item_adjustment
-- ----------------------------

-- ----------------------------
-- Table structure for order_line_item_tax_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_line_item_tax_line";
CREATE TABLE "public"."order_line_item_tax_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "tax_rate_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric NOT NULL,
  "raw_rate" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_line_item_tax_line
-- ----------------------------

-- ----------------------------
-- Table structure for order_payment_collection
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_payment_collection";
CREATE TABLE "public"."order_payment_collection" (
  "order_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "payment_collection_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_payment_collection
-- ----------------------------

-- ----------------------------
-- Table structure for order_promotion
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_promotion";
CREATE TABLE "public"."order_promotion" (
  "order_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_shipping";
CREATE TABLE "public"."order_shipping" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL,
  "shipping_method_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "return_id" text COLLATE "pg_catalog"."default",
  "claim_id" text COLLATE "pg_catalog"."default",
  "exchange_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for order_shipping_method
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_shipping_method";
CREATE TABLE "public"."order_shipping_method" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" jsonb,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "shipping_option_id" text COLLATE "pg_catalog"."default",
  "data" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "is_custom_amount" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of order_shipping_method
-- ----------------------------

-- ----------------------------
-- Table structure for order_shipping_method_adjustment
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_shipping_method_adjustment";
CREATE TABLE "public"."order_shipping_method_adjustment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "promotion_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "shipping_method_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_shipping_method_adjustment
-- ----------------------------

-- ----------------------------
-- Table structure for order_shipping_method_tax_line
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_shipping_method_tax_line";
CREATE TABLE "public"."order_shipping_method_tax_line" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "tax_rate_id" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate" numeric NOT NULL,
  "raw_rate" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "shipping_method_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_shipping_method_tax_line
-- ----------------------------

-- ----------------------------
-- Table structure for order_summary
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_summary";
CREATE TABLE "public"."order_summary" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL DEFAULT 1,
  "totals" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of order_summary
-- ----------------------------

-- ----------------------------
-- Table structure for order_transaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_transaction";
CREATE TABLE "public"."order_transaction" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "version" int4 NOT NULL DEFAULT 1,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "reference" text COLLATE "pg_catalog"."default",
  "reference_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "return_id" text COLLATE "pg_catalog"."default",
  "claim_id" text COLLATE "pg_catalog"."default",
  "exchange_id" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of order_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment";
CREATE TABLE "public"."payment" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "data" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "captured_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "payment_collection_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "payment_session_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for payment_collection
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment_collection";
CREATE TABLE "public"."payment_collection" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "authorized_amount" numeric,
  "raw_authorized_amount" jsonb,
  "captured_amount" numeric,
  "raw_captured_amount" jsonb,
  "refunded_amount" numeric,
  "raw_refunded_amount" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "completed_at" timestamptz(6),
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'not_paid'::text,
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of payment_collection
-- ----------------------------

-- ----------------------------
-- Table structure for payment_collection_payment_providers
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment_collection_payment_providers";
CREATE TABLE "public"."payment_collection_payment_providers" (
  "payment_collection_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "payment_provider_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of payment_collection_payment_providers
-- ----------------------------

-- ----------------------------
-- Table structure for payment_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment_provider";
CREATE TABLE "public"."payment_provider" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_enabled" bool NOT NULL DEFAULT true,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of payment_provider
-- ----------------------------
INSERT INTO "public"."payment_provider" VALUES ('pp_system_default', 't', '2026-02-03 15:19:55.894+07', '2026-02-03 15:19:55.894+07', NULL);

-- ----------------------------
-- Table structure for payment_session
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment_session";
CREATE TABLE "public"."payment_session" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "data" jsonb NOT NULL DEFAULT '{}'::jsonb,
  "context" jsonb,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending'::text,
  "authorized_at" timestamptz(6),
  "payment_collection_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of payment_session
-- ----------------------------

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS "public"."price";
CREATE TABLE "public"."price" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default",
  "price_set_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "rules_count" int4 DEFAULT 0,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "price_list_id" text COLLATE "pg_catalog"."default",
  "amount" numeric NOT NULL,
  "min_quantity" numeric,
  "max_quantity" numeric,
  "raw_min_quantity" jsonb,
  "raw_max_quantity" jsonb
)
;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWSQS9TESH4B3MKH7AG', NULL, 'pset_01KGH9CVWVHR0HR4QM9XYF68MA', 'usd', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.269+07', '2026-02-03 15:20:10.269+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWSFKG68BJ1N81VN2QW', NULL, 'pset_01KGH9CVWVHR0HR4QM9XYF68MA', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.269+07', '2026-02-03 15:20:10.269+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWTNVBWPPZG40069AGD', NULL, 'pset_01KGH9CVWVHR0HR4QM9XYF68MA', 'eur', '{"value": "10", "precision": 20}', 1, '2026-02-03 15:20:10.269+07', '2026-02-03 15:20:10.269+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWV0NBMFF3MG6WAVERJ', NULL, 'pset_01KGH9CVWW7S23PKNDESSTF5EX', 'usd', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.27+07', '2026-02-03 15:20:10.27+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWV7SXZ5HNF06JDJYHA', NULL, 'pset_01KGH9CVWW7S23PKNDESSTF5EX', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.27+07', '2026-02-03 15:20:10.27+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CVWWAPT043RDHY6WEP3M', NULL, 'pset_01KGH9CVWW7S23PKNDESSTF5EX', 'eur', '{"value": "10", "precision": 20}', 1, '2026-02-03 15:20:10.27+07', '2026-02-03 15:20:10.27+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6EFWYZ7VBA6QTK85RJ', NULL, 'pset_01KGH9CW6EVE1JRRK4NABQGHRB', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6E4AVKSHA0QR6CW6P7', NULL, 'pset_01KGH9CW6EVE1JRRK4NABQGHRB', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6EEFF165FGS8XMDK0K', NULL, 'pset_01KGH9CW6E34C7JY7Q2C1KEWEV', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6EM8JHG71DXAZQ31QD', NULL, 'pset_01KGH9CW6E34C7JY7Q2C1KEWEV', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6EQWCP853MHDSNQBA3', NULL, 'pset_01KGH9CW6F74SMXPJTBJDRXR53', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FNREEZT3WCV1CEMSS', NULL, 'pset_01KGH9CW6F74SMXPJTBJDRXR53', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FRP3MNYM2AWGKDW02', NULL, 'pset_01KGH9CW6FDP7C5M601DVDFFMH', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FD44GGABX3TQZC2A6', NULL, 'pset_01KGH9CW6FDP7C5M601DVDFFMH', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FQCXHSP0500PN4T40', NULL, 'pset_01KGH9CW6F1NK2D1JA9VE0HKF0', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FDYZDW1S3MHCJ1JSE', NULL, 'pset_01KGH9CW6F1NK2D1JA9VE0HKF0', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6G5SWDVYCR7QEN0ZME', NULL, 'pset_01KGH9CW6G86WNT1SB7D90Z0ZR', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6GJ8ENXJEFZD3XJB9M', NULL, 'pset_01KGH9CW6G86WNT1SB7D90Z0ZR', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6GC2HMHE5Z3EYVP7F6', NULL, 'pset_01KGH9CW6G70H3YBCZZ202P97G', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6GC46D5CP8YGDP7E2B', NULL, 'pset_01KGH9CW6G70H3YBCZZ202P97G', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6GJ7S2P43Y1X6147BY', NULL, 'pset_01KGH9CW6HV08QVWXMKVEC3PCA', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6GH7D20XXJ0NM02YCP', NULL, 'pset_01KGH9CW6HV08QVWXMKVEC3PCA', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6H5E56CAAEBVXZKAAH', NULL, 'pset_01KGH9CW6JDXV1HRPDPMBSKPFQ', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6JYZEK9Q8FXXFG2KDZ', NULL, 'pset_01KGH9CW6JDXV1HRPDPMBSKPFQ', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6KSZ487CJCNG6FJX24', NULL, 'pset_01KGH9CW6MQMA2Y7G86NQQA2SE', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6M9DS7EH06GBXK0CK8', NULL, 'pset_01KGH9CW6MQMA2Y7G86NQQA2SE', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6NS1KEKZE6449HB2V2', NULL, 'pset_01KGH9CW6N6Y2H9TXRG0QAFHQ3', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6C7KC1Y7SX6QJAA336', NULL, 'pset_01KGH9CW6CQ7AZSXVDVZW4SWM6', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:11.142+07', '2026-02-03 10:48:11.13+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6CTFVZCZDEWFR6GXY8', NULL, 'pset_01KGH9CW6CQ7AZSXVDVZW4SWM6', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:11.143+07', '2026-02-03 10:48:11.13+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6D9XWJ7FN03H9S82D2', NULL, 'pset_01KGH9CW6DAF63N0KRT5DV4EWS', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:14.157+07', '2026-02-03 10:48:14.145+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6DNDMDT4ESWQZ3ZCJX', NULL, 'pset_01KGH9CW6DAF63N0KRT5DV4EWS', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:14.158+07', '2026-02-03 10:48:14.145+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6CDTB8Y8Q1KXWSZ85T', NULL, 'pset_01KGH9CW6CWWBQF15VQS1R38E8', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:17.133+07', '2026-02-03 10:48:17.123+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6CE11GCMVQ6W9H1X2Z', NULL, 'pset_01KGH9CW6D9H11ACWMRDGNRM7V', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:19.995+07', '2026-02-03 10:48:19.986+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6C4HWMP7BCVXJAM5KC', NULL, 'pset_01KGH9CW6D9H11ACWMRDGNRM7V', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:19.995+07', '2026-02-03 10:48:19.986+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6BNJQ5CGWB96WNTJC2', NULL, 'pset_01KGH9CW6B24A5F8DE84X1G6EC', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:24.04+07', '2026-02-03 10:48:24.031+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6B8HWXGQJXQSG8N2KG', NULL, 'pset_01KGH9CW6B24A5F8DE84X1G6EC', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:24.04+07', '2026-02-03 10:48:24.031+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6D07Z7EATM5SNZPY14', NULL, 'pset_01KGH9CW6E1FM53Z1NFJSDY642', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:27.134+07', '2026-02-03 10:48:27.126+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6E8773VV4GBZ5TXMPY', NULL, 'pset_01KGH9CW6E1FM53Z1NFJSDY642', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:27.134+07', '2026-02-03 10:48:27.126+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6DWB1D88A8W2HBGSHS', NULL, 'pset_01KGH9CW6DYZ5SBPT9N39ZT5QG', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:30.355+07', '2026-02-03 10:48:30.344+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6DY5QT40R9WWMFE24J', NULL, 'pset_01KGH9CW6DYZ5SBPT9N39ZT5QG', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:30.355+07', '2026-02-03 10:48:30.344+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6F9VXGGYGQA3YR9ARK', NULL, 'pset_01KGH9CW6F2338TBN2BXX66M9D', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:56:49.538+07', '2026-02-03 10:56:49.529+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6FJT99EJB2XZ9YJBVN', NULL, 'pset_01KGH9CW6F2338TBN2BXX66M9D', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:56:49.538+07', '2026-02-03 10:56:49.529+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6NMEEVHXGQ5WS2J3ES', NULL, 'pset_01KGH9CW6N6Y2H9TXRG0QAFHQ3', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.585+07', '2026-02-03 15:20:10.585+07', NULL, NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGHGJFTQNRGX5KH8Q6R3MGKC', NULL, 'pset_01KGH9CW6F1NK2D1JA9VE0HKF0', 'idr', '{"value": "1500000", "precision": 20}', 0, '2026-02-03 17:25:34.556+07', '2026-02-03 17:26:00.761+07', NULL, NULL, 1500000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6A1CHD1F392FACSMQP', NULL, 'pset_01KGH9CW6B2NQ4TSR756A2MHMW', 'eur', '{"value": "10", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:07.415+07', '2026-02-03 10:48:07.392+07', NULL, 10, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6B5PST2H8E7AX07G5G', NULL, 'pset_01KGH9CW6B2NQ4TSR756A2MHMW', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:07.415+07', '2026-02-03 10:48:07.392+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGH9CW6CWSDWZV6WR5A83XSX', NULL, 'pset_01KGH9CW6CWWBQF15VQS1R38E8', 'usd', '{"value": "15", "precision": 20}', 0, '2026-02-03 15:20:10.584+07', '2026-02-03 10:48:17.133+07', '2026-02-03 10:48:17.123+07', NULL, 15, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGHGJFTSQ4J7V93KVY4ZA7YF', NULL, 'pset_01KGH9CW6F1NK2D1JA9VE0HKF0', 'idr', '{"value": "1500000", "precision": 20}', 1, '2026-02-03 17:25:34.558+07', '2026-02-03 10:55:01.114+07', NULL, NULL, 1500000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGTFR3M8Y9DQSW4CMXG0B7K', NULL, 'pset_01KGH9CW6G70H3YBCZZ202P97G', 'idr', '{"value": "750000", "precision": 20}', 0, '2026-02-03 10:59:36.053+07', '2026-02-03 10:59:36.053+07', NULL, NULL, 750000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGTJKQHRXB4Q229M8K3CAYN', NULL, 'pset_01KGH9CW6G86WNT1SB7D90Z0ZR', 'idr', '{"value": "30000", "precision": 20}', 0, '2026-02-03 11:01:09.874+07', '2026-02-03 11:01:09.874+07', NULL, NULL, 30000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGVRVVSV6XVK9PW3CA5334R', NULL, 'pset_01KGGVRVVTGFV1V4B1XH5S254V', 'idr', '{"value": "20000", "precision": 20}', 0, '2026-02-03 11:22:03.387+07', '2026-02-03 11:22:03.387+07', NULL, NULL, 20000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGV0FTM65SXSFTQAD0GQF75', NULL, 'pset_01KGGV0FTNXR0SG8P813B133CK', 'idr', '{"value": "20000", "precision": 20}', 0, '2026-02-03 11:08:44.63+07', '2026-02-03 11:23:01.052+07', '2026-02-03 11:23:01.045+07', NULL, 20000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGWV3J72EKWW8N7CK8A12W5', NULL, 'pset_01KGGWV3J8CWD7CWY04JP61Q41', 'idr', '{"value": "22000", "precision": 20}', 0, '2026-02-03 11:40:45.385+07', '2026-02-03 11:40:45.385+07', NULL, NULL, 22000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGX114TXGPF524KP3JF9MQW', NULL, 'pset_01KGGX114V7EYN4ZMM3M0SBF2R', 'idr', '{"value": "19000", "precision": 20}', 0, '2026-02-03 11:43:59.515+07', '2026-02-03 11:43:59.515+07', NULL, NULL, 19000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGX56YS933R6RMDJF3X6VDR', NULL, 'pset_01KGGX56YTF02MZX99YFKDEYBW', 'idr', '{"value": "24000", "precision": 20}', 0, '2026-02-03 11:46:16.539+07', '2026-02-03 11:46:16.539+07', NULL, NULL, 24000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGXCEBFQXPVSJVYBVZ496Q8', NULL, 'pset_01KGGXCEBG4JN1GF1FVNN0JPNT', 'idr', '{"value": "18000", "precision": 20}', 0, '2026-02-03 11:50:13.49+07', '2026-02-03 11:50:13.49+07', NULL, NULL, 18000, NULL, NULL, NULL, NULL);
INSERT INTO "public"."price" VALUES ('price_01KGGXFGM84RH1W970E79P224P', NULL, 'pset_01KGGXFGM9RVPCZX11P5JX3GBP', 'idr', '{"value": "19000", "precision": 20}', 0, '2026-02-03 11:51:54.122+07', '2026-02-03 11:51:54.122+07', NULL, NULL, 19000, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for price_list
-- ----------------------------
DROP TABLE IF EXISTS "public"."price_list";
CREATE TABLE "public"."price_list" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'draft'::text,
  "starts_at" timestamptz(6),
  "ends_at" timestamptz(6),
  "rules_count" int4 DEFAULT 0,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'sale'::text,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of price_list
-- ----------------------------

-- ----------------------------
-- Table structure for price_list_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."price_list_rule";
CREATE TABLE "public"."price_list_rule" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "price_list_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "value" jsonb,
  "attribute" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text
)
;

-- ----------------------------
-- Records of price_list_rule
-- ----------------------------

-- ----------------------------
-- Table structure for price_preference
-- ----------------------------
DROP TABLE IF EXISTS "public"."price_preference";
CREATE TABLE "public"."price_preference" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "attribute" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default",
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of price_preference
-- ----------------------------
INSERT INTO "public"."price_preference" VALUES ('prpref_01KGH9CNXEAR49H5HNWH28C03B', 'currency_code', 'eur', 'f', '2026-02-03 15:20:04.142+07', '2026-02-03 15:20:04.142+07', NULL);
INSERT INTO "public"."price_preference" VALUES ('prpref_01KGH9CVPHSSW0EBCWWGG6AR4N', 'region_id', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', 'f', '2026-02-03 15:20:10.066+07', '2026-02-03 15:20:10.066+07', NULL);
INSERT INTO "public"."price_preference" VALUES ('prpref_01KGHB2F6C09V8K39PJ29KMFF3', 'currency_code', 'usd', 'f', '2026-02-03 15:49:26.733+07', '2026-02-03 15:49:26.733+07', NULL);
INSERT INTO "public"."price_preference" VALUES ('prpref_01KGHBCJ1FKAZ4ER508T1ECMYF', 'currency_code', 'idr', 'f', '2026-02-03 15:54:57.328+07', '2026-02-03 15:54:57.328+07', NULL);

-- ----------------------------
-- Table structure for price_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."price_rule";
CREATE TABLE "public"."price_rule" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "priority" int4 NOT NULL DEFAULT 0,
  "price_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "attribute" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "operator" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'eq'::text
)
;

-- ----------------------------
-- Records of price_rule
-- ----------------------------
INSERT INTO "public"."price_rule" VALUES ('prule_01KGH9CVWTWH4FKZT6KPMDJFCB', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', 0, 'price_01KGH9CVWTNVBWPPZG40069AGD', '2026-02-03 15:20:10.269+07', '2026-02-03 15:20:10.269+07', NULL, 'region_id', 'eq');
INSERT INTO "public"."price_rule" VALUES ('prule_01KGH9CVWVJHWJ78RQD7ZT6FEJ', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', 0, 'price_01KGH9CVWWAPT043RDHY6WEP3M', '2026-02-03 15:20:10.27+07', '2026-02-03 15:20:10.27+07', NULL, 'region_id', 'eq');
INSERT INTO "public"."price_rule" VALUES ('prule_01KGGT7BJGFBA2SHDH0DQC17XK', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', 0, 'price_01KGHGJFTSQ4J7V93KVY4ZA7YF', '2026-02-03 10:55:01.113+07', '2026-02-03 10:55:01.113+07', NULL, 'region_id', 'eq');

-- ----------------------------
-- Table structure for price_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."price_set";
CREATE TABLE "public"."price_set" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of price_set
-- ----------------------------
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CVWVHR0HR4QM9XYF68MA', '2026-02-03 15:20:10.268+07', '2026-02-03 15:20:10.268+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CVWW7S23PKNDESSTF5EX', '2026-02-03 15:20:10.269+07', '2026-02-03 15:20:10.269+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6EVE1JRRK4NABQGHRB', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6E34C7JY7Q2C1KEWEV', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6F74SMXPJTBJDRXR53', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6FDP7C5M601DVDFFMH', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6F1NK2D1JA9VE0HKF0', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6G86WNT1SB7D90Z0ZR', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6G70H3YBCZZ202P97G', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.583+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6HV08QVWXMKVEC3PCA', '2026-02-03 15:20:10.583+07', '2026-02-03 15:20:10.584+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6JDXV1HRPDPMBSKPFQ', '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6MQMA2Y7G86NQQA2SE', '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6N6Y2H9TXRG0QAFHQ3', '2026-02-03 15:20:10.584+07', '2026-02-03 15:20:10.584+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6B2NQ4TSR756A2MHMW', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:07.396+07', '2026-02-03 10:48:07.392+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6CQ7AZSXVDVZW4SWM6', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:11.131+07', '2026-02-03 10:48:11.13+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6DAF63N0KRT5DV4EWS', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:14.146+07', '2026-02-03 10:48:14.145+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6CWWBQF15VQS1R38E8', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:17.123+07', '2026-02-03 10:48:17.123+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6D9H11ACWMRDGNRM7V', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:19.987+07', '2026-02-03 10:48:19.986+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6B24A5F8DE84X1G6EC', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:24.032+07', '2026-02-03 10:48:24.031+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6E1FM53Z1NFJSDY642', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:27.126+07', '2026-02-03 10:48:27.126+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6DYZ5SBPT9N39ZT5QG', '2026-02-03 15:20:10.583+07', '2026-02-03 10:48:30.345+07', '2026-02-03 10:48:30.344+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGH9CW6F2338TBN2BXX66M9D', '2026-02-03 15:20:10.583+07', '2026-02-03 10:56:49.53+07', '2026-02-03 10:56:49.529+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGGVRVVTGFV1V4B1XH5S254V', '2026-02-03 11:22:03.387+07', '2026-02-03 11:22:03.387+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGGV0FTNXR0SG8P813B133CK', '2026-02-03 11:08:44.629+07', '2026-02-03 11:23:01.046+07', '2026-02-03 11:23:01.045+07');
INSERT INTO "public"."price_set" VALUES ('pset_01KGGWV3J8CWD7CWY04JP61Q41', '2026-02-03 11:40:45.384+07', '2026-02-03 11:40:45.384+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGGX114V7EYN4ZMM3M0SBF2R', '2026-02-03 11:43:59.515+07', '2026-02-03 11:43:59.515+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGGX56YTF02MZX99YFKDEYBW', '2026-02-03 11:46:16.538+07', '2026-02-03 11:46:16.538+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGGXCEBG4JN1GF1FVNN0JPNT', '2026-02-03 11:50:13.489+07', '2026-02-03 11:50:13.489+07', NULL);
INSERT INTO "public"."price_set" VALUES ('pset_01KGGXFGM9RVPCZX11P5JX3GBP', '2026-02-03 11:51:54.122+07', '2026-02-03 11:51:54.122+07', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS "public"."product";
CREATE TABLE "public"."product" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "handle" text COLLATE "pg_catalog"."default" NOT NULL,
  "subtitle" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "is_giftcard" bool NOT NULL DEFAULT false,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'draft'::text,
  "thumbnail" text COLLATE "pg_catalog"."default",
  "weight" text COLLATE "pg_catalog"."default",
  "length" text COLLATE "pg_catalog"."default",
  "height" text COLLATE "pg_catalog"."default",
  "width" text COLLATE "pg_catalog"."default",
  "origin_country" text COLLATE "pg_catalog"."default",
  "hs_code" text COLLATE "pg_catalog"."default",
  "mid_code" text COLLATE "pg_catalog"."default",
  "material" text COLLATE "pg_catalog"."default",
  "collection_id" text COLLATE "pg_catalog"."default",
  "type_id" text COLLATE "pg_catalog"."default",
  "discountable" bool NOT NULL DEFAULT true,
  "external_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO "public"."product" VALUES ('prod_01KGH9CW12Y141GAAN2M752MVW', 'Medusa T-Shirt', 't-shirt', NULL, 'Reimagine the feeling of a classic T-shirt. With our cotton T-shirts, everyday essentials no longer have to be ordinary.', 'f', 'draft', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/tee-black-front.png', '400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 10:51:19.916+07', NULL, NULL);
INSERT INTO "public"."product" VALUES ('prod_01KGH9CW12HEZXM8GR9W9ZVYGT', 'Medusa Sweatshirt', 'sweatshirt', NULL, 'Reimagine the feeling of a classic sweatshirt. With our cotton sweatshirt, everyday essentials no longer have to be ordinary.', 'f', 'draft', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatshirt-vintage-front.png', '400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 10:51:29.947+07', NULL, NULL);
INSERT INTO "public"."product" VALUES ('prod_01KGH9CW12EPCQR3H9FYHGSTFB', 'Medusa Shorts', 'shorts', NULL, 'Reimagine the feeling of classic shorts. With our cotton shorts, everyday essentials no longer have to be ordinary.', 'f', 'draft', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/shorts-vintage-front.png', '400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 10:51:40.275+07', NULL, NULL);
INSERT INTO "public"."product" VALUES ('prod_01KGH9CW124AGG4YGFJ9X41SH0', 'Medusa Sweatpants', 'sweatpants', NULL, 'Reimagine the feeling of classic sweatpants. With our cotton sweatpants, everyday essentials no longer have to be ordinary.', 'f', 'draft', 'https://medusa-public-images.s3.eu-west-1.amazonaws.com/sweatpants-gray-front.png', '400', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 12:02:56.408+07', NULL, NULL);
INSERT INTO "public"."product" VALUES ('prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'MOLI Flavored Syrup', 'moli-flavored-syrup', NULL, 'Sirup MOLI dengan berbagai varian rasa', 'f', 'published', 'http://localhost:9000/static/1770092672153-SIRUP.jpg', '250', NULL, NULL, NULL, 'id', '', '', NULL, 'pcol_01KGHEWENZ83R05RPS0DD54E13', 'ptyp_01KGGY0TH6663F5C20QTB5K6J1', 't', NULL, '2026-02-03 11:08:44.458+07', '2026-02-03 19:42:13.959+07', NULL, NULL);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_category";
CREATE TABLE "public"."product_category" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "handle" text COLLATE "pg_catalog"."default" NOT NULL,
  "mpath" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_active" bool NOT NULL DEFAULT false,
  "is_internal" bool NOT NULL DEFAULT false,
  "rank" int4 NOT NULL DEFAULT 0,
  "parent_category_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO "public"."product_category" VALUES ('pcat_01KGH9CW086GNXCJJQP14KW8NB', 'Shirts', '', 'shirts', '', 't', 'f', 0, NULL, '2026-02-03 15:20:10.379+07', '2026-02-03 11:01:41.64+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGH9CW095W3KVMDB3V9YCZA9', 'Sweatshirts', '', 'sweatshirts', 'pcat_01KGH9CW095W3KVMDB3V9YCZA9', 't', 'f', 1, NULL, '2026-02-03 15:20:10.379+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGH9CW0A9J4FCF21Z06NHPCF', 'Pants', '', 'pants', 'pcat_01KGH9CW0A9J4FCF21Z06NHPCF', 't', 'f', 2, NULL, '2026-02-03 15:20:10.379+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGH9CW0AS8XEAQ83BATA10HR', 'Merch', '', 'merch', 'pcat_01KGH9CW0AS8XEAQ83BATA10HR', 't', 'f', 3, NULL, '2026-02-03 15:20:10.379+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGHEM7F4653BJTKKER5TRYXC', 'Herbs', 'Produk herbal', 'herbs', 'pcat_01KGHEM7F4653BJTKKER5TRYXC', 't', 'f', 4, NULL, '2026-02-03 16:51:34.375+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGHEN24SNN5PTM0G1MZZ3VHC', 'Garam', 'Produk garam', 'garam', 'pcat_01KGHEN24SNN5PTM0G1MZZ3VHC', 't', 'f', 5, NULL, '2026-02-03 16:52:01.689+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGHETZ7E5GSM4KQZ74S0A6BX', 'Bumbu', 'Produk bumbu', 'bumbu', 'pcat_01KGHETZ7E5GSM4KQZ74S0A6BX', 't', 'f', 6, NULL, '2026-02-03 16:55:15.311+07', '2026-02-03 11:01:41.639+07', NULL, NULL);
INSERT INTO "public"."product_category" VALUES ('pcat_01KGHEVJHJBWPQQW2MJBR95EGR', 'Sirup', 'Produk sirup', 'sirup', 'pcat_01KGHEVJHJBWPQQW2MJBR95EGR', 't', 'f', 7, NULL, '2026-02-03 16:55:35.091+07', '2026-02-03 11:01:41.639+07', NULL, NULL);

-- ----------------------------
-- Table structure for product_category_product
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_category_product";
CREATE TABLE "public"."product_category_product" (
  "product_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "product_category_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of product_category_product
-- ----------------------------
INSERT INTO "public"."product_category_product" VALUES ('prod_01KGH9CW12Y141GAAN2M752MVW', 'pcat_01KGH9CW086GNXCJJQP14KW8NB');
INSERT INTO "public"."product_category_product" VALUES ('prod_01KGH9CW12HEZXM8GR9W9ZVYGT', 'pcat_01KGH9CW095W3KVMDB3V9YCZA9');
INSERT INTO "public"."product_category_product" VALUES ('prod_01KGH9CW124AGG4YGFJ9X41SH0', 'pcat_01KGH9CW0A9J4FCF21Z06NHPCF');
INSERT INTO "public"."product_category_product" VALUES ('prod_01KGH9CW12EPCQR3H9FYHGSTFB', 'pcat_01KGH9CW0AS8XEAQ83BATA10HR');
INSERT INTO "public"."product_category_product" VALUES ('prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'pcat_01KGHEVJHJBWPQQW2MJBR95EGR');

-- ----------------------------
-- Table structure for product_collection
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_collection";
CREATE TABLE "public"."product_collection" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "handle" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_collection
-- ----------------------------
INSERT INTO "public"."product_collection" VALUES ('pcol_01KGHEWENZ83R05RPS0DD54E13', 'Pilihan Kuliner Cita Rasa Tinggi', 'pilihan-kuliner-cita-rasa-tinggi', NULL, '2026-02-03 16:56:03.899231+07', '2026-02-03 10:43:22.511+07', NULL);

-- ----------------------------
-- Table structure for product_option
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_option";
CREATE TABLE "public"."product_option" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "product_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_option
-- ----------------------------
INSERT INTO "public"."product_option" VALUES ('opt_01KGH9CW1640W182HDSH3NRPWE', 'Size', 'prod_01KGH9CW12Y141GAAN2M752MVW', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGH9CW163D8C42KWNNAAEDNZ', 'Color', 'prod_01KGH9CW12Y141GAAN2M752MVW', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGH9CW19TB40ATYD1JBJY0NN', 'Size', 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGH9CW1A3ZKVKYJZK94QA05V', 'Size', 'prod_01KGH9CW124AGG4YGFJ9X41SH0', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGH9CW1BPQ1DT7VYE2NZD9N9', 'Size', 'prod_01KGH9CW12EPCQR3H9FYHGSTFB', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGGVKMW19RPC50E4WCNSJTAR', 'Rasa', 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', NULL, '2026-02-03 11:19:12.386+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option" VALUES ('opt_01KGGV0FN7ZG1TSW0BKMTQ2D9A', 'Default option', 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', NULL, '2026-02-03 11:08:44.459+07', '2026-02-03 11:23:09.935+07', '2026-02-03 11:23:09.934+07');

-- ----------------------------
-- Table structure for product_option_value
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_option_value";
CREATE TABLE "public"."product_option_value" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "option_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_option_value
-- ----------------------------
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW151M7QRH32CF3SYDPA', 'S', 'opt_01KGH9CW1640W182HDSH3NRPWE', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW16R8WAK69ZHV66BNHG', 'M', 'opt_01KGH9CW1640W182HDSH3NRPWE', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW16RQ49SMSFEV3XQQ73', 'L', 'opt_01KGH9CW1640W182HDSH3NRPWE', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW166QWAB3JHE9XGWDSH', 'XL', 'opt_01KGH9CW1640W182HDSH3NRPWE', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW16DTQR9PSH9SEQKVKN', 'Black', 'opt_01KGH9CW163D8C42KWNNAAEDNZ', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW16HXQFCTRGR6E4GWYZ', 'White', 'opt_01KGH9CW163D8C42KWNNAAEDNZ', NULL, '2026-02-03 15:20:10.413+07', '2026-02-03 15:20:10.413+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW19MEVV82B1FWZSEHA6', 'S', 'opt_01KGH9CW19TB40ATYD1JBJY0NN', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW19KWB706WN5JX74J14', 'M', 'opt_01KGH9CW19TB40ATYD1JBJY0NN', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW19J1XCZ3YSJKNZF756', 'L', 'opt_01KGH9CW19TB40ATYD1JBJY0NN', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW19PAEB9R19M2QG7YEC', 'XL', 'opt_01KGH9CW19TB40ATYD1JBJY0NN', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1AV5AA7TZNG2QAWKZN', 'S', 'opt_01KGH9CW1A3ZKVKYJZK94QA05V', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1AKKYWZ9VAHYEGVDA2', 'M', 'opt_01KGH9CW1A3ZKVKYJZK94QA05V', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1AD2C2ECRHYTMBXZMV', 'L', 'opt_01KGH9CW1A3ZKVKYJZK94QA05V', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1AC0CZF6VTN7BR75E6', 'XL', 'opt_01KGH9CW1A3ZKVKYJZK94QA05V', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1BH8PTGB0AV7NW8FKM', 'S', 'opt_01KGH9CW1BPQ1DT7VYE2NZD9N9', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1B97B7M8EMBGJF2EV8', 'M', 'opt_01KGH9CW1BPQ1DT7VYE2NZD9N9', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1BX93NNKVJNXG839XM', 'L', 'opt_01KGH9CW1BPQ1DT7VYE2NZD9N9', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGH9CW1B3FV86SK1Z9JKDAD5', 'XL', 'opt_01KGH9CW1BPQ1DT7VYE2NZD9N9', NULL, '2026-02-03 15:20:10.414+07', '2026-02-03 15:20:10.414+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMVZS36DY2T6WC3BDGKN', 'Caramel', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMVZCED2M5EJHTJQJYHD', 'Hezelnut', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMW0XSMEZY02JNTQ8DG5', 'Lychee', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMW0E7DJWZ46XM14X5YK', 'Peach', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMW00KAN1C2076TS85AQ', 'Strawberry', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGVKMW1D8YETSGN58EB0AYB', 'Vanilla', 'opt_01KGGVKMW19RPC50E4WCNSJTAR', NULL, '2026-02-03 11:19:12.387+07', '2026-02-03 11:19:12.387+07', NULL);
INSERT INTO "public"."product_option_value" VALUES ('optval_01KGGV0FN68P02C4GXK7G1VPBY', 'Default option value', 'opt_01KGGV0FN7ZG1TSW0BKMTQ2D9A', NULL, '2026-02-03 11:08:44.459+07', '2026-02-03 11:23:09.946+07', '2026-02-03 11:23:09.934+07');

-- ----------------------------
-- Table structure for product_sales_channel
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_sales_channel";
CREATE TABLE "public"."product_sales_channel" (
  "product_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sales_channel_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_sales_channel
-- ----------------------------
INSERT INTO "public"."product_sales_channel" VALUES ('prod_01KGH9CW12Y141GAAN2M752MVW', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'prodsc_01KGH9CW2F4WX22FF16RXYZXP8', '2026-02-03 15:20:10.447066+07', '2026-02-03 15:20:10.447066+07', NULL);
INSERT INTO "public"."product_sales_channel" VALUES ('prod_01KGH9CW12HEZXM8GR9W9ZVYGT', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'prodsc_01KGH9CW2GVCQSS2NFRHXQSEP0', '2026-02-03 15:20:10.447066+07', '2026-02-03 15:20:10.447066+07', NULL);
INSERT INTO "public"."product_sales_channel" VALUES ('prod_01KGH9CW124AGG4YGFJ9X41SH0', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'prodsc_01KGH9CW2GG52QTFSFVACTG0T1', '2026-02-03 15:20:10.447066+07', '2026-02-03 15:20:10.447066+07', NULL);
INSERT INTO "public"."product_sales_channel" VALUES ('prod_01KGH9CW12EPCQR3H9FYHGSTFB', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'prodsc_01KGH9CW2GN0WATZFRMGMGJERS', '2026-02-03 15:20:10.447066+07', '2026-02-03 15:20:10.447066+07', NULL);
INSERT INTO "public"."product_sales_channel" VALUES ('prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'prodsc_01KGGV0FPF5B7D8TK3C9F873KJ', '2026-02-03 11:08:44.492476+07', '2026-02-03 11:08:44.492476+07', NULL);

-- ----------------------------
-- Table structure for product_shipping_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_shipping_profile";
CREATE TABLE "public"."product_shipping_profile" (
  "product_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "shipping_profile_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_shipping_profile
-- ----------------------------
INSERT INTO "public"."product_shipping_profile" VALUES ('prod_01KGH9CW12Y141GAAN2M752MVW', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'prodsp_01KGH9CW34HGF0NA23P6J4TTC6', '2026-02-03 15:20:10.46776+07', '2026-02-03 15:20:10.46776+07', NULL);
INSERT INTO "public"."product_shipping_profile" VALUES ('prod_01KGH9CW12HEZXM8GR9W9ZVYGT', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'prodsp_01KGH9CW356YJT52E3W18NFBJW', '2026-02-03 15:20:10.46776+07', '2026-02-03 15:20:10.46776+07', NULL);
INSERT INTO "public"."product_shipping_profile" VALUES ('prod_01KGH9CW124AGG4YGFJ9X41SH0', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'prodsp_01KGH9CW36C2THKW3BNZGC8HKW', '2026-02-03 15:20:10.46776+07', '2026-02-03 15:20:10.46776+07', NULL);
INSERT INTO "public"."product_shipping_profile" VALUES ('prod_01KGH9CW12EPCQR3H9FYHGSTFB', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'prodsp_01KGH9CW36M477W5R9Q7R4KV2D', '2026-02-03 15:20:10.46776+07', '2026-02-03 15:20:10.46776+07', NULL);
INSERT INTO "public"."product_shipping_profile" VALUES ('prod_01KGGV0FN5GNVZ2M80KX7W2N54', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'prodsp_01KGGV0FQ7R29BC5YQJ0KWW4R6', '2026-02-03 11:08:44.519063+07', '2026-02-03 11:08:44.519063+07', NULL);

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_tag";
CREATE TABLE "public"."product_tag" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_tag
-- ----------------------------

-- ----------------------------
-- Table structure for product_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_tags";
CREATE TABLE "public"."product_tags" (
  "product_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "product_tag_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of product_tags
-- ----------------------------

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_type";
CREATE TABLE "public"."product_type" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" json,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO "public"."product_type" VALUES ('ptyp_01KGGY0TH6663F5C20QTB5K6J1', 'Food & Baverage', NULL, '2026-02-03 12:01:21.319+07', '2026-02-03 12:01:21.319+07', NULL);

-- ----------------------------
-- Table structure for product_variant
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_variant";
CREATE TABLE "public"."product_variant" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "title" text COLLATE "pg_catalog"."default" NOT NULL,
  "sku" text COLLATE "pg_catalog"."default",
  "barcode" text COLLATE "pg_catalog"."default",
  "ean" text COLLATE "pg_catalog"."default",
  "upc" text COLLATE "pg_catalog"."default",
  "allow_backorder" bool NOT NULL DEFAULT false,
  "manage_inventory" bool NOT NULL DEFAULT true,
  "hs_code" text COLLATE "pg_catalog"."default",
  "origin_country" text COLLATE "pg_catalog"."default",
  "mid_code" text COLLATE "pg_catalog"."default",
  "material" text COLLATE "pg_catalog"."default",
  "weight" int4,
  "length" int4,
  "height" int4,
  "width" int4,
  "metadata" jsonb,
  "variant_rank" int4 DEFAULT 0,
  "product_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "thumbnail" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of product_variant
-- ----------------------------
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4B64H7966S0ER07NSH', 'S', 'SWEATSHIRT-S', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4B0JQNYJAT3W484MBM', 'M', 'SWEATSHIRT-M', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4B9127NWXF48KNNK8D', 'L', 'SWEATSHIRT-L', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4B1HDWK5896J9MN2PW', 'XL', 'SWEATSHIRT-XL', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12HEZXM8GR9W9ZVYGT', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CRBPM5NKVVV904CKE', 'S', 'SHORTS-S', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CSMCTECNTJV19TCT4', 'M', 'SHORTS-M', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4C0N57SATKAJ728TNV', 'L', 'SHORTS-L', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB', '2026-02-03 15:20:10.51+07', '2026-02-03 15:20:10.51+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CG8AT0WVPHV5D591N', 'XL', 'SHORTS-XL', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12EPCQR3H9FYHGSTFB', '2026-02-03 15:20:10.51+07', '2026-02-03 15:20:10.51+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGXFGH6ZFDFS6JMG05ST45Y', 'Vanilla', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:51:54.023+07', '2026-02-03 11:51:54.023+07', NULL, 'http://localhost:9000/static/1770092878428-vanilla-copy.jpg');
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW49W0ZN1GSDTCA6BWMS', 'S / Black', 'SHIRT-S-BLACK', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:07.515+07', '2026-02-03 10:48:07.513+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4A5506P7WJ1F9JW8TJ', 'M / Black', 'SHIRT-M-BLACK', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:11.216+07', '2026-02-03 10:48:11.216+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4A6SX0M5PXQJC6R7K5', 'L / White', 'SHIRT-L-WHITE', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:14.233+07', '2026-02-03 10:48:14.232+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4AKS5WCGZ1S0QQKD4H', 'M / White', 'SHIRT-M-WHITE', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:17.191+07', '2026-02-03 10:48:17.191+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4AKXG5E8HYKQ3XTG82', 'L / Black', 'SHIRT-L-BLACK', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:20.049+07', '2026-02-03 10:48:20.049+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4AW6NC880ETD3Y2BV8', 'S / White', 'SHIRT-S-WHITE', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:24.099+07', '2026-02-03 10:48:24.098+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4B7XZM2TGXKT40M4Z7', 'XL / White', 'SHIRT-XL-WHITE', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:27.181+07', '2026-02-03 10:48:27.18+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4BFAGKV727PB2TGE1E', 'XL / Black', 'SHIRT-XL-BLACK', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW12Y141GAAN2M752MVW', '2026-02-03 15:20:10.509+07', '2026-02-03 10:48:30.418+07', '2026-02-03 10:48:30.418+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'S', 'SWEATPANTS-S', NULL, NULL, NULL, 'f', 't', NULL, 'id', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW124AGG4YGFJ9X41SH0', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CTCW17YXNHAEYTHRE', 'M', 'SWEATPANTS-M', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW124AGG4YGFJ9X41SH0', '2026-02-03 15:20:10.509+07', '2026-02-03 10:56:49.603+07', '2026-02-03 10:56:49.603+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CJR2AXN9BTQEY7AWT', 'XL', 'SWEATPANTS-XL', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW124AGG4YGFJ9X41SH0', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGH9CW4CB886Z278818GW44T', 'L', 'SWEATPANTS-L', NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGH9CW124AGG4YGFJ9X41SH0', '2026-02-03 15:20:10.509+07', '2026-02-03 15:20:10.509+07', NULL, NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGV0FRY5N88Z6B3WZX1K0FN', 'Default variant', NULL, NULL, NULL, NULL, 'f', 'f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:08:44.575+07', '2026-02-03 11:23:01.077+07', '2026-02-03 11:23:01.076+07', NULL);
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGVRVSQPAT4DV0TE61ZNRHD', 'Caramel', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:22:03.322+07', '2026-02-03 11:22:03.322+07', NULL, 'http://localhost:9000/static/1770092878397-caramel-copy.jpg');
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGWV3FE2PWAZXNPXECQW3EZ', 'Hezelnut', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:40:45.295+07', '2026-02-03 11:40:45.295+07', NULL, 'http://localhost:9000/static/1770092878422-strawberry-copy.jpg');
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGX112XFDWCQQ5MHQ7EHA9T', 'Lychee', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:43:59.454+07', '2026-02-03 11:43:59.454+07', NULL, 'http://localhost:9000/static/1770092878410-lychee-copy.jpg');
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGX56WAEVMET9KPE4R9BQ38', 'Strawberry', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:46:16.459+07', '2026-02-03 11:46:16.459+07', NULL, 'http://localhost:9000/static/1770092878422-strawberry-copy.jpg');
INSERT INTO "public"."product_variant" VALUES ('variant_01KGGXCE6XF4Z5PF25P0DF5T9T', 'Peach', NULL, NULL, NULL, NULL, 'f', 't', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'prod_01KGGV0FN5GNVZ2M80KX7W2N54', '2026-02-03 11:50:13.342+07', '2026-02-03 11:50:13.342+07', NULL, 'http://localhost:9000/static/1770092878417-peach-copy.jpg');

-- ----------------------------
-- Table structure for product_variant_inventory_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_variant_inventory_item";
CREATE TABLE "public"."product_variant_inventory_item" (
  "variant_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "inventory_item_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "required_quantity" int4 NOT NULL DEFAULT 1,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_variant_inventory_item
-- ----------------------------
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4B64H7966S0ER07NSH', 'iitem_01KGH9CW54P0N88Z51DSVX3TPA', 'pvitem_01KGH9CW5VN7W0KMXXTM45Z0W3', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4B0JQNYJAT3W484MBM', 'iitem_01KGH9CW5476PNDBC60YG5GX5C', 'pvitem_01KGH9CW5V9YF4SKGSVGZMD0QY', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4B9127NWXF48KNNK8D', 'iitem_01KGH9CW547CVJ2H8SYFQ05TZN', 'pvitem_01KGH9CW5V7YZN8MBG0VPPAR5X', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4B1HDWK5896J9MN2PW', 'iitem_01KGH9CW543JS0NYNDDDMGD4WC', 'pvitem_01KGH9CW5WBMMFK3RPPG154CY9', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'iitem_01KGH9CW55SKQFNK46R534CKMN', 'pvitem_01KGH9CW5W5VGCRJYRH6WNB8JV', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CB886Z278818GW44T', 'iitem_01KGH9CW55XPTHFAR2GRD9V47B', 'pvitem_01KGH9CW5WSEENX0F0BJP0QKAQ', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CJR2AXN9BTQEY7AWT', 'iitem_01KGH9CW55AG8AFARD7GAB9FE7', 'pvitem_01KGH9CW5WC1GVPE2Y6T06E1KK', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CRBPM5NKVVV904CKE', 'iitem_01KGH9CW557N0YTHPCVA1RXYXZ', 'pvitem_01KGH9CW5WR3WZVZ7WHPS49TWZ', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CSMCTECNTJV19TCT4', 'iitem_01KGH9CW55N9GWCY079B18PKAW', 'pvitem_01KGH9CW5W62APCZA95231GM0H', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4C0N57SATKAJ728TNV', 'iitem_01KGH9CW551MYRYPP1XE06KVN0', 'pvitem_01KGH9CW5WJWNAPHXSF4GM3AP7', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CG8AT0WVPHV5D591N', 'iitem_01KGH9CW554270QETZNXF3CC28', 'pvitem_01KGH9CW5W979SBC1GNQ9934B3', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 15:20:10.554207+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW49W0ZN1GSDTCA6BWMS', 'iitem_01KGH9CW537DAPH50YA7Q430D5', 'pvitem_01KGH9CW5TK2CDHR2GZW6QZ3R8', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:07.369+07', '2026-02-03 10:48:07.366+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4A5506P7WJ1F9JW8TJ', 'iitem_01KGH9CW542SQHYCCY6ZWRBE5F', 'pvitem_01KGH9CW5VJNHN0CXRS9P14RMT', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:11.113+07', '2026-02-03 10:48:11.112+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4A6SX0M5PXQJC6R7K5', 'iitem_01KGH9CW541ZAXSCMSAJP2KHQ8', 'pvitem_01KGH9CW5VN4FD52JYNW69SK57', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:14.131+07', '2026-02-03 10:48:14.13+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4AKS5WCGZ1S0QQKD4H', 'iitem_01KGH9CW54C1QDDQT7XSSKG4F5', 'pvitem_01KGH9CW5V4JTXXSMPT03HVQ2P', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:17.105+07', '2026-02-03 10:48:17.104+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4AKXG5E8HYKQ3XTG82', 'iitem_01KGH9CW54XVH2YRQRVHVMEDY6', 'pvitem_01KGH9CW5V9KX2R9Z7C0AVRJME', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:19.972+07', '2026-02-03 10:48:19.971+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4AW6NC880ETD3Y2BV8', 'iitem_01KGH9CW53VY41D7CY2PPFB4AC', 'pvitem_01KGH9CW5T4G99MX9CNRYKE1A4', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:24.017+07', '2026-02-03 10:48:24.017+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4B7XZM2TGXKT40M4Z7', 'iitem_01KGH9CW5428DQC7B6D0R857XX', 'pvitem_01KGH9CW5V1P6D1JFJBNX4E62A', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:27.116+07', '2026-02-03 10:48:27.115+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4BFAGKV727PB2TGE1E', 'iitem_01KGH9CW54J82CJ1RJJSN7YC33', 'pvitem_01KGH9CW5VR73BVT0NGRJB8DXS', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:48:30.332+07', '2026-02-03 10:48:30.331+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGH9CW4CTCW17YXNHAEYTHRE', 'iitem_01KGH9CW55XVRW0QFR6DN3TFVB', 'pvitem_01KGH9CW5W0FK95T0SVH70A5VD', 1, '2026-02-03 15:20:10.554207+07', '2026-02-03 10:56:49.512+07', '2026-02-03 10:56:49.511+07');
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGVRVSQPAT4DV0TE61ZNRHD', 'iitem_01KGGW96A42HWNQ97EFHA10T38', 'pvitem_01KGGWA53QJEZC1EAE798NSN7V', 1, '2026-02-03 11:31:29.911086+07', '2026-02-03 11:31:29.911086+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGWV3FE2PWAZXNPXECQW3EZ', 'iitem_01KGGWV3GH5QPSX400H3B78XS6', 'pvitem_01KGGWV3HP8R3SCDHTAR04V9JP', 1, '2026-02-03 11:40:45.365261+07', '2026-02-03 11:40:45.365261+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGX112XFDWCQQ5MHQ7EHA9T', 'iitem_01KGGX113PCMV2MBM7GB29WW6D', 'pvitem_01KGGX114DEGGMNYXSQQJ0PARJ', 1, '2026-02-03 11:43:59.501347+07', '2026-02-03 11:43:59.501347+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGX56WAEVMET9KPE4R9BQ38', 'iitem_01KGGX56XBKBSEJP7ABAP7XN2Q', 'pvitem_01KGGX56YB99BJZHQ5DYSBDJ39', 1, '2026-02-03 11:46:16.523014+07', '2026-02-03 11:46:16.523014+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGXCE6XF4Z5PF25P0DF5T9T', 'iitem_01KGGXCE8QH22NAE6HT6KPD3VQ', 'pvitem_01KGGXCEAHZAZWTVPN0SJHJXS4', 1, '2026-02-03 11:50:13.455592+07', '2026-02-03 11:50:13.455592+07', NULL);
INSERT INTO "public"."product_variant_inventory_item" VALUES ('variant_01KGGXFGH6ZFDFS6JMG05ST45Y', 'iitem_01KGGXFGJC7YV5YMV19NW4R99E', 'pvitem_01KGGXFGKNDHW8X6A7J8WXM9AK', 1, '2026-02-03 11:51:54.100952+07', '2026-02-03 11:51:54.100952+07', NULL);

-- ----------------------------
-- Table structure for product_variant_option
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_variant_option";
CREATE TABLE "public"."product_variant_option" (
  "variant_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "option_value_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of product_variant_option
-- ----------------------------
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW49W0ZN1GSDTCA6BWMS', 'optval_01KGH9CW151M7QRH32CF3SYDPA');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW49W0ZN1GSDTCA6BWMS', 'optval_01KGH9CW16DTQR9PSH9SEQKVKN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AW6NC880ETD3Y2BV8', 'optval_01KGH9CW151M7QRH32CF3SYDPA');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AW6NC880ETD3Y2BV8', 'optval_01KGH9CW16HXQFCTRGR6E4GWYZ');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4A5506P7WJ1F9JW8TJ', 'optval_01KGH9CW16R8WAK69ZHV66BNHG');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4A5506P7WJ1F9JW8TJ', 'optval_01KGH9CW16DTQR9PSH9SEQKVKN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AKS5WCGZ1S0QQKD4H', 'optval_01KGH9CW16R8WAK69ZHV66BNHG');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AKS5WCGZ1S0QQKD4H', 'optval_01KGH9CW16HXQFCTRGR6E4GWYZ');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AKXG5E8HYKQ3XTG82', 'optval_01KGH9CW16RQ49SMSFEV3XQQ73');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4AKXG5E8HYKQ3XTG82', 'optval_01KGH9CW16DTQR9PSH9SEQKVKN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4A6SX0M5PXQJC6R7K5', 'optval_01KGH9CW16RQ49SMSFEV3XQQ73');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4A6SX0M5PXQJC6R7K5', 'optval_01KGH9CW16HXQFCTRGR6E4GWYZ');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4BFAGKV727PB2TGE1E', 'optval_01KGH9CW166QWAB3JHE9XGWDSH');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4BFAGKV727PB2TGE1E', 'optval_01KGH9CW16DTQR9PSH9SEQKVKN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B7XZM2TGXKT40M4Z7', 'optval_01KGH9CW166QWAB3JHE9XGWDSH');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B7XZM2TGXKT40M4Z7', 'optval_01KGH9CW16HXQFCTRGR6E4GWYZ');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B64H7966S0ER07NSH', 'optval_01KGH9CW19MEVV82B1FWZSEHA6');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B0JQNYJAT3W484MBM', 'optval_01KGH9CW19KWB706WN5JX74J14');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B9127NWXF48KNNK8D', 'optval_01KGH9CW19J1XCZ3YSJKNZF756');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4B1HDWK5896J9MN2PW', 'optval_01KGH9CW19PAEB9R19M2QG7YEC');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'optval_01KGH9CW1AV5AA7TZNG2QAWKZN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CTCW17YXNHAEYTHRE', 'optval_01KGH9CW1AKKYWZ9VAHYEGVDA2');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CB886Z278818GW44T', 'optval_01KGH9CW1AD2C2ECRHYTMBXZMV');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CJR2AXN9BTQEY7AWT', 'optval_01KGH9CW1AC0CZF6VTN7BR75E6');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CRBPM5NKVVV904CKE', 'optval_01KGH9CW1BH8PTGB0AV7NW8FKM');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CSMCTECNTJV19TCT4', 'optval_01KGH9CW1B97B7M8EMBGJF2EV8');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4C0N57SATKAJ728TNV', 'optval_01KGH9CW1BX93NNKVJNXG839XM');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGH9CW4CG8AT0WVPHV5D591N', 'optval_01KGH9CW1B3FV86SK1Z9JKDAD5');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGV0FRY5N88Z6B3WZX1K0FN', 'optval_01KGGV0FN68P02C4GXK7G1VPBY');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGVRVSQPAT4DV0TE61ZNRHD', 'optval_01KGGVKMVZS36DY2T6WC3BDGKN');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGWV3FE2PWAZXNPXECQW3EZ', 'optval_01KGGVKMVZCED2M5EJHTJQJYHD');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGX112XFDWCQQ5MHQ7EHA9T', 'optval_01KGGVKMW0XSMEZY02JNTQ8DG5');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGX56WAEVMET9KPE4R9BQ38', 'optval_01KGGVKMW00KAN1C2076TS85AQ');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGXCE6XF4Z5PF25P0DF5T9T', 'optval_01KGGVKMW0E7DJWZ46XM14X5YK');
INSERT INTO "public"."product_variant_option" VALUES ('variant_01KGGXFGH6ZFDFS6JMG05ST45Y', 'optval_01KGGVKMW1D8YETSGN58EB0AYB');

-- ----------------------------
-- Table structure for product_variant_price_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_variant_price_set";
CREATE TABLE "public"."product_variant_price_set" (
  "variant_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "price_set_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_variant_price_set
-- ----------------------------
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4B64H7966S0ER07NSH', 'pset_01KGH9CW6EVE1JRRK4NABQGHRB', 'pvps_01KGH9CW7T88DQDW796X5V5K8H', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4B0JQNYJAT3W484MBM', 'pset_01KGH9CW6E34C7JY7Q2C1KEWEV', 'pvps_01KGH9CW7T8CA372MEXWFG6QFZ', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4B9127NWXF48KNNK8D', 'pset_01KGH9CW6F74SMXPJTBJDRXR53', 'pvps_01KGH9CW7TZTX6N33H7X2N6QEF', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4B1HDWK5896J9MN2PW', 'pset_01KGH9CW6FDP7C5M601DVDFFMH', 'pvps_01KGH9CW7TXHQBG9269PGH5NDV', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4C44SS7BTK7BPG4MR3', 'pset_01KGH9CW6F1NK2D1JA9VE0HKF0', 'pvps_01KGH9CW7TQ45ZMGNB9Y8NMW6W', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CB886Z278818GW44T', 'pset_01KGH9CW6G86WNT1SB7D90Z0ZR', 'pvps_01KGH9CW7TC0KBQJ10RQ21BJRY', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CJR2AXN9BTQEY7AWT', 'pset_01KGH9CW6G70H3YBCZZ202P97G', 'pvps_01KGH9CW7TMWGQ099RCJK3T9PN', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CRBPM5NKVVV904CKE', 'pset_01KGH9CW6HV08QVWXMKVEC3PCA', 'pvps_01KGH9CW7TPD9SCFYBPSQ7NJJ8', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CSMCTECNTJV19TCT4', 'pset_01KGH9CW6JDXV1HRPDPMBSKPFQ', 'pvps_01KGH9CW7T5WEPMRZFGK450HVM', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4C0N57SATKAJ728TNV', 'pset_01KGH9CW6MQMA2Y7G86NQQA2SE', 'pvps_01KGH9CW7TM4HVBWJ985RWR171', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CG8AT0WVPHV5D591N', 'pset_01KGH9CW6N6Y2H9TXRG0QAFHQ3', 'pvps_01KGH9CW7TPBCJDNWAT1411DFE', '2026-02-03 15:20:10.616876+07', '2026-02-03 15:20:10.616876+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW49W0ZN1GSDTCA6BWMS', 'pset_01KGH9CW6B2NQ4TSR756A2MHMW', 'pvps_01KGH9CW7SJPRCX1E7HYRV68GD', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:07.376+07', '2026-02-03 10:48:07.374+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4A5506P7WJ1F9JW8TJ', 'pset_01KGH9CW6CQ7AZSXVDVZW4SWM6', 'pvps_01KGH9CW7SXHVE9AGSB9V35Q3E', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:11.117+07', '2026-02-03 10:48:11.116+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4A6SX0M5PXQJC6R7K5', 'pset_01KGH9CW6DAF63N0KRT5DV4EWS', 'pvps_01KGH9CW7SDNQC8VV0HRMZ7FRR', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:14.135+07', '2026-02-03 10:48:14.135+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4AKS5WCGZ1S0QQKD4H', 'pset_01KGH9CW6CWWBQF15VQS1R38E8', 'pvps_01KGH9CW7SMAMYWDNM5VAV5T50', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:17.108+07', '2026-02-03 10:48:17.107+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4AKXG5E8HYKQ3XTG82', 'pset_01KGH9CW6D9H11ACWMRDGNRM7V', 'pvps_01KGH9CW7SEHRVN2M18WEE1PND', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:19.974+07', '2026-02-03 10:48:19.974+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4AW6NC880ETD3Y2BV8', 'pset_01KGH9CW6B24A5F8DE84X1G6EC', 'pvps_01KGH9CW7SP8V9T2TVYBW1TB2H', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:24.02+07', '2026-02-03 10:48:24.02+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4B7XZM2TGXKT40M4Z7', 'pset_01KGH9CW6E1FM53Z1NFJSDY642', 'pvps_01KGH9CW7TPK0BHQ4B79JHEBF3', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:27.117+07', '2026-02-03 10:48:27.117+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4BFAGKV727PB2TGE1E', 'pset_01KGH9CW6DYZ5SBPT9N39ZT5QG', 'pvps_01KGH9CW7SH3FV36HNST0AGRWD', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:48:30.334+07', '2026-02-03 10:48:30.334+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGH9CW4CTCW17YXNHAEYTHRE', 'pset_01KGH9CW6F2338TBN2BXX66M9D', 'pvps_01KGH9CW7TBVQQGDPJ06MG4H3J', '2026-02-03 15:20:10.616876+07', '2026-02-03 10:56:49.514+07', '2026-02-03 10:56:49.514+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGVRVSQPAT4DV0TE61ZNRHD', 'pset_01KGGVRVVTGFV1V4B1XH5S254V', 'pvps_01KGGVRVX1N0XM8H50TWGBRN7M', '2026-02-03 11:22:03.42459+07', '2026-02-03 11:22:03.42459+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGV0FRY5N88Z6B3WZX1K0FN', 'pset_01KGGV0FTNXR0SG8P813B133CK', 'pvps_01KGGV0FW41C7D5P5MK293VW37', '2026-02-03 11:08:44.675265+07', '2026-02-03 11:23:01.037+07', '2026-02-03 11:23:01.036+07');
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGWV3FE2PWAZXNPXECQW3EZ', 'pset_01KGGWV3J8CWD7CWY04JP61Q41', 'pvps_01KGGWV3KEH0Q5RFP9SCRTE22T', '2026-02-03 11:40:45.422319+07', '2026-02-03 11:40:45.422319+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGX112XFDWCQQ5MHQ7EHA9T', 'pset_01KGGX114V7EYN4ZMM3M0SBF2R', 'pvps_01KGGX115N18DCVBBB7JB3FYXS', '2026-02-03 11:43:59.540059+07', '2026-02-03 11:43:59.540059+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGX56WAEVMET9KPE4R9BQ38', 'pset_01KGGX56YTF02MZX99YFKDEYBW', 'pvps_01KGGX56ZZ58V6GH26HE38RHYB', '2026-02-03 11:46:16.574571+07', '2026-02-03 11:46:16.574571+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGXCE6XF4Z5PF25P0DF5T9T', 'pset_01KGGXCEBG4JN1GF1FVNN0JPNT', 'pvps_01KGGXCECTC0P7V4762VD6AWSG', '2026-02-03 11:50:13.531224+07', '2026-02-03 11:50:13.531224+07', NULL);
INSERT INTO "public"."product_variant_price_set" VALUES ('variant_01KGGXFGH6ZFDFS6JMG05ST45Y', 'pset_01KGGXFGM9RVPCZX11P5JX3GBP', 'pvps_01KGGXFGNRF5NYPGBYKJ54HADK', '2026-02-03 11:51:54.167887+07', '2026-02-03 11:51:54.167887+07', NULL);

-- ----------------------------
-- Table structure for product_variant_product_image
-- ----------------------------
DROP TABLE IF EXISTS "public"."product_variant_product_image";
CREATE TABLE "public"."product_variant_product_image" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "variant_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "image_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of product_variant_product_image
-- ----------------------------
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGWM4K5JFWZ248RQJNACK6K', 'variant_01KGGVRVSQPAT4DV0TE61ZNRHD', 'z5l4na', '2026-02-03 11:36:57.062+07', '2026-02-03 11:36:57.062+07', NULL);
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGWX16GQGXZFZXQMZ4ABSHK', 'variant_01KGGWV3FE2PWAZXNPXECQW3EZ', 'r37kq', '2026-02-03 11:41:48.497+07', '2026-02-03 11:41:48.497+07', NULL);
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGX1WJ5M03B1V02FZ3KQTKH', 'variant_01KGGX112XFDWCQQ5MHQ7EHA9T', '2e9t1n', '2026-02-03 11:44:27.589+07', '2026-02-03 11:44:27.589+07', NULL);
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGX5ZHDC0FTGGQFHNTAZV58', 'variant_01KGGX56WAEVMET9KPE4R9BQ38', 'r37kq', '2026-02-03 11:46:41.71+07', '2026-02-03 11:46:41.71+07', NULL);
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGXD8V6F58ZPTB14B68W2Q6', 'variant_01KGGXCE6XF4Z5PF25P0DF5T9T', 'us4u6', '2026-02-03 11:50:40.615+07', '2026-02-03 11:50:40.615+07', NULL);
INSERT INTO "public"."product_variant_product_image" VALUES ('pvpi_01KGGXGN78JBKZR7R4WVB07HYS', 'variant_01KGGXFGH6ZFDFS6JMG05ST45Y', '6lb3qr', '2026-02-03 11:52:31.592+07', '2026-02-03 11:52:31.592+07', NULL);

-- ----------------------------
-- Table structure for promotion
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion";
CREATE TABLE "public"."promotion" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_id" text COLLATE "pg_catalog"."default",
  "is_automatic" bool NOT NULL DEFAULT false,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'draft'::text,
  "is_tax_inclusive" bool NOT NULL DEFAULT false,
  "limit" int4,
  "used" int4 NOT NULL DEFAULT 0,
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of promotion
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_application_method
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_application_method";
CREATE TABLE "public"."promotion_application_method" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" numeric,
  "raw_value" jsonb,
  "max_quantity" int4,
  "apply_to_quantity" int4,
  "buy_rules_min_quantity" int4,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "target_type" text COLLATE "pg_catalog"."default" NOT NULL,
  "allocation" text COLLATE "pg_catalog"."default",
  "promotion_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "currency_code" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of promotion_application_method
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_campaign
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_campaign";
CREATE TABLE "public"."promotion_campaign" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "campaign_identifier" text COLLATE "pg_catalog"."default" NOT NULL,
  "starts_at" timestamptz(6),
  "ends_at" timestamptz(6),
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of promotion_campaign
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_campaign_budget
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_campaign_budget";
CREATE TABLE "public"."promotion_campaign_budget" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "campaign_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "limit" numeric,
  "raw_limit" jsonb,
  "used" numeric NOT NULL DEFAULT 0,
  "raw_used" jsonb NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "currency_code" text COLLATE "pg_catalog"."default",
  "attribute" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of promotion_campaign_budget
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_campaign_budget_usage
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_campaign_budget_usage";
CREATE TABLE "public"."promotion_campaign_budget_usage" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "attribute_value" text COLLATE "pg_catalog"."default" NOT NULL,
  "used" numeric NOT NULL DEFAULT 0,
  "budget_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "raw_used" jsonb NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of promotion_campaign_budget_usage
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_promotion_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_promotion_rule";
CREATE TABLE "public"."promotion_promotion_rule" (
  "promotion_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_rule_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of promotion_promotion_rule
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_rule";
CREATE TABLE "public"."promotion_rule" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "attribute" text COLLATE "pg_catalog"."default" NOT NULL,
  "operator" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of promotion_rule
-- ----------------------------

-- ----------------------------
-- Table structure for promotion_rule_value
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotion_rule_value";
CREATE TABLE "public"."promotion_rule_value" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "promotion_rule_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of promotion_rule_value
-- ----------------------------

-- ----------------------------
-- Table structure for provider_identity
-- ----------------------------
DROP TABLE IF EXISTS "public"."provider_identity";
CREATE TABLE "public"."provider_identity" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "entity_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "provider" text COLLATE "pg_catalog"."default" NOT NULL,
  "auth_identity_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "user_metadata" jsonb,
  "provider_metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of provider_identity
-- ----------------------------
INSERT INTO "public"."provider_identity" VALUES ('01KGHB0RGGX8AHZ7Z03BSZ9ER8', 'cristminix@gmail.com', 'emailpass', 'authid_01KGHB0RGJZNXSYYHE1CQTT5A5', NULL, '{"password": "c2NyeXB0AA8AAAAIAAAAAQVZEzd2UABAIcxRG0ZfaFYgs3fwNZvn+Nwp9BiU5oaZNtrTVjgMLy1iykzYBtheS3JThYKjPNb0ct/+NfH+M394C7DYqmsZ1+MhgQdTRowb"}', '2026-02-03 15:48:30.74+07', '2026-02-03 15:48:30.74+07', NULL);

-- ----------------------------
-- Table structure for publishable_api_key_sales_channel
-- ----------------------------
DROP TABLE IF EXISTS "public"."publishable_api_key_sales_channel";
CREATE TABLE "public"."publishable_api_key_sales_channel" (
  "publishable_key_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sales_channel_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of publishable_api_key_sales_channel
-- ----------------------------
INSERT INTO "public"."publishable_api_key_sales_channel" VALUES ('apk_01KGH9CNXSAB7F4FDPV3ZGB8BP', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'pksc_01KGH9CVZGD9SYAPFZQH5Z5SXV', '2026-02-03 15:20:04.173395+07', '2026-02-03 15:20:04.173395+07', NULL);

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS "public"."refund";
CREATE TABLE "public"."refund" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "amount" numeric NOT NULL,
  "raw_amount" jsonb NOT NULL,
  "payment_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "refund_reason_id" text COLLATE "pg_catalog"."default",
  "note" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of refund
-- ----------------------------

-- ----------------------------
-- Table structure for refund_reason
-- ----------------------------
DROP TABLE IF EXISTS "public"."refund_reason";
CREATE TABLE "public"."refund_reason" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "label" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "code" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of refund_reason
-- ----------------------------
INSERT INTO "public"."refund_reason" VALUES ('refr_01KGH9C606XESHM2VN9DKP0QRP', 'Shipping Issue', 'Refund due to lost, delayed, or misdelivered shipment', NULL, '2026-02-03 15:19:47.618645+07', '2026-02-03 15:19:47.618645+07', NULL, 'shipping_issue');
INSERT INTO "public"."refund_reason" VALUES ('refr_01KGH9C6071SQ3WFTJR45W0K9P', 'Customer Care Adjustment', 'Refund given as goodwill or compensation for inconvenience', NULL, '2026-02-03 15:19:47.618645+07', '2026-02-03 15:19:47.618645+07', NULL, 'customer_care_adjustment');
INSERT INTO "public"."refund_reason" VALUES ('refr_01KGH9C607XMHQN70B6X99MHES', 'Pricing Error', 'Refund to correct an overcharge, missing discount, or incorrect price', NULL, '2026-02-03 15:19:47.618645+07', '2026-02-03 15:19:47.618645+07', NULL, 'pricing_error');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS "public"."region";
CREATE TABLE "public"."region" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "automatic_taxes" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO "public"."region" VALUES ('reg_01KGH9CVN8WM0RFYW96DMXV1HW', 'Asia', 'idr', NULL, '2026-02-03 15:20:10.039+07', '2026-02-03 15:55:57.938+07', NULL, 't');

-- ----------------------------
-- Table structure for region_country
-- ----------------------------
DROP TABLE IF EXISTS "public"."region_country";
CREATE TABLE "public"."region_country" (
  "iso_2" text COLLATE "pg_catalog"."default" NOT NULL,
  "iso_3" text COLLATE "pg_catalog"."default" NOT NULL,
  "num_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "display_name" text COLLATE "pg_catalog"."default" NOT NULL,
  "region_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of region_country
-- ----------------------------
INSERT INTO "public"."region_country" VALUES ('af', 'afg', '004', 'AFGHANISTAN', 'Afghanistan', NULL, NULL, '2026-02-03 15:19:55.825+07', '2026-02-03 15:19:55.825+07', NULL);
INSERT INTO "public"."region_country" VALUES ('al', 'alb', '008', 'ALBANIA', 'Albania', NULL, NULL, '2026-02-03 15:19:55.826+07', '2026-02-03 15:19:55.826+07', NULL);
INSERT INTO "public"."region_country" VALUES ('dz', 'dza', '012', 'ALGERIA', 'Algeria', NULL, NULL, '2026-02-03 15:19:55.826+07', '2026-02-03 15:19:55.826+07', NULL);
INSERT INTO "public"."region_country" VALUES ('as', 'asm', '016', 'AMERICAN SAMOA', 'American Samoa', NULL, NULL, '2026-02-03 15:19:55.826+07', '2026-02-03 15:19:55.826+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ad', 'and', '020', 'ANDORRA', 'Andorra', NULL, NULL, '2026-02-03 15:19:55.826+07', '2026-02-03 15:19:55.826+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ao', 'ago', '024', 'ANGOLA', 'Angola', NULL, NULL, '2026-02-03 15:19:55.826+07', '2026-02-03 15:19:55.826+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ai', 'aia', '660', 'ANGUILLA', 'Anguilla', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('aq', 'ata', '010', 'ANTARCTICA', 'Antarctica', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ag', 'atg', '028', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ar', 'arg', '032', 'ARGENTINA', 'Argentina', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('am', 'arm', '051', 'ARMENIA', 'Armenia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('aw', 'abw', '533', 'ARUBA', 'Aruba', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('au', 'aus', '036', 'AUSTRALIA', 'Australia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('at', 'aut', '040', 'AUSTRIA', 'Austria', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('az', 'aze', '031', 'AZERBAIJAN', 'Azerbaijan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bs', 'bhs', '044', 'BAHAMAS', 'Bahamas', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bh', 'bhr', '048', 'BAHRAIN', 'Bahrain', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bd', 'bgd', '050', 'BANGLADESH', 'Bangladesh', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bb', 'brb', '052', 'BARBADOS', 'Barbados', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('by', 'blr', '112', 'BELARUS', 'Belarus', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('be', 'bel', '056', 'BELGIUM', 'Belgium', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bz', 'blz', '084', 'BELIZE', 'Belize', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bj', 'ben', '204', 'BENIN', 'Benin', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bm', 'bmu', '060', 'BERMUDA', 'Bermuda', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bt', 'btn', '064', 'BHUTAN', 'Bhutan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bo', 'bol', '068', 'BOLIVIA', 'Bolivia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bq', 'bes', '535', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ba', 'bih', '070', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bw', 'bwa', '072', 'BOTSWANA', 'Botswana', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bv', 'bvd', '074', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('br', 'bra', '076', 'BRAZIL', 'Brazil', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('io', 'iot', '086', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bn', 'brn', '096', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bg', 'bgr', '100', 'BULGARIA', 'Bulgaria', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bf', 'bfa', '854', 'BURKINA FASO', 'Burkina Faso', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bi', 'bdi', '108', 'BURUNDI', 'Burundi', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kh', 'khm', '116', 'CAMBODIA', 'Cambodia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cm', 'cmr', '120', 'CAMEROON', 'Cameroon', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ca', 'can', '124', 'CANADA', 'Canada', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cv', 'cpv', '132', 'CAPE VERDE', 'Cape Verde', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ky', 'cym', '136', 'CAYMAN ISLANDS', 'Cayman Islands', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cf', 'caf', '140', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('td', 'tcd', '148', 'CHAD', 'Chad', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cl', 'chl', '152', 'CHILE', 'Chile', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cn', 'chn', '156', 'CHINA', 'China', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cx', 'cxr', '162', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cc', 'cck', '166', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('co', 'col', '170', 'COLOMBIA', 'Colombia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('km', 'com', '174', 'COMOROS', 'Comoros', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cg', 'cog', '178', 'CONGO', 'Congo', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cd', 'cod', '180', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ck', 'cok', '184', 'COOK ISLANDS', 'Cook Islands', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cr', 'cri', '188', 'COSTA RICA', 'Costa Rica', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ci', 'civ', '384', 'COTE D''IVOIRE', 'Cote D''Ivoire', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('hr', 'hrv', '191', 'CROATIA', 'Croatia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cu', 'cub', '192', 'CUBA', 'Cuba', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cw', 'cuw', '531', 'CURAÇAO', 'Curaçao', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cy', 'cyp', '196', 'CYPRUS', 'Cyprus', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('cz', 'cze', '203', 'CZECH REPUBLIC', 'Czech Republic', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('dj', 'dji', '262', 'DJIBOUTI', 'Djibouti', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('dm', 'dma', '212', 'DOMINICA', 'Dominica', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('do', 'dom', '214', 'DOMINICAN REPUBLIC', 'Dominican Republic', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ec', 'ecu', '218', 'ECUADOR', 'Ecuador', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('eg', 'egy', '818', 'EGYPT', 'Egypt', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sv', 'slv', '222', 'EL SALVADOR', 'El Salvador', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gq', 'gnq', '226', 'EQUATORIAL GUINEA', 'Equatorial Guinea', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('er', 'eri', '232', 'ERITREA', 'Eritrea', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ee', 'est', '233', 'ESTONIA', 'Estonia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('et', 'eth', '231', 'ETHIOPIA', 'Ethiopia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fk', 'flk', '238', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fo', 'fro', '234', 'FAROE ISLANDS', 'Faroe Islands', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fj', 'fji', '242', 'FIJI', 'Fiji', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fi', 'fin', '246', 'FINLAND', 'Finland', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gf', 'guf', '254', 'FRENCH GUIANA', 'French Guiana', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pf', 'pyf', '258', 'FRENCH POLYNESIA', 'French Polynesia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tf', 'atf', '260', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ga', 'gab', '266', 'GABON', 'Gabon', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gm', 'gmb', '270', 'GAMBIA', 'Gambia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ge', 'geo', '268', 'GEORGIA', 'Georgia', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gh', 'gha', '288', 'GHANA', 'Ghana', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gi', 'gib', '292', 'GIBRALTAR', 'Gibraltar', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gr', 'grc', '300', 'GREECE', 'Greece', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gl', 'grl', '304', 'GREENLAND', 'Greenland', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gd', 'grd', '308', 'GRENADA', 'Grenada', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gp', 'glp', '312', 'GUADELOUPE', 'Guadeloupe', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gu', 'gum', '316', 'GUAM', 'Guam', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gt', 'gtm', '320', 'GUATEMALA', 'Guatemala', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gg', 'ggy', '831', 'GUERNSEY', 'Guernsey', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gn', 'gin', '324', 'GUINEA', 'Guinea', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gw', 'gnb', '624', 'GUINEA-BISSAU', 'Guinea-Bissau', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gy', 'guy', '328', 'GUYANA', 'Guyana', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ht', 'hti', '332', 'HAITI', 'Haiti', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('hm', 'hmd', '334', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island And Mcdonald Islands', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('va', 'vat', '336', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('hn', 'hnd', '340', 'HONDURAS', 'Honduras', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('hk', 'hkg', '344', 'HONG KONG', 'Hong Kong', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('hu', 'hun', '348', 'HUNGARY', 'Hungary', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('is', 'isl', '352', 'ICELAND', 'Iceland', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('in', 'ind', '356', 'INDIA', 'India', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ir', 'irn', '364', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('iq', 'irq', '368', 'IRAQ', 'Iraq', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ie', 'irl', '372', 'IRELAND', 'Ireland', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('im', 'imn', '833', 'ISLE OF MAN', 'Isle Of Man', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('il', 'isr', '376', 'ISRAEL', 'Israel', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('jm', 'jam', '388', 'JAMAICA', 'Jamaica', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('jp', 'jpn', '392', 'JAPAN', 'Japan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('je', 'jey', '832', 'JERSEY', 'Jersey', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('jo', 'jor', '400', 'JORDAN', 'Jordan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kz', 'kaz', '398', 'KAZAKHSTAN', 'Kazakhstan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ke', 'ken', '404', 'KENYA', 'Kenya', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ki', 'kir', '296', 'KIRIBATI', 'Kiribati', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kp', 'prk', '408', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kr', 'kor', '410', 'KOREA, REPUBLIC OF', 'Korea, Republic of', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('xk', 'xkx', '900', 'KOSOVO', 'Kosovo', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kw', 'kwt', '414', 'KUWAIT', 'Kuwait', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kg', 'kgz', '417', 'KYRGYZSTAN', 'Kyrgyzstan', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:19:55.827+07', NULL);
INSERT INTO "public"."region_country" VALUES ('la', 'lao', '418', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lv', 'lva', '428', 'LATVIA', 'Latvia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lb', 'lbn', '422', 'LEBANON', 'Lebanon', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ls', 'lso', '426', 'LESOTHO', 'Lesotho', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lr', 'lbr', '430', 'LIBERIA', 'Liberia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ly', 'lby', '434', 'LIBYA', 'Libya', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('li', 'lie', '438', 'LIECHTENSTEIN', 'Liechtenstein', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lt', 'ltu', '440', 'LITHUANIA', 'Lithuania', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lu', 'lux', '442', 'LUXEMBOURG', 'Luxembourg', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mo', 'mac', '446', 'MACAO', 'Macao', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mg', 'mdg', '450', 'MADAGASCAR', 'Madagascar', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mw', 'mwi', '454', 'MALAWI', 'Malawi', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('my', 'mys', '458', 'MALAYSIA', 'Malaysia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mv', 'mdv', '462', 'MALDIVES', 'Maldives', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ml', 'mli', '466', 'MALI', 'Mali', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mt', 'mlt', '470', 'MALTA', 'Malta', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mh', 'mhl', '584', 'MARSHALL ISLANDS', 'Marshall Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mq', 'mtq', '474', 'MARTINIQUE', 'Martinique', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mr', 'mrt', '478', 'MAURITANIA', 'Mauritania', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mu', 'mus', '480', 'MAURITIUS', 'Mauritius', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('yt', 'myt', '175', 'MAYOTTE', 'Mayotte', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mx', 'mex', '484', 'MEXICO', 'Mexico', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fm', 'fsm', '583', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('md', 'mda', '498', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mc', 'mco', '492', 'MONACO', 'Monaco', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mn', 'mng', '496', 'MONGOLIA', 'Mongolia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('me', 'mne', '499', 'MONTENEGRO', 'Montenegro', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ms', 'msr', '500', 'MONTSERRAT', 'Montserrat', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ma', 'mar', '504', 'MOROCCO', 'Morocco', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mz', 'moz', '508', 'MOZAMBIQUE', 'Mozambique', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mm', 'mmr', '104', 'MYANMAR', 'Myanmar', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('na', 'nam', '516', 'NAMIBIA', 'Namibia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nr', 'nru', '520', 'NAURU', 'Nauru', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('np', 'npl', '524', 'NEPAL', 'Nepal', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nl', 'nld', '528', 'NETHERLANDS', 'Netherlands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nc', 'ncl', '540', 'NEW CALEDONIA', 'New Caledonia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nz', 'nzl', '554', 'NEW ZEALAND', 'New Zealand', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ni', 'nic', '558', 'NICARAGUA', 'Nicaragua', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ne', 'ner', '562', 'NIGER', 'Niger', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ng', 'nga', '566', 'NIGERIA', 'Nigeria', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nu', 'niu', '570', 'NIUE', 'Niue', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('nf', 'nfk', '574', 'NORFOLK ISLAND', 'Norfolk Island', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mk', 'mkd', '807', 'NORTH MACEDONIA', 'North Macedonia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mp', 'mnp', '580', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('no', 'nor', '578', 'NORWAY', 'Norway', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('om', 'omn', '512', 'OMAN', 'Oman', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pk', 'pak', '586', 'PAKISTAN', 'Pakistan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pw', 'plw', '585', 'PALAU', 'Palau', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ps', 'pse', '275', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pa', 'pan', '591', 'PANAMA', 'Panama', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pg', 'png', '598', 'PAPUA NEW GUINEA', 'Papua New Guinea', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('py', 'pry', '600', 'PARAGUAY', 'Paraguay', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pe', 'per', '604', 'PERU', 'Peru', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ph', 'phl', '608', 'PHILIPPINES', 'Philippines', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pn', 'pcn', '612', 'PITCAIRN', 'Pitcairn', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pl', 'pol', '616', 'POLAND', 'Poland', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pt', 'prt', '620', 'PORTUGAL', 'Portugal', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pr', 'pri', '630', 'PUERTO RICO', 'Puerto Rico', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('qa', 'qat', '634', 'QATAR', 'Qatar', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('re', 'reu', '638', 'REUNION', 'Reunion', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ro', 'rom', '642', 'ROMANIA', 'Romania', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ru', 'rus', '643', 'RUSSIAN FEDERATION', 'Russian Federation', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('rw', 'rwa', '646', 'RWANDA', 'Rwanda', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('bl', 'blm', '652', 'SAINT BARTHÉLEMY', 'Saint Barthélemy', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sh', 'shn', '654', 'SAINT HELENA', 'Saint Helena', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('kn', 'kna', '659', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lc', 'lca', '662', 'SAINT LUCIA', 'Saint Lucia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('mf', 'maf', '663', 'SAINT MARTIN (FRENCH PART)', 'Saint Martin (French part)', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('pm', 'spm', '666', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('vc', 'vct', '670', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ws', 'wsm', '882', 'SAMOA', 'Samoa', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sm', 'smr', '674', 'SAN MARINO', 'San Marino', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('st', 'stp', '678', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sa', 'sau', '682', 'SAUDI ARABIA', 'Saudi Arabia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sn', 'sen', '686', 'SENEGAL', 'Senegal', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('rs', 'srb', '688', 'SERBIA', 'Serbia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sc', 'syc', '690', 'SEYCHELLES', 'Seychelles', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sl', 'sle', '694', 'SIERRA LEONE', 'Sierra Leone', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sg', 'sgp', '702', 'SINGAPORE', 'Singapore', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sx', 'sxm', '534', 'SINT MAARTEN', 'Sint Maarten', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sk', 'svk', '703', 'SLOVAKIA', 'Slovakia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('si', 'svn', '705', 'SLOVENIA', 'Slovenia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sb', 'slb', '090', 'SOLOMON ISLANDS', 'Solomon Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('so', 'som', '706', 'SOMALIA', 'Somalia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('za', 'zaf', '710', 'SOUTH AFRICA', 'South Africa', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gs', 'sgs', '239', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ss', 'ssd', '728', 'SOUTH SUDAN', 'South Sudan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('lk', 'lka', '144', 'SRI LANKA', 'Sri Lanka', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sd', 'sdn', '729', 'SUDAN', 'Sudan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sr', 'sur', '740', 'SURINAME', 'Suriname', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sj', 'sjm', '744', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sz', 'swz', '748', 'SWAZILAND', 'Swaziland', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ch', 'che', '756', 'SWITZERLAND', 'Switzerland', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('sy', 'syr', '760', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tw', 'twn', '158', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tj', 'tjk', '762', 'TAJIKISTAN', 'Tajikistan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tz', 'tza', '834', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('th', 'tha', '764', 'THAILAND', 'Thailand', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tl', 'tls', '626', 'TIMOR LESTE', 'Timor Leste', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tg', 'tgo', '768', 'TOGO', 'Togo', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tk', 'tkl', '772', 'TOKELAU', 'Tokelau', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('to', 'ton', '776', 'TONGA', 'Tonga', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tt', 'tto', '780', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tn', 'tun', '788', 'TUNISIA', 'Tunisia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tr', 'tur', '792', 'TURKEY', 'Turkey', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tm', 'tkm', '795', 'TURKMENISTAN', 'Turkmenistan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tc', 'tca', '796', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('tv', 'tuv', '798', 'TUVALU', 'Tuvalu', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ug', 'uga', '800', 'UGANDA', 'Uganda', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ua', 'ukr', '804', 'UKRAINE', 'Ukraine', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ae', 'are', '784', 'UNITED ARAB EMIRATES', 'United Arab Emirates', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('us', 'usa', '840', 'UNITED STATES', 'United States', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('um', 'umi', '581', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('uy', 'ury', '858', 'URUGUAY', 'Uruguay', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('uz', 'uzb', '860', 'UZBEKISTAN', 'Uzbekistan', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('vu', 'vut', '548', 'VANUATU', 'Vanuatu', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ve', 'ven', '862', 'VENEZUELA', 'Venezuela', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('vn', 'vnm', '704', 'VIET NAM', 'Viet Nam', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('vg', 'vgb', '092', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('vi', 'vir', '850', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.S.', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('wf', 'wlf', '876', 'WALLIS AND FUTUNA', 'Wallis and Futuna', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('eh', 'esh', '732', 'WESTERN SAHARA', 'Western Sahara', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ye', 'yem', '887', 'YEMEN', 'Yemen', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('zm', 'zmb', '894', 'ZAMBIA', 'Zambia', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('zw', 'zwe', '716', 'ZIMBABWE', 'Zimbabwe', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('ax', 'ala', '248', 'ÅLAND ISLANDS', 'Åland Islands', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:19:55.828+07', NULL);
INSERT INTO "public"."region_country" VALUES ('fr', 'fra', '250', 'FRANCE', 'France', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:53:21.821+07', NULL);
INSERT INTO "public"."region_country" VALUES ('it', 'ita', '380', 'ITALY', 'Italy', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 15:54:06.959+07', NULL);
INSERT INTO "public"."region_country" VALUES ('es', 'esp', '724', 'SPAIN', 'Spain', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:54:14.859+07', NULL);
INSERT INTO "public"."region_country" VALUES ('dk', 'dnk', '208', 'DENMARK', 'Denmark', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 10:40:30.289+07', NULL);
INSERT INTO "public"."region_country" VALUES ('de', 'deu', '276', 'GERMANY', 'Germany', NULL, NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 10:40:39.431+07', NULL);
INSERT INTO "public"."region_country" VALUES ('gb', 'gbr', '826', 'UNITED KINGDOM', 'United Kingdom', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:53:48.264+07', NULL);
INSERT INTO "public"."region_country" VALUES ('se', 'swe', '752', 'SWEDEN', 'Sweden', NULL, NULL, '2026-02-03 15:19:55.828+07', '2026-02-03 15:53:58.511+07', NULL);
INSERT INTO "public"."region_country" VALUES ('id', 'idn', '360', 'INDONESIA', 'Indonesia', 'reg_01KGH9CVN8WM0RFYW96DMXV1HW', NULL, '2026-02-03 15:19:55.827+07', '2026-02-03 10:40:39.447+07', NULL);

-- ----------------------------
-- Table structure for region_payment_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."region_payment_provider";
CREATE TABLE "public"."region_payment_provider" (
  "region_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "payment_provider_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of region_payment_provider
-- ----------------------------
INSERT INTO "public"."region_payment_provider" VALUES ('reg_01KGH9CVN8WM0RFYW96DMXV1HW', 'pp_system_default', 'regpp_01KGH9CVPMMYZX5BCTP5W7WEBW', '2026-02-03 15:20:10.065474+07', '2026-02-03 15:20:10.065474+07', NULL);

-- ----------------------------
-- Table structure for reservation_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."reservation_item";
CREATE TABLE "public"."reservation_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "line_item_id" text COLLATE "pg_catalog"."default",
  "location_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantity" numeric NOT NULL,
  "external_id" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "created_by" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "inventory_item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "allow_backorder" bool DEFAULT false,
  "raw_quantity" jsonb
)
;

-- ----------------------------
-- Records of reservation_item
-- ----------------------------

-- ----------------------------
-- Table structure for return
-- ----------------------------
DROP TABLE IF EXISTS "public"."return";
CREATE TABLE "public"."return" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "order_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "claim_id" text COLLATE "pg_catalog"."default",
  "exchange_id" text COLLATE "pg_catalog"."default",
  "order_version" int4 NOT NULL,
  "display_id" int4 NOT NULL DEFAULT nextval('return_display_id_seq'::regclass),
  "status" "public"."return_status_enum" NOT NULL DEFAULT 'open'::return_status_enum,
  "no_notification" bool,
  "refund_amount" numeric,
  "raw_refund_amount" jsonb,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "received_at" timestamptz(6),
  "canceled_at" timestamptz(6),
  "location_id" text COLLATE "pg_catalog"."default",
  "requested_at" timestamptz(6),
  "created_by" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of return
-- ----------------------------

-- ----------------------------
-- Table structure for return_fulfillment
-- ----------------------------
DROP TABLE IF EXISTS "public"."return_fulfillment";
CREATE TABLE "public"."return_fulfillment" (
  "return_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fulfillment_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of return_fulfillment
-- ----------------------------

-- ----------------------------
-- Table structure for return_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."return_item";
CREATE TABLE "public"."return_item" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "return_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "reason_id" text COLLATE "pg_catalog"."default",
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "quantity" numeric NOT NULL,
  "raw_quantity" jsonb NOT NULL,
  "received_quantity" numeric NOT NULL DEFAULT 0,
  "raw_received_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb,
  "note" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "damaged_quantity" numeric NOT NULL DEFAULT 0,
  "raw_damaged_quantity" jsonb NOT NULL DEFAULT '{"value": "0", "precision": 20}'::jsonb
)
;

-- ----------------------------
-- Records of return_item
-- ----------------------------

-- ----------------------------
-- Table structure for return_reason
-- ----------------------------
DROP TABLE IF EXISTS "public"."return_reason";
CREATE TABLE "public"."return_reason" (
  "id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "label" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "parent_return_reason_id" varchar COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of return_reason
-- ----------------------------

-- ----------------------------
-- Table structure for sales_channel
-- ----------------------------
DROP TABLE IF EXISTS "public"."sales_channel";
CREATE TABLE "public"."sales_channel" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "is_disabled" bool NOT NULL DEFAULT false,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of sales_channel
-- ----------------------------
INSERT INTO "public"."sales_channel" VALUES ('sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'Default Sales Channel', 'Created by Medusa', 'f', NULL, '2026-02-03 15:20:04.111+07', '2026-02-03 15:20:04.111+07', NULL);

-- ----------------------------
-- Table structure for sales_channel_stock_location
-- ----------------------------
DROP TABLE IF EXISTS "public"."sales_channel_stock_location";
CREATE TABLE "public"."sales_channel_stock_location" (
  "sales_channel_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "stock_location_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of sales_channel_stock_location
-- ----------------------------
INSERT INTO "public"."sales_channel_stock_location" VALUES ('sc_01KGH9CNWF4W5SH7XR1WY45CS8', 'sloc_01KGH9CVQVG2NWRSH88F8HF551', 'scloc_01KGH9CVYSF2NKTGP40KY2T2P4', '2026-02-03 15:20:10.329294+07', '2026-02-03 15:20:10.329294+07', NULL);

-- ----------------------------
-- Table structure for script_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."script_migrations";
CREATE TABLE "public"."script_migrations" (
  "id" int4 NOT NULL DEFAULT nextval('script_migrations_id_seq'::regclass),
  "script_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "finished_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of script_migrations
-- ----------------------------
INSERT INTO "public"."script_migrations" VALUES (1, 'migrate-product-shipping-profile.js', '2026-02-03 15:19:57.740517+07', '2026-02-03 15:19:57.788205+07');
INSERT INTO "public"."script_migrations" VALUES (2, 'migrate-tax-region-provider.js', '2026-02-03 15:19:57.793744+07', '2026-02-03 15:19:57.806063+07');

-- ----------------------------
-- Table structure for service_zone
-- ----------------------------
DROP TABLE IF EXISTS "public"."service_zone";
CREATE TABLE "public"."service_zone" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "fulfillment_set_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of service_zone
-- ----------------------------
INSERT INTO "public"."service_zone" VALUES ('serzo_01KGH9CVS4886QV2REFPZ7SA89', 'Europe', NULL, 'fuset_01KGH9CVS4QD6AVTDSK9Z4XM7F', '2026-02-03 15:20:10.149+07', '2026-02-03 15:20:10.149+07', NULL);

-- ----------------------------
-- Table structure for shipping_option
-- ----------------------------
DROP TABLE IF EXISTS "public"."shipping_option";
CREATE TABLE "public"."shipping_option" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "price_type" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'flat'::text,
  "service_zone_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "shipping_profile_id" text COLLATE "pg_catalog"."default",
  "provider_id" text COLLATE "pg_catalog"."default",
  "data" jsonb,
  "metadata" jsonb,
  "shipping_option_type_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of shipping_option
-- ----------------------------
INSERT INTO "public"."shipping_option" VALUES ('so_01KGH9CVVTK59938KD64Q870M5', 'Standard Shipping', 'flat', 'serzo_01KGH9CVS4886QV2REFPZ7SA89', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'manual_manual', NULL, NULL, 'sotype_01KGH9CVVSZRZE1CJNYA6EA2T1', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);
INSERT INTO "public"."shipping_option" VALUES ('so_01KGH9CVVVTVSV9S2S1WCE0PRY', 'Express Shipping', 'flat', 'serzo_01KGH9CVS4886QV2REFPZ7SA89', 'sp_01KGH9CFPFF69GRANT0R41E8SZ', 'manual_manual', NULL, NULL, 'sotype_01KGH9CVVT8DTPS0YP0VE24AH9', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);

-- ----------------------------
-- Table structure for shipping_option_price_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."shipping_option_price_set";
CREATE TABLE "public"."shipping_option_price_set" (
  "shipping_option_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "price_set_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of shipping_option_price_set
-- ----------------------------
INSERT INTO "public"."shipping_option_price_set" VALUES ('so_01KGH9CVVTK59938KD64Q870M5', 'pset_01KGH9CVWVHR0HR4QM9XYF68MA', 'sops_01KGH9CVYCZ5E7X33V7864B5BX', '2026-02-03 15:20:10.315617+07', '2026-02-03 15:20:10.315617+07', NULL);
INSERT INTO "public"."shipping_option_price_set" VALUES ('so_01KGH9CVVVTVSV9S2S1WCE0PRY', 'pset_01KGH9CVWW7S23PKNDESSTF5EX', 'sops_01KGH9CVYCM0DDBE1803B5TEAX', '2026-02-03 15:20:10.315617+07', '2026-02-03 15:20:10.315617+07', NULL);

-- ----------------------------
-- Table structure for shipping_option_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."shipping_option_rule";
CREATE TABLE "public"."shipping_option_rule" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "attribute" text COLLATE "pg_catalog"."default" NOT NULL,
  "operator" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" jsonb,
  "shipping_option_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of shipping_option_rule
-- ----------------------------
INSERT INTO "public"."shipping_option_rule" VALUES ('sorul_01KGH9CVVT364RBHJKXK63BKEP', 'enabled_in_store', 'eq', '"true"', 'so_01KGH9CVVTK59938KD64Q870M5', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);
INSERT INTO "public"."shipping_option_rule" VALUES ('sorul_01KGH9CVVT37BYYCD2SNXS9Q2Z', 'is_return', 'eq', '"false"', 'so_01KGH9CVVTK59938KD64Q870M5', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);
INSERT INTO "public"."shipping_option_rule" VALUES ('sorul_01KGH9CVVV5T7FG2SD41EMJJ3K', 'enabled_in_store', 'eq', '"true"', 'so_01KGH9CVVVTVSV9S2S1WCE0PRY', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);
INSERT INTO "public"."shipping_option_rule" VALUES ('sorul_01KGH9CVVV3MYZFCC9A1QAPDSR', 'is_return', 'eq', '"false"', 'so_01KGH9CVVVTVSV9S2S1WCE0PRY', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);

-- ----------------------------
-- Table structure for shipping_option_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."shipping_option_type";
CREATE TABLE "public"."shipping_option_type" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "label" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of shipping_option_type
-- ----------------------------
INSERT INTO "public"."shipping_option_type" VALUES ('sotype_01KGH9CVVSZRZE1CJNYA6EA2T1', 'Standard', 'Ship in 2-3 days.', 'standard', '2026-02-03 15:20:10.235+07', '2026-02-03 15:20:10.235+07', NULL);
INSERT INTO "public"."shipping_option_type" VALUES ('sotype_01KGH9CVVT8DTPS0YP0VE24AH9', 'Express', 'Ship in 24 hours.', 'express', '2026-02-03 15:20:10.236+07', '2026-02-03 15:20:10.236+07', NULL);

-- ----------------------------
-- Table structure for shipping_profile
-- ----------------------------
DROP TABLE IF EXISTS "public"."shipping_profile";
CREATE TABLE "public"."shipping_profile" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of shipping_profile
-- ----------------------------
INSERT INTO "public"."shipping_profile" VALUES ('sp_01KGH9CFPFF69GRANT0R41E8SZ', 'Default Shipping Profile', 'default', NULL, '2026-02-03 15:19:57.775+07', '2026-02-03 15:19:57.775+07', NULL);

-- ----------------------------
-- Table structure for stock_location
-- ----------------------------
DROP TABLE IF EXISTS "public"."stock_location";
CREATE TABLE "public"."stock_location" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "address_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of stock_location
-- ----------------------------
INSERT INTO "public"."stock_location" VALUES ('sloc_01KGH9CVQVG2NWRSH88F8HF551', '2026-02-03 15:20:10.108+07', '2026-02-03 15:58:11.901+07', NULL, 'Pawon Factory', 'laddr_01KGH9CVQVBZXNGDHX9FX6JSSS', NULL);

-- ----------------------------
-- Table structure for stock_location_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."stock_location_address";
CREATE TABLE "public"."stock_location_address" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6),
  "address_1" text COLLATE "pg_catalog"."default" NOT NULL,
  "address_2" text COLLATE "pg_catalog"."default",
  "company" text COLLATE "pg_catalog"."default",
  "city" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "phone" text COLLATE "pg_catalog"."default",
  "province" text COLLATE "pg_catalog"."default",
  "postal_code" text COLLATE "pg_catalog"."default",
  "metadata" jsonb
)
;

-- ----------------------------
-- Records of stock_location_address
-- ----------------------------
INSERT INTO "public"."stock_location_address" VALUES ('laddr_01KGH9CVQVBZXNGDHX9FX6JSSS', '2026-02-03 15:20:10.108+07', '2026-02-03 15:58:11.88+07', NULL, 'Jalan Desa Jatake - Babakan Raya 77, RT/RW 007/002, Kampung Jatake, Kecamatan Pagedangan', '', '', 'Tangerang', 'id', '(021) 22354005', '', '15850 ', NULL);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS "public"."store";
CREATE TABLE "public"."store" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'Medusa Store'::text,
  "default_sales_channel_id" text COLLATE "pg_catalog"."default",
  "default_region_id" text COLLATE "pg_catalog"."default",
  "default_location_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO "public"."store" VALUES ('store_01KGH9CNWYF9DVG6M6KNBN19FM', 'Pawon Store', 'sc_01KGH9CNWF4W5SH7XR1WY45CS8', NULL, 'sloc_01KGH9CVQVG2NWRSH88F8HF551', NULL, '2026-02-03 15:20:04.130707+07', '2026-02-03 15:20:04.130707+07', NULL);

-- ----------------------------
-- Table structure for store_currency
-- ----------------------------
DROP TABLE IF EXISTS "public"."store_currency";
CREATE TABLE "public"."store_currency" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "currency_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_default" bool NOT NULL DEFAULT false,
  "store_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of store_currency
-- ----------------------------
INSERT INTO "public"."store_currency" VALUES ('stocur_01KGGSBKT549PMQW9GWWGDVENJ', 'idr', 't', 'store_01KGH9CNWYF9DVG6M6KNBN19FM', '2026-02-03 10:39:51.998508+07', '2026-02-03 10:39:51.998508+07', NULL);

-- ----------------------------
-- Table structure for store_locale
-- ----------------------------
DROP TABLE IF EXISTS "public"."store_locale";
CREATE TABLE "public"."store_locale" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "locale_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "store_id" text COLLATE "pg_catalog"."default",
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of store_locale
-- ----------------------------

-- ----------------------------
-- Table structure for tax_provider
-- ----------------------------
DROP TABLE IF EXISTS "public"."tax_provider";
CREATE TABLE "public"."tax_provider" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_enabled" bool NOT NULL DEFAULT true,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of tax_provider
-- ----------------------------
INSERT INTO "public"."tax_provider" VALUES ('tp_system', 't', '2026-02-03 15:19:55.892+07', '2026-02-03 15:19:55.892+07', NULL);

-- ----------------------------
-- Table structure for tax_rate
-- ----------------------------
DROP TABLE IF EXISTS "public"."tax_rate";
CREATE TABLE "public"."tax_rate" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "rate" float4,
  "code" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "is_default" bool NOT NULL DEFAULT false,
  "is_combinable" bool NOT NULL DEFAULT false,
  "tax_region_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "created_by" text COLLATE "pg_catalog"."default",
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of tax_rate
-- ----------------------------

-- ----------------------------
-- Table structure for tax_rate_rule
-- ----------------------------
DROP TABLE IF EXISTS "public"."tax_rate_rule";
CREATE TABLE "public"."tax_rate_rule" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "tax_rate_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "reference_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "reference" text COLLATE "pg_catalog"."default" NOT NULL,
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "created_by" text COLLATE "pg_catalog"."default",
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of tax_rate_rule
-- ----------------------------

-- ----------------------------
-- Table structure for tax_region
-- ----------------------------
DROP TABLE IF EXISTS "public"."tax_region";
CREATE TABLE "public"."tax_region" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "provider_id" text COLLATE "pg_catalog"."default",
  "country_code" text COLLATE "pg_catalog"."default" NOT NULL,
  "province_code" text COLLATE "pg_catalog"."default",
  "parent_id" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "created_by" text COLLATE "pg_catalog"."default",
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of tax_region
-- ----------------------------
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ68SEC0P565DZ8917E', 'tp_system', 'gb', NULL, NULL, NULL, '2026-02-03 15:20:10.088+07', '2026-02-03 15:20:10.088+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ7CWSA3T14FE8QS78G', 'tp_system', 'de', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ7ZVKHV4ENF0K8X2XP', 'tp_system', 'dk', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ7NHMP663G6589H9WQ', 'tp_system', 'se', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ7791NKJ39M5EMK1NR', 'tp_system', 'fr', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ73H971B3BP3GTGT2D', 'tp_system', 'es', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);
INSERT INTO "public"."tax_region" VALUES ('txreg_01KGH9CVQ82SGYR6CHAHQY9X39', 'tp_system', 'it', NULL, NULL, NULL, '2026-02-03 15:20:10.089+07', '2026-02-03 15:20:10.089+07', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "first_name" text COLLATE "pg_catalog"."default",
  "last_name" text COLLATE "pg_catalog"."default",
  "email" text COLLATE "pg_catalog"."default" NOT NULL,
  "avatar_url" text COLLATE "pg_catalog"."default",
  "metadata" jsonb,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES ('user_01KGHB0RKENB87PPDE870FQMKH', 'Putra', 'Budiman', 'cristminix@gmail.com', NULL, NULL, '2026-02-03 15:48:30.83+07', '2026-02-03 15:48:30.83+07', NULL);

-- ----------------------------
-- Table structure for user_preference
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_preference";
CREATE TABLE "public"."user_preference" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "key" text COLLATE "pg_catalog"."default" NOT NULL,
  "value" jsonb NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of user_preference
-- ----------------------------

-- ----------------------------
-- Table structure for user_rbac_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_rbac_role";
CREATE TABLE "public"."user_rbac_role" (
  "user_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "rbac_role_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of user_rbac_role
-- ----------------------------

-- ----------------------------
-- Table structure for view_configuration
-- ----------------------------
DROP TABLE IF EXISTS "public"."view_configuration";
CREATE TABLE "public"."view_configuration" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "entity" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default",
  "user_id" text COLLATE "pg_catalog"."default",
  "is_system_default" bool NOT NULL DEFAULT false,
  "configuration" jsonb NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT now(),
  "updated_at" timestamptz(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of view_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for workflow_execution
-- ----------------------------
DROP TABLE IF EXISTS "public"."workflow_execution";
CREATE TABLE "public"."workflow_execution" (
  "id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "workflow_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "transaction_id" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "execution" jsonb,
  "context" jsonb,
  "state" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "deleted_at" timestamp(6),
  "retention_time" int4,
  "run_id" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT '01KGH9C838EM4RKS8Q2SEY6G39'::text
)
;

-- ----------------------------
-- Records of workflow_execution
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."link_module_migrations_id_seq"
OWNED BY "public"."link_module_migrations"."id";
SELECT setval('"public"."link_module_migrations_id_seq"', 19, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."mikro_orm_migrations_id_seq"
OWNED BY "public"."mikro_orm_migrations"."id";
SELECT setval('"public"."mikro_orm_migrations_id_seq"', 156, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_change_action_ordering_seq"
OWNED BY "public"."order_change_action"."ordering";
SELECT setval('"public"."order_change_action_ordering_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_claim_display_id_seq"
OWNED BY "public"."order_claim"."display_id";
SELECT setval('"public"."order_claim_display_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_display_id_seq"
OWNED BY "public"."order"."display_id";
SELECT setval('"public"."order_display_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_exchange_display_id_seq"
OWNED BY "public"."order_exchange"."display_id";
SELECT setval('"public"."order_exchange_display_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."return_display_id_seq"
OWNED BY "public"."return"."display_id";
SELECT setval('"public"."return_display_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."script_migrations_id_seq"
OWNED BY "public"."script_migrations"."id";
SELECT setval('"public"."script_migrations_id_seq"', 2, true);

-- ----------------------------
-- Indexes structure for table account_holder
-- ----------------------------
CREATE INDEX "IDX_account_holder_deleted_at" ON "public"."account_holder" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_account_holder_provider_id_external_id_unique" ON "public"."account_holder" USING btree (
  "provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "external_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table account_holder
-- ----------------------------
ALTER TABLE "public"."account_holder" ADD CONSTRAINT "account_holder_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table api_key
-- ----------------------------
CREATE INDEX "IDX_api_key_deleted_at" ON "public"."api_key" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_api_key_redacted" ON "public"."api_key" USING btree (
  "redacted" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_api_key_revoked_at" ON "public"."api_key" USING btree (
  "revoked_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_api_key_token_unique" ON "public"."api_key" USING btree (
  "token" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_api_key_type" ON "public"."api_key" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table api_key
-- ----------------------------
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_type_check" CHECK (type = ANY (ARRAY['publishable'::text, 'secret'::text]));

-- ----------------------------
-- Primary Key structure for table api_key
-- ----------------------------
ALTER TABLE "public"."api_key" ADD CONSTRAINT "api_key_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table application_method_buy_rules
-- ----------------------------
ALTER TABLE "public"."application_method_buy_rules" ADD CONSTRAINT "application_method_buy_rules_pkey" PRIMARY KEY ("application_method_id", "promotion_rule_id");

-- ----------------------------
-- Primary Key structure for table application_method_target_rules
-- ----------------------------
ALTER TABLE "public"."application_method_target_rules" ADD CONSTRAINT "application_method_target_rules_pkey" PRIMARY KEY ("application_method_id", "promotion_rule_id");

-- ----------------------------
-- Indexes structure for table auth_identity
-- ----------------------------
CREATE INDEX "IDX_auth_identity_deleted_at" ON "public"."auth_identity" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table auth_identity
-- ----------------------------
ALTER TABLE "public"."auth_identity" ADD CONSTRAINT "auth_identity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table capture
-- ----------------------------
CREATE INDEX "IDX_capture_deleted_at" ON "public"."capture" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_capture_payment_id" ON "public"."capture" USING btree (
  "payment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table capture
-- ----------------------------
ALTER TABLE "public"."capture" ADD CONSTRAINT "capture_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart
-- ----------------------------
CREATE INDEX "IDX_cart_billing_address_id" ON "public"."cart" USING btree (
  "billing_address_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND billing_address_id IS NOT NULL;
CREATE INDEX "IDX_cart_currency_code" ON "public"."cart" USING btree (
  "currency_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_cart_customer_id" ON "public"."cart" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND customer_id IS NOT NULL;
CREATE INDEX "IDX_cart_deleted_at" ON "public"."cart" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_cart_region_id" ON "public"."cart" USING btree (
  "region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND region_id IS NOT NULL;
CREATE INDEX "IDX_cart_sales_channel_id" ON "public"."cart" USING btree (
  "sales_channel_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND sales_channel_id IS NOT NULL;
CREATE INDEX "IDX_cart_shipping_address_id" ON "public"."cart" USING btree (
  "shipping_address_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND shipping_address_id IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table cart
-- ----------------------------
ALTER TABLE "public"."cart" ADD CONSTRAINT "cart_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_address
-- ----------------------------
CREATE INDEX "IDX_cart_address_deleted_at" ON "public"."cart_address" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table cart_address
-- ----------------------------
ALTER TABLE "public"."cart_address" ADD CONSTRAINT "cart_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_line_item
-- ----------------------------
CREATE INDEX "IDX_cart_line_item_cart_id" ON "public"."cart_line_item" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_cart_line_item_deleted_at" ON "public"."cart_line_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_line_item_product_id" ON "public"."cart_line_item" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND product_id IS NOT NULL;
CREATE INDEX "IDX_line_item_variant_id" ON "public"."cart_line_item" USING btree (
  "variant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND variant_id IS NOT NULL;

-- ----------------------------
-- Checks structure for table cart_line_item
-- ----------------------------
ALTER TABLE "public"."cart_line_item" ADD CONSTRAINT "cart_line_item_unit_price_check" CHECK (unit_price >= 0::numeric);

-- ----------------------------
-- Primary Key structure for table cart_line_item
-- ----------------------------
ALTER TABLE "public"."cart_line_item" ADD CONSTRAINT "cart_line_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_line_item_adjustment
-- ----------------------------
CREATE INDEX "IDX_cart_line_item_adjustment_deleted_at" ON "public"."cart_line_item_adjustment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_cart_line_item_adjustment_item_id" ON "public"."cart_line_item_adjustment" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_line_item_adjustment_promotion_id" ON "public"."cart_line_item_adjustment" USING btree (
  "promotion_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND promotion_id IS NOT NULL;

-- ----------------------------
-- Checks structure for table cart_line_item_adjustment
-- ----------------------------
ALTER TABLE "public"."cart_line_item_adjustment" ADD CONSTRAINT "cart_line_item_adjustment_check" CHECK (amount >= 0::numeric);

-- ----------------------------
-- Primary Key structure for table cart_line_item_adjustment
-- ----------------------------
ALTER TABLE "public"."cart_line_item_adjustment" ADD CONSTRAINT "cart_line_item_adjustment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_line_item_tax_line
-- ----------------------------
CREATE INDEX "IDX_cart_line_item_tax_line_deleted_at" ON "public"."cart_line_item_tax_line" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_cart_line_item_tax_line_item_id" ON "public"."cart_line_item_tax_line" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_line_item_tax_line_tax_rate_id" ON "public"."cart_line_item_tax_line" USING btree (
  "tax_rate_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND tax_rate_id IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table cart_line_item_tax_line
-- ----------------------------
ALTER TABLE "public"."cart_line_item_tax_line" ADD CONSTRAINT "cart_line_item_tax_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_payment_collection
-- ----------------------------
CREATE INDEX "IDX_cart_id_-4a39f6c9" ON "public"."cart_payment_collection" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_deleted_at_-4a39f6c9" ON "public"."cart_payment_collection" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_-4a39f6c9" ON "public"."cart_payment_collection" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_payment_collection_id_-4a39f6c9" ON "public"."cart_payment_collection" USING btree (
  "payment_collection_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table cart_payment_collection
-- ----------------------------
ALTER TABLE "public"."cart_payment_collection" ADD CONSTRAINT "cart_payment_collection_pkey" PRIMARY KEY ("cart_id", "payment_collection_id");

-- ----------------------------
-- Indexes structure for table cart_promotion
-- ----------------------------
CREATE INDEX "IDX_cart_id_-a9d4a70b" ON "public"."cart_promotion" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_deleted_at_-a9d4a70b" ON "public"."cart_promotion" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_-a9d4a70b" ON "public"."cart_promotion" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_promotion_id_-a9d4a70b" ON "public"."cart_promotion" USING btree (
  "promotion_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table cart_promotion
-- ----------------------------
ALTER TABLE "public"."cart_promotion" ADD CONSTRAINT "cart_promotion_pkey" PRIMARY KEY ("cart_id", "promotion_id");

-- ----------------------------
-- Indexes structure for table cart_shipping_method
-- ----------------------------
CREATE INDEX "IDX_cart_shipping_method_cart_id" ON "public"."cart_shipping_method" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_cart_shipping_method_deleted_at" ON "public"."cart_shipping_method" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_shipping_method_option_id" ON "public"."cart_shipping_method" USING btree (
  "shipping_option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND shipping_option_id IS NOT NULL;

-- ----------------------------
-- Checks structure for table cart_shipping_method
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method" ADD CONSTRAINT "cart_shipping_method_check" CHECK (amount >= 0::numeric);

-- ----------------------------
-- Primary Key structure for table cart_shipping_method
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method" ADD CONSTRAINT "cart_shipping_method_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_shipping_method_adjustment
-- ----------------------------
CREATE INDEX "IDX_cart_shipping_method_adjustment_deleted_at" ON "public"."cart_shipping_method_adjustment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_cart_shipping_method_adjustment_shipping_method_id" ON "public"."cart_shipping_method_adjustment" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_method_adjustment_promotion_id" ON "public"."cart_shipping_method_adjustment" USING btree (
  "promotion_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND promotion_id IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table cart_shipping_method_adjustment
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method_adjustment" ADD CONSTRAINT "cart_shipping_method_adjustment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cart_shipping_method_tax_line
-- ----------------------------
CREATE INDEX "IDX_cart_shipping_method_tax_line_deleted_at" ON "public"."cart_shipping_method_tax_line" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_cart_shipping_method_tax_line_shipping_method_id" ON "public"."cart_shipping_method_tax_line" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_method_tax_line_tax_rate_id" ON "public"."cart_shipping_method_tax_line" USING btree (
  "tax_rate_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND tax_rate_id IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table cart_shipping_method_tax_line
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method_tax_line" ADD CONSTRAINT "cart_shipping_method_tax_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table credit_line
-- ----------------------------
CREATE INDEX "IDX_cart_credit_line_reference_reference_id" ON "public"."credit_line" USING btree (
  "reference" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "reference_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_credit_line_cart_id" ON "public"."credit_line" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_credit_line_deleted_at" ON "public"."credit_line" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table credit_line
-- ----------------------------
ALTER TABLE "public"."credit_line" ADD CONSTRAINT "credit_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table currency
-- ----------------------------
ALTER TABLE "public"."currency" ADD CONSTRAINT "currency_pkey" PRIMARY KEY ("code");

-- ----------------------------
-- Indexes structure for table customer
-- ----------------------------
CREATE INDEX "IDX_customer_deleted_at" ON "public"."customer" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_customer_email_has_account_unique" ON "public"."customer" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "has_account" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table customer_account_holder
-- ----------------------------
CREATE INDEX "IDX_account_holder_id_5cb3a0c0" ON "public"."customer_account_holder" USING btree (
  "account_holder_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_customer_id_5cb3a0c0" ON "public"."customer_account_holder" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_deleted_at_5cb3a0c0" ON "public"."customer_account_holder" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_5cb3a0c0" ON "public"."customer_account_holder" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table customer_account_holder
-- ----------------------------
ALTER TABLE "public"."customer_account_holder" ADD CONSTRAINT "customer_account_holder_pkey" PRIMARY KEY ("customer_id", "account_holder_id");

-- ----------------------------
-- Indexes structure for table customer_address
-- ----------------------------
CREATE INDEX "IDX_customer_address_customer_id" ON "public"."customer_address" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_customer_address_deleted_at" ON "public"."customer_address" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_billing" ON "public"."customer_address" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE is_default_billing = true;
CREATE UNIQUE INDEX "IDX_customer_address_unique_customer_shipping" ON "public"."customer_address" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE is_default_shipping = true;

-- ----------------------------
-- Primary Key structure for table customer_address
-- ----------------------------
ALTER TABLE "public"."customer_address" ADD CONSTRAINT "customer_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table customer_group
-- ----------------------------
CREATE INDEX "IDX_customer_group_deleted_at" ON "public"."customer_group" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_customer_group_name_unique" ON "public"."customer_group" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table customer_group
-- ----------------------------
ALTER TABLE "public"."customer_group" ADD CONSTRAINT "customer_group_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table customer_group_customer
-- ----------------------------
CREATE INDEX "IDX_customer_group_customer_customer_group_id" ON "public"."customer_group_customer" USING btree (
  "customer_group_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_customer_group_customer_customer_id" ON "public"."customer_group_customer" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_customer_group_customer_deleted_at" ON "public"."customer_group_customer" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table customer_group_customer
-- ----------------------------
ALTER TABLE "public"."customer_group_customer" ADD CONSTRAINT "customer_group_customer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment
-- ----------------------------
CREATE INDEX "IDX_fulfillment_deleted_at" ON "public"."fulfillment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_fulfillment_location_id" ON "public"."fulfillment" USING btree (
  "location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_fulfillment_shipping_option_id" ON "public"."fulfillment" USING btree (
  "shipping_option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment
-- ----------------------------
ALTER TABLE "public"."fulfillment" ADD CONSTRAINT "fulfillment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment_address
-- ----------------------------
CREATE INDEX "IDX_fulfillment_address_deleted_at" ON "public"."fulfillment_address" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment_address
-- ----------------------------
ALTER TABLE "public"."fulfillment_address" ADD CONSTRAINT "fulfillment_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment_item
-- ----------------------------
CREATE INDEX "IDX_fulfillment_item_deleted_at" ON "public"."fulfillment_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_fulfillment_item_fulfillment_id" ON "public"."fulfillment_item" USING btree (
  "fulfillment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_fulfillment_item_inventory_item_id" ON "public"."fulfillment_item" USING btree (
  "inventory_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_fulfillment_item_line_item_id" ON "public"."fulfillment_item" USING btree (
  "line_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment_item
-- ----------------------------
ALTER TABLE "public"."fulfillment_item" ADD CONSTRAINT "fulfillment_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment_label
-- ----------------------------
CREATE INDEX "IDX_fulfillment_label_deleted_at" ON "public"."fulfillment_label" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_fulfillment_label_fulfillment_id" ON "public"."fulfillment_label" USING btree (
  "fulfillment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment_label
-- ----------------------------
ALTER TABLE "public"."fulfillment_label" ADD CONSTRAINT "fulfillment_label_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment_provider
-- ----------------------------
CREATE INDEX "IDX_fulfillment_provider_deleted_at" ON "public"."fulfillment_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment_provider
-- ----------------------------
ALTER TABLE "public"."fulfillment_provider" ADD CONSTRAINT "fulfillment_provider_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table fulfillment_set
-- ----------------------------
CREATE INDEX "IDX_fulfillment_set_deleted_at" ON "public"."fulfillment_set" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE UNIQUE INDEX "IDX_fulfillment_set_name_unique" ON "public"."fulfillment_set" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table fulfillment_set
-- ----------------------------
ALTER TABLE "public"."fulfillment_set" ADD CONSTRAINT "fulfillment_set_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table geo_zone
-- ----------------------------
CREATE INDEX "IDX_geo_zone_city" ON "public"."geo_zone" USING btree (
  "city" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND city IS NOT NULL;
CREATE INDEX "IDX_geo_zone_country_code" ON "public"."geo_zone" USING btree (
  "country_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_geo_zone_deleted_at" ON "public"."geo_zone" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_geo_zone_province_code" ON "public"."geo_zone" USING btree (
  "province_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND province_code IS NOT NULL;
CREATE INDEX "IDX_geo_zone_service_zone_id" ON "public"."geo_zone" USING btree (
  "service_zone_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table geo_zone
-- ----------------------------
ALTER TABLE "public"."geo_zone" ADD CONSTRAINT "geo_zone_type_check" CHECK (type = ANY (ARRAY['country'::text, 'province'::text, 'city'::text, 'zip'::text]));

-- ----------------------------
-- Primary Key structure for table geo_zone
-- ----------------------------
ALTER TABLE "public"."geo_zone" ADD CONSTRAINT "geo_zone_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table image
-- ----------------------------
CREATE INDEX "IDX_image_deleted_at" ON "public"."image" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_image_product_id" ON "public"."image" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_image_rank" ON "public"."image" USING btree (
  "rank" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_image_rank_product_id" ON "public"."image" USING btree (
  "rank" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_image_url" ON "public"."image" USING btree (
  "url" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_image_url_rank_product_id" ON "public"."image" USING btree (
  "url" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "rank" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table image
-- ----------------------------
ALTER TABLE "public"."image" ADD CONSTRAINT "image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table inventory_item
-- ----------------------------
CREATE INDEX "IDX_inventory_item_deleted_at" ON "public"."inventory_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE UNIQUE INDEX "IDX_inventory_item_sku" ON "public"."inventory_item" USING btree (
  "sku" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table inventory_item
-- ----------------------------
ALTER TABLE "public"."inventory_item" ADD CONSTRAINT "inventory_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table inventory_level
-- ----------------------------
CREATE INDEX "IDX_inventory_level_deleted_at" ON "public"."inventory_level" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_inventory_level_inventory_item_id" ON "public"."inventory_level" USING btree (
  "inventory_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_inventory_level_location_id" ON "public"."inventory_level" USING btree (
  "location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_inventory_level_location_id_inventory_item_id" ON "public"."inventory_level" USING btree (
  "inventory_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table inventory_level
-- ----------------------------
ALTER TABLE "public"."inventory_level" ADD CONSTRAINT "inventory_level_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table invite
-- ----------------------------
CREATE INDEX "IDX_invite_deleted_at" ON "public"."invite" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE UNIQUE INDEX "IDX_invite_email_unique" ON "public"."invite" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_invite_token" ON "public"."invite" USING btree (
  "token" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table invite
-- ----------------------------
ALTER TABLE "public"."invite" ADD CONSTRAINT "invite_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table link_module_migrations
-- ----------------------------
ALTER TABLE "public"."link_module_migrations" ADD CONSTRAINT "link_module_migrations_table_name_key" UNIQUE ("table_name");

-- ----------------------------
-- Primary Key structure for table link_module_migrations
-- ----------------------------
ALTER TABLE "public"."link_module_migrations" ADD CONSTRAINT "link_module_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table location_fulfillment_provider
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-1e5992737" ON "public"."location_fulfillment_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_fulfillment_provider_id_-1e5992737" ON "public"."location_fulfillment_provider" USING btree (
  "fulfillment_provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_id_-1e5992737" ON "public"."location_fulfillment_provider" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_stock_location_id_-1e5992737" ON "public"."location_fulfillment_provider" USING btree (
  "stock_location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table location_fulfillment_provider
-- ----------------------------
ALTER TABLE "public"."location_fulfillment_provider" ADD CONSTRAINT "location_fulfillment_provider_pkey" PRIMARY KEY ("stock_location_id", "fulfillment_provider_id");

-- ----------------------------
-- Indexes structure for table location_fulfillment_set
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-e88adb96" ON "public"."location_fulfillment_set" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_fulfillment_set_id_-e88adb96" ON "public"."location_fulfillment_set" USING btree (
  "fulfillment_set_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_id_-e88adb96" ON "public"."location_fulfillment_set" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_stock_location_id_-e88adb96" ON "public"."location_fulfillment_set" USING btree (
  "stock_location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table location_fulfillment_set
-- ----------------------------
ALTER TABLE "public"."location_fulfillment_set" ADD CONSTRAINT "location_fulfillment_set_pkey" PRIMARY KEY ("stock_location_id", "fulfillment_set_id");

-- ----------------------------
-- Primary Key structure for table mikro_orm_migrations
-- ----------------------------
ALTER TABLE "public"."mikro_orm_migrations" ADD CONSTRAINT "mikro_orm_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table notification
-- ----------------------------
CREATE INDEX "IDX_notification_deleted_at" ON "public"."notification" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_notification_idempotency_key_unique" ON "public"."notification" USING btree (
  "idempotency_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_notification_provider_id" ON "public"."notification" USING btree (
  "provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_notification_receiver_id" ON "public"."notification" USING btree (
  "receiver_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table notification
-- ----------------------------
ALTER TABLE "public"."notification" ADD CONSTRAINT "notification_status_check" CHECK (status = ANY (ARRAY['pending'::text, 'success'::text, 'failure'::text]));

-- ----------------------------
-- Primary Key structure for table notification
-- ----------------------------
ALTER TABLE "public"."notification" ADD CONSTRAINT "notification_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table notification_provider
-- ----------------------------
CREATE INDEX "IDX_notification_provider_deleted_at" ON "public"."notification_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table notification_provider
-- ----------------------------
ALTER TABLE "public"."notification_provider" ADD CONSTRAINT "notification_provider_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order
-- ----------------------------
CREATE INDEX "IDX_order_billing_address_id" ON "public"."order" USING btree (
  "billing_address_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_currency_code" ON "public"."order" USING btree (
  "currency_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_order_custom_display_id" ON "public"."order" USING btree (
  "custom_display_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_customer_id" ON "public"."order" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_deleted_at" ON "public"."order" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_display_id" ON "public"."order" USING btree (
  "display_id" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_is_draft_order" ON "public"."order" USING btree (
  "is_draft_order" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_region_id" ON "public"."order" USING btree (
  "region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_sales_channel_id" ON "public"."order" USING btree (
  "sales_channel_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_address_id" ON "public"."order" USING btree (
  "shipping_address_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "order_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_address
-- ----------------------------
CREATE INDEX "IDX_order_address_customer_id" ON "public"."order_address" USING btree (
  "customer_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_address_deleted_at" ON "public"."order_address" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_address
-- ----------------------------
ALTER TABLE "public"."order_address" ADD CONSTRAINT "order_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_cart
-- ----------------------------
CREATE INDEX "IDX_cart_id_-71069c16" ON "public"."order_cart" USING btree (
  "cart_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_deleted_at_-71069c16" ON "public"."order_cart" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_-71069c16" ON "public"."order_cart" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_id_-71069c16" ON "public"."order_cart" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_cart
-- ----------------------------
ALTER TABLE "public"."order_cart" ADD CONSTRAINT "order_cart_pkey" PRIMARY KEY ("order_id", "cart_id");

-- ----------------------------
-- Indexes structure for table order_change
-- ----------------------------
CREATE INDEX "IDX_order_change_change_type" ON "public"."order_change" USING btree (
  "change_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_change_claim_id" ON "public"."order_change" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE claim_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_change_deleted_at" ON "public"."order_change" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_change_exchange_id" ON "public"."order_change" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE exchange_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_change_order_id" ON "public"."order_change" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_change_order_id_version" ON "public"."order_change" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_change_return_id" ON "public"."order_change" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_change_status" ON "public"."order_change" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_change_version" ON "public"."order_change" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table order_change
-- ----------------------------
ALTER TABLE "public"."order_change" ADD CONSTRAINT "order_change_status_check" CHECK (status = ANY (ARRAY['confirmed'::text, 'declined'::text, 'requested'::text, 'pending'::text, 'canceled'::text]));

-- ----------------------------
-- Primary Key structure for table order_change
-- ----------------------------
ALTER TABLE "public"."order_change" ADD CONSTRAINT "order_change_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_change_action
-- ----------------------------
CREATE INDEX "IDX_order_change_action_claim_id" ON "public"."order_change_action" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE claim_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_change_action_deleted_at" ON "public"."order_change_action" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_change_action_exchange_id" ON "public"."order_change_action" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE exchange_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_change_action_order_change_id" ON "public"."order_change_action" USING btree (
  "order_change_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_change_action_order_id" ON "public"."order_change_action" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_change_action_ordering" ON "public"."order_change_action" USING btree (
  "ordering" "pg_catalog"."int8_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_change_action_return_id" ON "public"."order_change_action" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_change_action
-- ----------------------------
ALTER TABLE "public"."order_change_action" ADD CONSTRAINT "order_change_action_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_claim
-- ----------------------------
CREATE INDEX "IDX_order_claim_deleted_at" ON "public"."order_claim" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_display_id" ON "public"."order_claim" USING btree (
  "display_id" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_order_id" ON "public"."order_claim" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_return_id" ON "public"."order_claim" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_claim
-- ----------------------------
ALTER TABLE "public"."order_claim" ADD CONSTRAINT "order_claim_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_claim_item
-- ----------------------------
CREATE INDEX "IDX_order_claim_item_claim_id" ON "public"."order_claim_item" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_item_deleted_at" ON "public"."order_claim_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_item_item_id" ON "public"."order_claim_item" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_claim_item
-- ----------------------------
ALTER TABLE "public"."order_claim_item" ADD CONSTRAINT "order_claim_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_claim_item_image
-- ----------------------------
CREATE INDEX "IDX_order_claim_item_image_claim_item_id" ON "public"."order_claim_item_image" USING btree (
  "claim_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_claim_item_image_deleted_at" ON "public"."order_claim_item_image" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table order_claim_item_image
-- ----------------------------
ALTER TABLE "public"."order_claim_item_image" ADD CONSTRAINT "order_claim_item_image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_credit_line
-- ----------------------------
CREATE INDEX "IDX_order_credit_line_deleted_at" ON "public"."order_credit_line" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_order_credit_line_order_id" ON "public"."order_credit_line" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_credit_line_order_id_version" ON "public"."order_credit_line" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_credit_line
-- ----------------------------
ALTER TABLE "public"."order_credit_line" ADD CONSTRAINT "order_credit_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_exchange
-- ----------------------------
CREATE INDEX "IDX_order_exchange_deleted_at" ON "public"."order_exchange" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_exchange_display_id" ON "public"."order_exchange" USING btree (
  "display_id" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_exchange_order_id" ON "public"."order_exchange" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_exchange_return_id" ON "public"."order_exchange" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_exchange
-- ----------------------------
ALTER TABLE "public"."order_exchange" ADD CONSTRAINT "order_exchange_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_exchange_item
-- ----------------------------
CREATE INDEX "IDX_order_exchange_item_deleted_at" ON "public"."order_exchange_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_exchange_item_exchange_id" ON "public"."order_exchange_item" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_exchange_item_item_id" ON "public"."order_exchange_item" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_exchange_item
-- ----------------------------
ALTER TABLE "public"."order_exchange_item" ADD CONSTRAINT "order_exchange_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_fulfillment
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-e8d2543e" ON "public"."order_fulfillment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_fulfillment_id_-e8d2543e" ON "public"."order_fulfillment" USING btree (
  "fulfillment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_id_-e8d2543e" ON "public"."order_fulfillment" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_id_-e8d2543e" ON "public"."order_fulfillment" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_fulfillment
-- ----------------------------
ALTER TABLE "public"."order_fulfillment" ADD CONSTRAINT "order_fulfillment_pkey" PRIMARY KEY ("order_id", "fulfillment_id");

-- ----------------------------
-- Indexes structure for table order_item
-- ----------------------------
CREATE INDEX "IDX_order_item_deleted_at" ON "public"."order_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_order_item_item_id" ON "public"."order_item" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_item_order_id" ON "public"."order_item" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_item_order_id_version" ON "public"."order_item" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_item
-- ----------------------------
ALTER TABLE "public"."order_item" ADD CONSTRAINT "order_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_line_item
-- ----------------------------
CREATE INDEX "IDX_line_item_product_type_id" ON "public"."order_line_item" USING btree (
  "product_type_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND product_type_id IS NOT NULL;
CREATE INDEX "IDX_order_line_item_product_id" ON "public"."order_line_item" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_line_item_variant_id" ON "public"."order_line_item" USING btree (
  "variant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_line_item
-- ----------------------------
ALTER TABLE "public"."order_line_item" ADD CONSTRAINT "order_line_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_line_item_adjustment
-- ----------------------------
CREATE INDEX "IDX_order_line_item_adjustment_item_id" ON "public"."order_line_item_adjustment" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_line_item_adjustment
-- ----------------------------
ALTER TABLE "public"."order_line_item_adjustment" ADD CONSTRAINT "order_line_item_adjustment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_line_item_tax_line
-- ----------------------------
CREATE INDEX "IDX_order_line_item_tax_line_item_id" ON "public"."order_line_item_tax_line" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_line_item_tax_line
-- ----------------------------
ALTER TABLE "public"."order_line_item_tax_line" ADD CONSTRAINT "order_line_item_tax_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_payment_collection
-- ----------------------------
CREATE INDEX "IDX_deleted_at_f42b9949" ON "public"."order_payment_collection" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_f42b9949" ON "public"."order_payment_collection" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_id_f42b9949" ON "public"."order_payment_collection" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_payment_collection_id_f42b9949" ON "public"."order_payment_collection" USING btree (
  "payment_collection_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_payment_collection
-- ----------------------------
ALTER TABLE "public"."order_payment_collection" ADD CONSTRAINT "order_payment_collection_pkey" PRIMARY KEY ("order_id", "payment_collection_id");

-- ----------------------------
-- Indexes structure for table order_promotion
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-71518339" ON "public"."order_promotion" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_-71518339" ON "public"."order_promotion" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_order_id_-71518339" ON "public"."order_promotion" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_id_-71518339" ON "public"."order_promotion" USING btree (
  "promotion_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_promotion
-- ----------------------------
ALTER TABLE "public"."order_promotion" ADD CONSTRAINT "order_promotion_pkey" PRIMARY KEY ("order_id", "promotion_id");

-- ----------------------------
-- Indexes structure for table order_shipping
-- ----------------------------
CREATE INDEX "IDX_order_shipping_claim_id" ON "public"."order_shipping" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE claim_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_deleted_at" ON "public"."order_shipping" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_order_shipping_exchange_id" ON "public"."order_shipping" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE exchange_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_item_id" ON "public"."order_shipping" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_order_id" ON "public"."order_shipping" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_order_id_version" ON "public"."order_shipping" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_return_id" ON "public"."order_shipping" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_shipping_shipping_method_id" ON "public"."order_shipping" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_shipping
-- ----------------------------
ALTER TABLE "public"."order_shipping" ADD CONSTRAINT "order_shipping_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_shipping_method
-- ----------------------------
CREATE INDEX "IDX_order_shipping_method_shipping_option_id" ON "public"."order_shipping_method" USING btree (
  "shipping_option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_shipping_method
-- ----------------------------
ALTER TABLE "public"."order_shipping_method" ADD CONSTRAINT "order_shipping_method_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_shipping_method_adjustment
-- ----------------------------
CREATE INDEX "IDX_order_shipping_method_adjustment_shipping_method_id" ON "public"."order_shipping_method_adjustment" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_shipping_method_adjustment
-- ----------------------------
ALTER TABLE "public"."order_shipping_method_adjustment" ADD CONSTRAINT "order_shipping_method_adjustment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_shipping_method_tax_line
-- ----------------------------
CREATE INDEX "IDX_order_shipping_method_tax_line_shipping_method_id" ON "public"."order_shipping_method_tax_line" USING btree (
  "shipping_method_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_shipping_method_tax_line
-- ----------------------------
ALTER TABLE "public"."order_shipping_method_tax_line" ADD CONSTRAINT "order_shipping_method_tax_line_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_summary
-- ----------------------------
CREATE INDEX "IDX_order_summary_deleted_at" ON "public"."order_summary" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_order_summary_order_id_version" ON "public"."order_summary" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_summary
-- ----------------------------
ALTER TABLE "public"."order_summary" ADD CONSTRAINT "order_summary_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table order_transaction
-- ----------------------------
CREATE INDEX "IDX_order_transaction_claim_id" ON "public"."order_transaction" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE claim_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_currency_code" ON "public"."order_transaction" USING btree (
  "currency_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_exchange_id" ON "public"."order_transaction" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE exchange_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_order_id" ON "public"."order_transaction" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_order_id_version" ON "public"."order_transaction" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "version" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_reference_id" ON "public"."order_transaction" USING btree (
  "reference_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_order_transaction_return_id" ON "public"."order_transaction" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE return_id IS NOT NULL AND deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table order_transaction
-- ----------------------------
ALTER TABLE "public"."order_transaction" ADD CONSTRAINT "order_transaction_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table payment
-- ----------------------------
CREATE INDEX "IDX_payment_deleted_at" ON "public"."payment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_payment_payment_collection_id" ON "public"."payment" USING btree (
  "payment_collection_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_payment_payment_session_id" ON "public"."payment" USING btree (
  "payment_session_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_payment_payment_session_id_unique" ON "public"."payment" USING btree (
  "payment_session_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_payment_provider_id" ON "public"."payment" USING btree (
  "provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table payment
-- ----------------------------
ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table payment_collection
-- ----------------------------
CREATE INDEX "IDX_payment_collection_deleted_at" ON "public"."payment_collection" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Checks structure for table payment_collection
-- ----------------------------
ALTER TABLE "public"."payment_collection" ADD CONSTRAINT "payment_collection_status_check" CHECK (status = ANY (ARRAY['not_paid'::text, 'awaiting'::text, 'authorized'::text, 'partially_authorized'::text, 'canceled'::text, 'failed'::text, 'partially_captured'::text, 'completed'::text]));

-- ----------------------------
-- Primary Key structure for table payment_collection
-- ----------------------------
ALTER TABLE "public"."payment_collection" ADD CONSTRAINT "payment_collection_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table payment_collection_payment_providers
-- ----------------------------
ALTER TABLE "public"."payment_collection_payment_providers" ADD CONSTRAINT "payment_collection_payment_providers_pkey" PRIMARY KEY ("payment_collection_id", "payment_provider_id");

-- ----------------------------
-- Indexes structure for table payment_provider
-- ----------------------------
CREATE INDEX "IDX_payment_provider_deleted_at" ON "public"."payment_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table payment_provider
-- ----------------------------
ALTER TABLE "public"."payment_provider" ADD CONSTRAINT "payment_provider_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table payment_session
-- ----------------------------
CREATE INDEX "IDX_payment_session_deleted_at" ON "public"."payment_session" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_payment_session_payment_collection_id" ON "public"."payment_session" USING btree (
  "payment_collection_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table payment_session
-- ----------------------------
ALTER TABLE "public"."payment_session" ADD CONSTRAINT "payment_session_status_check" CHECK (status = ANY (ARRAY['authorized'::text, 'captured'::text, 'pending'::text, 'requires_more'::text, 'error'::text, 'canceled'::text]));

-- ----------------------------
-- Primary Key structure for table payment_session
-- ----------------------------
ALTER TABLE "public"."payment_session" ADD CONSTRAINT "payment_session_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price
-- ----------------------------
CREATE INDEX "IDX_price_currency_code" ON "public"."price" USING btree (
  "currency_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_deleted_at" ON "public"."price" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_price_price_list_id" ON "public"."price" USING btree (
  "price_list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_price_set_id" ON "public"."price" USING btree (
  "price_set_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table price
-- ----------------------------
ALTER TABLE "public"."price" ADD CONSTRAINT "price_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price_list
-- ----------------------------
CREATE INDEX "IDX_price_list_deleted_at" ON "public"."price_list" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_price_list_id_status_starts_at_ends_at" ON "public"."price_list" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "starts_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST,
  "ends_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND status = 'active'::text;

-- ----------------------------
-- Checks structure for table price_list
-- ----------------------------
ALTER TABLE "public"."price_list" ADD CONSTRAINT "price_list_status_check" CHECK (status = ANY (ARRAY['active'::text, 'draft'::text]));
ALTER TABLE "public"."price_list" ADD CONSTRAINT "price_list_type_check" CHECK (type = ANY (ARRAY['sale'::text, 'override'::text]));

-- ----------------------------
-- Primary Key structure for table price_list
-- ----------------------------
ALTER TABLE "public"."price_list" ADD CONSTRAINT "price_list_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price_list_rule
-- ----------------------------
CREATE INDEX "IDX_price_list_rule_attribute" ON "public"."price_list_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_list_rule_deleted_at" ON "public"."price_list_rule" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_price_list_rule_price_list_id" ON "public"."price_list_rule" USING btree (
  "price_list_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_price_list_rule_value" ON "public"."price_list_rule" USING gin (
  "value" "pg_catalog"."jsonb_ops"
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table price_list_rule
-- ----------------------------
ALTER TABLE "public"."price_list_rule" ADD CONSTRAINT "price_list_rule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price_preference
-- ----------------------------
CREATE UNIQUE INDEX "IDX_price_preference_attribute_value" ON "public"."price_preference" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_preference_deleted_at" ON "public"."price_preference" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table price_preference
-- ----------------------------
ALTER TABLE "public"."price_preference" ADD CONSTRAINT "price_preference_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price_rule
-- ----------------------------
CREATE INDEX "IDX_price_rule_attribute" ON "public"."price_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_rule_attribute_value" ON "public"."price_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_rule_attribute_value_price_id" ON "public"."price_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "price_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_rule_deleted_at" ON "public"."price_rule" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_price_rule_operator" ON "public"."price_rule" USING btree (
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_price_rule_operator_value" ON "public"."price_rule" USING btree (
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_price_rule_price_id" ON "public"."price_rule" USING btree (
  "price_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_price_rule_price_id_attribute_operator_unique" ON "public"."price_rule" USING btree (
  "price_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table price_rule
-- ----------------------------
ALTER TABLE "public"."price_rule" ADD CONSTRAINT "price_rule_operator_check" CHECK (operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text]));

-- ----------------------------
-- Primary Key structure for table price_rule
-- ----------------------------
ALTER TABLE "public"."price_rule" ADD CONSTRAINT "price_rule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table price_set
-- ----------------------------
CREATE INDEX "IDX_price_set_deleted_at" ON "public"."price_set" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table price_set
-- ----------------------------
ALTER TABLE "public"."price_set" ADD CONSTRAINT "price_set_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product
-- ----------------------------
CREATE INDEX "IDX_product_collection_id" ON "public"."product" USING btree (
  "collection_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_deleted_at" ON "public"."product" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_product_handle_unique" ON "public"."product" USING btree (
  "handle" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_status" ON "public"."product" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_type_id" ON "public"."product" USING btree (
  "type_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_status_check" CHECK (status = ANY (ARRAY['draft'::text, 'proposed'::text, 'published'::text, 'rejected'::text]));

-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_category
-- ----------------------------
CREATE UNIQUE INDEX "IDX_category_handle_unique" ON "public"."product_category" USING btree (
  "handle" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_category_parent_category_id" ON "public"."product_category" USING btree (
  "parent_category_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_category_path" ON "public"."product_category" USING btree (
  "mpath" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_category
-- ----------------------------
ALTER TABLE "public"."product_category" ADD CONSTRAINT "product_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table product_category_product
-- ----------------------------
ALTER TABLE "public"."product_category_product" ADD CONSTRAINT "product_category_product_pkey" PRIMARY KEY ("product_id", "product_category_id");

-- ----------------------------
-- Indexes structure for table product_collection
-- ----------------------------
CREATE UNIQUE INDEX "IDX_collection_handle_unique" ON "public"."product_collection" USING btree (
  "handle" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_collection_deleted_at" ON "public"."product_collection" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table product_collection
-- ----------------------------
ALTER TABLE "public"."product_collection" ADD CONSTRAINT "product_collection_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_option
-- ----------------------------
CREATE UNIQUE INDEX "IDX_option_product_id_title_unique" ON "public"."product_option" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "title" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_option_deleted_at" ON "public"."product_option" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_product_option_product_id" ON "public"."product_option" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_option
-- ----------------------------
ALTER TABLE "public"."product_option" ADD CONSTRAINT "product_option_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_option_value
-- ----------------------------
CREATE UNIQUE INDEX "IDX_option_value_option_id_unique" ON "public"."product_option_value" USING btree (
  "option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_option_value_deleted_at" ON "public"."product_option_value" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_product_option_value_option_id" ON "public"."product_option_value" USING btree (
  "option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_option_value
-- ----------------------------
ALTER TABLE "public"."product_option_value" ADD CONSTRAINT "product_option_value_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_sales_channel
-- ----------------------------
CREATE INDEX "IDX_deleted_at_20b454295" ON "public"."product_sales_channel" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_20b454295" ON "public"."product_sales_channel" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_product_id_20b454295" ON "public"."product_sales_channel" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_sales_channel_id_20b454295" ON "public"."product_sales_channel" USING btree (
  "sales_channel_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_sales_channel
-- ----------------------------
ALTER TABLE "public"."product_sales_channel" ADD CONSTRAINT "product_sales_channel_pkey" PRIMARY KEY ("product_id", "sales_channel_id");

-- ----------------------------
-- Indexes structure for table product_shipping_profile
-- ----------------------------
CREATE INDEX "IDX_deleted_at_17a262437" ON "public"."product_shipping_profile" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_17a262437" ON "public"."product_shipping_profile" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_product_id_17a262437" ON "public"."product_shipping_profile" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_profile_id_17a262437" ON "public"."product_shipping_profile" USING btree (
  "shipping_profile_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_shipping_profile
-- ----------------------------
ALTER TABLE "public"."product_shipping_profile" ADD CONSTRAINT "product_shipping_profile_pkey" PRIMARY KEY ("product_id", "shipping_profile_id");

-- ----------------------------
-- Indexes structure for table product_tag
-- ----------------------------
CREATE INDEX "IDX_product_tag_deleted_at" ON "public"."product_tag" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_tag_value_unique" ON "public"."product_tag" USING btree (
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_tag
-- ----------------------------
ALTER TABLE "public"."product_tag" ADD CONSTRAINT "product_tag_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table product_tags
-- ----------------------------
ALTER TABLE "public"."product_tags" ADD CONSTRAINT "product_tags_pkey" PRIMARY KEY ("product_id", "product_tag_id");

-- ----------------------------
-- Indexes structure for table product_type
-- ----------------------------
CREATE INDEX "IDX_product_type_deleted_at" ON "public"."product_type" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_type_value_unique" ON "public"."product_type" USING btree (
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_type
-- ----------------------------
ALTER TABLE "public"."product_type" ADD CONSTRAINT "product_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_variant
-- ----------------------------
CREATE UNIQUE INDEX "IDX_product_variant_barcode_unique" ON "public"."product_variant" USING btree (
  "barcode" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_variant_deleted_at" ON "public"."product_variant" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_product_variant_ean_unique" ON "public"."product_variant" USING btree (
  "ean" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_variant_id_product_id" ON "public"."product_variant" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_variant_product_id" ON "public"."product_variant" USING btree (
  "product_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_product_variant_sku_unique" ON "public"."product_variant" USING btree (
  "sku" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_product_variant_upc_unique" ON "public"."product_variant" USING btree (
  "upc" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_variant
-- ----------------------------
ALTER TABLE "public"."product_variant" ADD CONSTRAINT "product_variant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table product_variant_inventory_item
-- ----------------------------
CREATE INDEX "IDX_deleted_at_17b4c4e35" ON "public"."product_variant_inventory_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_17b4c4e35" ON "public"."product_variant_inventory_item" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_inventory_item_id_17b4c4e35" ON "public"."product_variant_inventory_item" USING btree (
  "inventory_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_variant_id_17b4c4e35" ON "public"."product_variant_inventory_item" USING btree (
  "variant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_variant_inventory_item
-- ----------------------------
ALTER TABLE "public"."product_variant_inventory_item" ADD CONSTRAINT "product_variant_inventory_item_pkey" PRIMARY KEY ("variant_id", "inventory_item_id");

-- ----------------------------
-- Primary Key structure for table product_variant_option
-- ----------------------------
ALTER TABLE "public"."product_variant_option" ADD CONSTRAINT "product_variant_option_pkey" PRIMARY KEY ("variant_id", "option_value_id");

-- ----------------------------
-- Indexes structure for table product_variant_price_set
-- ----------------------------
CREATE INDEX "IDX_deleted_at_52b23597" ON "public"."product_variant_price_set" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_52b23597" ON "public"."product_variant_price_set" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_price_set_id_52b23597" ON "public"."product_variant_price_set" USING btree (
  "price_set_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_variant_id_52b23597" ON "public"."product_variant_price_set" USING btree (
  "variant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_variant_price_set
-- ----------------------------
ALTER TABLE "public"."product_variant_price_set" ADD CONSTRAINT "product_variant_price_set_pkey" PRIMARY KEY ("variant_id", "price_set_id");

-- ----------------------------
-- Indexes structure for table product_variant_product_image
-- ----------------------------
CREATE INDEX "IDX_product_variant_product_image_deleted_at" ON "public"."product_variant_product_image" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_variant_product_image_image_id" ON "public"."product_variant_product_image" USING btree (
  "image_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_product_variant_product_image_variant_id" ON "public"."product_variant_product_image" USING btree (
  "variant_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table product_variant_product_image
-- ----------------------------
ALTER TABLE "public"."product_variant_product_image" ADD CONSTRAINT "product_variant_product_image_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion
-- ----------------------------
CREATE INDEX "IDX_promotion_campaign_id" ON "public"."promotion" USING btree (
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_deleted_at" ON "public"."promotion" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_is_automatic" ON "public"."promotion" USING btree (
  "is_automatic" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_status" ON "public"."promotion" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_type" ON "public"."promotion" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_unique_promotion_code" ON "public"."promotion" USING btree (
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table promotion
-- ----------------------------
ALTER TABLE "public"."promotion" ADD CONSTRAINT "promotion_type_check" CHECK (type = ANY (ARRAY['standard'::text, 'buyget'::text]));
ALTER TABLE "public"."promotion" ADD CONSTRAINT "promotion_status_check" CHECK (status = ANY (ARRAY['draft'::text, 'active'::text, 'inactive'::text]));

-- ----------------------------
-- Primary Key structure for table promotion
-- ----------------------------
ALTER TABLE "public"."promotion" ADD CONSTRAINT "promotion_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion_application_method
-- ----------------------------
CREATE INDEX "IDX_application_method_allocation" ON "public"."promotion_application_method" USING btree (
  "allocation" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_application_method_target_type" ON "public"."promotion_application_method" USING btree (
  "target_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_application_method_type" ON "public"."promotion_application_method" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_promotion_application_method_currency_code" ON "public"."promotion_application_method" USING btree (
  "currency_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_promotion_application_method_deleted_at" ON "public"."promotion_application_method" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_promotion_application_method_promotion_id_unique" ON "public"."promotion_application_method" USING btree (
  "promotion_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table promotion_application_method
-- ----------------------------
ALTER TABLE "public"."promotion_application_method" ADD CONSTRAINT "promotion_application_method_type_check" CHECK (type = ANY (ARRAY['fixed'::text, 'percentage'::text]));
ALTER TABLE "public"."promotion_application_method" ADD CONSTRAINT "promotion_application_method_target_type_check" CHECK (target_type = ANY (ARRAY['order'::text, 'shipping_methods'::text, 'items'::text]));
ALTER TABLE "public"."promotion_application_method" ADD CONSTRAINT "promotion_application_method_allocation_check" CHECK (allocation = ANY (ARRAY['each'::text, 'across'::text, 'once'::text]));

-- ----------------------------
-- Primary Key structure for table promotion_application_method
-- ----------------------------
ALTER TABLE "public"."promotion_application_method" ADD CONSTRAINT "promotion_application_method_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion_campaign
-- ----------------------------
CREATE UNIQUE INDEX "IDX_promotion_campaign_campaign_identifier_unique" ON "public"."promotion_campaign" USING btree (
  "campaign_identifier" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_campaign_deleted_at" ON "public"."promotion_campaign" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table promotion_campaign
-- ----------------------------
ALTER TABLE "public"."promotion_campaign" ADD CONSTRAINT "promotion_campaign_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion_campaign_budget
-- ----------------------------
CREATE INDEX "IDX_campaign_budget_type" ON "public"."promotion_campaign_budget" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_campaign_id_unique" ON "public"."promotion_campaign_budget" USING btree (
  "campaign_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_campaign_budget_deleted_at" ON "public"."promotion_campaign_budget" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table promotion_campaign_budget
-- ----------------------------
ALTER TABLE "public"."promotion_campaign_budget" ADD CONSTRAINT "promotion_campaign_budget_type_check" CHECK (type = ANY (ARRAY['spend'::text, 'usage'::text, 'use_by_attribute'::text, 'spend_by_attribute'::text]));

-- ----------------------------
-- Primary Key structure for table promotion_campaign_budget
-- ----------------------------
ALTER TABLE "public"."promotion_campaign_budget" ADD CONSTRAINT "promotion_campaign_budget_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion_campaign_budget_usage
-- ----------------------------
CREATE UNIQUE INDEX "IDX_promotion_campaign_budget_usage_attribute_value_budget_id_u" ON "public"."promotion_campaign_budget_usage" USING btree (
  "attribute_value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "budget_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_campaign_budget_usage_budget_id" ON "public"."promotion_campaign_budget_usage" USING btree (
  "budget_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_campaign_budget_usage_deleted_at" ON "public"."promotion_campaign_budget_usage" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table promotion_campaign_budget_usage
-- ----------------------------
ALTER TABLE "public"."promotion_campaign_budget_usage" ADD CONSTRAINT "promotion_campaign_budget_usage_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table promotion_promotion_rule
-- ----------------------------
ALTER TABLE "public"."promotion_promotion_rule" ADD CONSTRAINT "promotion_promotion_rule_pkey" PRIMARY KEY ("promotion_id", "promotion_rule_id");

-- ----------------------------
-- Indexes structure for table promotion_rule
-- ----------------------------
CREATE INDEX "IDX_promotion_rule_attribute" ON "public"."promotion_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_promotion_rule_attribute_operator" ON "public"."promotion_rule" USING btree (
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_attribute_operator_id" ON "public"."promotion_rule" USING btree (
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "attribute" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_deleted_at" ON "public"."promotion_rule" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_operator" ON "public"."promotion_rule" USING btree (
  "operator" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Checks structure for table promotion_rule
-- ----------------------------
ALTER TABLE "public"."promotion_rule" ADD CONSTRAINT "promotion_rule_operator_check" CHECK (operator = ANY (ARRAY['gte'::text, 'lte'::text, 'gt'::text, 'lt'::text, 'eq'::text, 'ne'::text, 'in'::text]));

-- ----------------------------
-- Primary Key structure for table promotion_rule
-- ----------------------------
ALTER TABLE "public"."promotion_rule" ADD CONSTRAINT "promotion_rule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table promotion_rule_value
-- ----------------------------
CREATE INDEX "IDX_promotion_rule_value_deleted_at" ON "public"."promotion_rule_value" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_value_promotion_rule_id" ON "public"."promotion_rule_value" USING btree (
  "promotion_rule_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_value_rule_id_value" ON "public"."promotion_rule_value" USING btree (
  "promotion_rule_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_promotion_rule_value_value" ON "public"."promotion_rule_value" USING btree (
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table promotion_rule_value
-- ----------------------------
ALTER TABLE "public"."promotion_rule_value" ADD CONSTRAINT "promotion_rule_value_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table provider_identity
-- ----------------------------
CREATE INDEX "IDX_provider_identity_auth_identity_id" ON "public"."provider_identity" USING btree (
  "auth_identity_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_provider_identity_deleted_at" ON "public"."provider_identity" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_provider_identity_provider_entity_id" ON "public"."provider_identity" USING btree (
  "entity_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "provider" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table provider_identity
-- ----------------------------
ALTER TABLE "public"."provider_identity" ADD CONSTRAINT "provider_identity_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table publishable_api_key_sales_channel
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-1d67bae40" ON "public"."publishable_api_key_sales_channel" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_-1d67bae40" ON "public"."publishable_api_key_sales_channel" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_publishable_key_id_-1d67bae40" ON "public"."publishable_api_key_sales_channel" USING btree (
  "publishable_key_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_sales_channel_id_-1d67bae40" ON "public"."publishable_api_key_sales_channel" USING btree (
  "sales_channel_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table publishable_api_key_sales_channel
-- ----------------------------
ALTER TABLE "public"."publishable_api_key_sales_channel" ADD CONSTRAINT "publishable_api_key_sales_channel_pkey" PRIMARY KEY ("publishable_key_id", "sales_channel_id");

-- ----------------------------
-- Indexes structure for table refund
-- ----------------------------
CREATE INDEX "IDX_refund_deleted_at" ON "public"."refund" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_refund_payment_id" ON "public"."refund" USING btree (
  "payment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_refund_refund_reason_id" ON "public"."refund" USING btree (
  "refund_reason_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table refund
-- ----------------------------
ALTER TABLE "public"."refund" ADD CONSTRAINT "refund_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table refund_reason
-- ----------------------------
CREATE INDEX "IDX_refund_reason_deleted_at" ON "public"."refund_reason" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table refund_reason
-- ----------------------------
ALTER TABLE "public"."refund_reason" ADD CONSTRAINT "refund_reason_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table region
-- ----------------------------
CREATE INDEX "IDX_region_deleted_at" ON "public"."region" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table region
-- ----------------------------
ALTER TABLE "public"."region" ADD CONSTRAINT "region_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table region_country
-- ----------------------------
CREATE INDEX "IDX_region_country_deleted_at" ON "public"."region_country" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_region_country_region_id" ON "public"."region_country" USING btree (
  "region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_region_country_region_id_iso_2_unique" ON "public"."region_country" USING btree (
  "region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "iso_2" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table region_country
-- ----------------------------
ALTER TABLE "public"."region_country" ADD CONSTRAINT "region_country_pkey" PRIMARY KEY ("iso_2");

-- ----------------------------
-- Indexes structure for table region_payment_provider
-- ----------------------------
CREATE INDEX "IDX_deleted_at_1c934dab0" ON "public"."region_payment_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_1c934dab0" ON "public"."region_payment_provider" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_payment_provider_id_1c934dab0" ON "public"."region_payment_provider" USING btree (
  "payment_provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_region_id_1c934dab0" ON "public"."region_payment_provider" USING btree (
  "region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table region_payment_provider
-- ----------------------------
ALTER TABLE "public"."region_payment_provider" ADD CONSTRAINT "region_payment_provider_pkey" PRIMARY KEY ("region_id", "payment_provider_id");

-- ----------------------------
-- Indexes structure for table reservation_item
-- ----------------------------
CREATE INDEX "IDX_reservation_item_deleted_at" ON "public"."reservation_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_reservation_item_inventory_item_id" ON "public"."reservation_item" USING btree (
  "inventory_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_reservation_item_line_item_id" ON "public"."reservation_item" USING btree (
  "line_item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_reservation_item_location_id" ON "public"."reservation_item" USING btree (
  "location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table reservation_item
-- ----------------------------
ALTER TABLE "public"."reservation_item" ADD CONSTRAINT "reservation_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table return
-- ----------------------------
CREATE INDEX "IDX_return_claim_id" ON "public"."return" USING btree (
  "claim_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE claim_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_return_display_id" ON "public"."return" USING btree (
  "display_id" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_return_exchange_id" ON "public"."return" USING btree (
  "exchange_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE exchange_id IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX "IDX_return_order_id" ON "public"."return" USING btree (
  "order_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table return
-- ----------------------------
ALTER TABLE "public"."return" ADD CONSTRAINT "return_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table return_fulfillment
-- ----------------------------
CREATE INDEX "IDX_deleted_at_-31ea43a" ON "public"."return_fulfillment" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_fulfillment_id_-31ea43a" ON "public"."return_fulfillment" USING btree (
  "fulfillment_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_id_-31ea43a" ON "public"."return_fulfillment" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_return_id_-31ea43a" ON "public"."return_fulfillment" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table return_fulfillment
-- ----------------------------
ALTER TABLE "public"."return_fulfillment" ADD CONSTRAINT "return_fulfillment_pkey" PRIMARY KEY ("return_id", "fulfillment_id");

-- ----------------------------
-- Indexes structure for table return_item
-- ----------------------------
CREATE INDEX "IDX_return_item_deleted_at" ON "public"."return_item" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_return_item_item_id" ON "public"."return_item" USING btree (
  "item_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_return_item_reason_id" ON "public"."return_item" USING btree (
  "reason_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_return_item_return_id" ON "public"."return_item" USING btree (
  "return_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table return_item
-- ----------------------------
ALTER TABLE "public"."return_item" ADD CONSTRAINT "return_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table return_reason
-- ----------------------------
CREATE INDEX "IDX_return_reason_parent_return_reason_id" ON "public"."return_reason" USING btree (
  "parent_return_reason_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_return_reason_value" ON "public"."return_reason" USING btree (
  "value" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table return_reason
-- ----------------------------
ALTER TABLE "public"."return_reason" ADD CONSTRAINT "return_reason_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sales_channel
-- ----------------------------
CREATE INDEX "IDX_sales_channel_deleted_at" ON "public"."sales_channel" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sales_channel
-- ----------------------------
ALTER TABLE "public"."sales_channel" ADD CONSTRAINT "sales_channel_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sales_channel_stock_location
-- ----------------------------
CREATE INDEX "IDX_deleted_at_26d06f470" ON "public"."sales_channel_stock_location" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_26d06f470" ON "public"."sales_channel_stock_location" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_sales_channel_id_26d06f470" ON "public"."sales_channel_stock_location" USING btree (
  "sales_channel_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_stock_location_id_26d06f470" ON "public"."sales_channel_stock_location" USING btree (
  "stock_location_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table sales_channel_stock_location
-- ----------------------------
ALTER TABLE "public"."sales_channel_stock_location" ADD CONSTRAINT "sales_channel_stock_location_pkey" PRIMARY KEY ("sales_channel_id", "stock_location_id");

-- ----------------------------
-- Indexes structure for table script_migrations
-- ----------------------------
CREATE UNIQUE INDEX "idx_script_name_unique" ON "public"."script_migrations" USING btree (
  "script_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table script_migrations
-- ----------------------------
ALTER TABLE "public"."script_migrations" ADD CONSTRAINT "script_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table service_zone
-- ----------------------------
CREATE INDEX "IDX_service_zone_deleted_at" ON "public"."service_zone" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_service_zone_fulfillment_set_id" ON "public"."service_zone" USING btree (
  "fulfillment_set_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_service_zone_name_unique" ON "public"."service_zone" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table service_zone
-- ----------------------------
ALTER TABLE "public"."service_zone" ADD CONSTRAINT "service_zone_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table shipping_option
-- ----------------------------
CREATE INDEX "IDX_shipping_option_deleted_at" ON "public"."shipping_option" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_shipping_option_provider_id" ON "public"."shipping_option" USING btree (
  "provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_option_service_zone_id" ON "public"."shipping_option" USING btree (
  "service_zone_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_option_shipping_option_type_id" ON "public"."shipping_option" USING btree (
  "shipping_option_type_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_option_shipping_profile_id" ON "public"."shipping_option" USING btree (
  "shipping_profile_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table shipping_option
-- ----------------------------
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_price_type_check" CHECK (price_type = ANY (ARRAY['calculated'::text, 'flat'::text]));

-- ----------------------------
-- Primary Key structure for table shipping_option
-- ----------------------------
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table shipping_option_price_set
-- ----------------------------
CREATE INDEX "IDX_deleted_at_ba32fa9c" ON "public"."shipping_option_price_set" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_ba32fa9c" ON "public"."shipping_option_price_set" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_price_set_id_ba32fa9c" ON "public"."shipping_option_price_set" USING btree (
  "price_set_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_shipping_option_id_ba32fa9c" ON "public"."shipping_option_price_set" USING btree (
  "shipping_option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table shipping_option_price_set
-- ----------------------------
ALTER TABLE "public"."shipping_option_price_set" ADD CONSTRAINT "shipping_option_price_set_pkey" PRIMARY KEY ("shipping_option_id", "price_set_id");

-- ----------------------------
-- Indexes structure for table shipping_option_rule
-- ----------------------------
CREATE INDEX "IDX_shipping_option_rule_deleted_at" ON "public"."shipping_option_rule" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_shipping_option_rule_shipping_option_id" ON "public"."shipping_option_rule" USING btree (
  "shipping_option_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table shipping_option_rule
-- ----------------------------
ALTER TABLE "public"."shipping_option_rule" ADD CONSTRAINT "shipping_option_rule_operator_check" CHECK (operator = ANY (ARRAY['in'::text, 'eq'::text, 'ne'::text, 'gt'::text, 'gte'::text, 'lt'::text, 'lte'::text, 'nin'::text]));

-- ----------------------------
-- Primary Key structure for table shipping_option_rule
-- ----------------------------
ALTER TABLE "public"."shipping_option_rule" ADD CONSTRAINT "shipping_option_rule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table shipping_option_type
-- ----------------------------
CREATE INDEX "IDX_shipping_option_type_deleted_at" ON "public"."shipping_option_type" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table shipping_option_type
-- ----------------------------
ALTER TABLE "public"."shipping_option_type" ADD CONSTRAINT "shipping_option_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table shipping_profile
-- ----------------------------
CREATE INDEX "IDX_shipping_profile_deleted_at" ON "public"."shipping_profile" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE UNIQUE INDEX "IDX_shipping_profile_name_unique" ON "public"."shipping_profile" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table shipping_profile
-- ----------------------------
ALTER TABLE "public"."shipping_profile" ADD CONSTRAINT "shipping_profile_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table stock_location
-- ----------------------------
CREATE UNIQUE INDEX "IDX_stock_location_address_id_unique" ON "public"."stock_location" USING btree (
  "address_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_stock_location_deleted_at" ON "public"."stock_location" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table stock_location
-- ----------------------------
ALTER TABLE "public"."stock_location" ADD CONSTRAINT "stock_location_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table stock_location_address
-- ----------------------------
CREATE INDEX "IDX_stock_location_address_deleted_at" ON "public"."stock_location_address" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table stock_location_address
-- ----------------------------
ALTER TABLE "public"."stock_location_address" ADD CONSTRAINT "stock_location_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table store
-- ----------------------------
CREATE INDEX "IDX_store_deleted_at" ON "public"."store" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;

-- ----------------------------
-- Primary Key structure for table store
-- ----------------------------
ALTER TABLE "public"."store" ADD CONSTRAINT "store_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table store_currency
-- ----------------------------
CREATE INDEX "IDX_store_currency_deleted_at" ON "public"."store_currency" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_store_currency_store_id" ON "public"."store_currency" USING btree (
  "store_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table store_currency
-- ----------------------------
ALTER TABLE "public"."store_currency" ADD CONSTRAINT "store_currency_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table store_locale
-- ----------------------------
CREATE INDEX "IDX_store_locale_deleted_at" ON "public"."store_locale" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_store_locale_store_id" ON "public"."store_locale" USING btree (
  "store_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table store_locale
-- ----------------------------
ALTER TABLE "public"."store_locale" ADD CONSTRAINT "store_locale_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tax_provider
-- ----------------------------
CREATE INDEX "IDX_tax_provider_deleted_at" ON "public"."tax_provider" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table tax_provider
-- ----------------------------
ALTER TABLE "public"."tax_provider" ADD CONSTRAINT "tax_provider_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tax_rate
-- ----------------------------
CREATE UNIQUE INDEX "IDX_single_default_region" ON "public"."tax_rate" USING btree (
  "tax_region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE is_default = true AND deleted_at IS NULL;
CREATE INDEX "IDX_tax_rate_deleted_at" ON "public"."tax_rate" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_tax_rate_tax_region_id" ON "public"."tax_rate" USING btree (
  "tax_region_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table tax_rate
-- ----------------------------
ALTER TABLE "public"."tax_rate" ADD CONSTRAINT "tax_rate_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tax_rate_rule
-- ----------------------------
CREATE INDEX "IDX_tax_rate_rule_deleted_at" ON "public"."tax_rate_rule" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_tax_rate_rule_reference_id" ON "public"."tax_rate_rule" USING btree (
  "reference_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_tax_rate_rule_tax_rate_id" ON "public"."tax_rate_rule" USING btree (
  "tax_rate_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_tax_rate_rule_unique_rate_reference" ON "public"."tax_rate_rule" USING btree (
  "tax_rate_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "reference_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table tax_rate_rule
-- ----------------------------
ALTER TABLE "public"."tax_rate_rule" ADD CONSTRAINT "tax_rate_rule_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tax_region
-- ----------------------------
CREATE INDEX "IDX_tax_region_deleted_at" ON "public"."tax_region" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE INDEX "IDX_tax_region_parent_id" ON "public"."tax_region" USING btree (
  "parent_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_tax_region_provider_id" ON "public"."tax_region" USING btree (
  "provider_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_tax_region_unique_country_nullable_province" ON "public"."tax_region" USING btree (
  "country_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE province_code IS NULL AND deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_tax_region_unique_country_province" ON "public"."tax_region" USING btree (
  "country_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "province_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Checks structure for table tax_region
-- ----------------------------
ALTER TABLE "public"."tax_region" ADD CONSTRAINT "CK_tax_region_country_top_level" CHECK (parent_id IS NULL OR province_code IS NOT NULL);
ALTER TABLE "public"."tax_region" ADD CONSTRAINT "CK_tax_region_provider_top_level" CHECK (parent_id IS NULL OR provider_id IS NULL);

-- ----------------------------
-- Primary Key structure for table tax_region
-- ----------------------------
ALTER TABLE "public"."tax_region" ADD CONSTRAINT "tax_region_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE INDEX "IDX_user_deleted_at" ON "public"."user" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NOT NULL;
CREATE UNIQUE INDEX "IDX_user_email_unique" ON "public"."user" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user_preference
-- ----------------------------
CREATE INDEX "IDX_user_preference_deleted_at" ON "public"."user_preference" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_user_preference_user_id" ON "public"."user_preference" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_user_preference_user_id_key_unique" ON "public"."user_preference" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table user_preference
-- ----------------------------
ALTER TABLE "public"."user_preference" ADD CONSTRAINT "user_preference_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table user_rbac_role
-- ----------------------------
CREATE INDEX "IDX_deleted_at_64ff0c4c" ON "public"."user_rbac_role" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_id_64ff0c4c" ON "public"."user_rbac_role" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "IDX_rbac_role_id_64ff0c4c" ON "public"."user_rbac_role" USING btree (
  "rbac_role_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_user_id_64ff0c4c" ON "public"."user_rbac_role" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table user_rbac_role
-- ----------------------------
ALTER TABLE "public"."user_rbac_role" ADD CONSTRAINT "user_rbac_role_pkey" PRIMARY KEY ("user_id", "rbac_role_id");

-- ----------------------------
-- Indexes structure for table view_configuration
-- ----------------------------
CREATE INDEX "IDX_view_configuration_deleted_at" ON "public"."view_configuration" USING btree (
  "deleted_at" "pg_catalog"."timestamptz_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_view_configuration_entity_is_system_default" ON "public"."view_configuration" USING btree (
  "entity" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "is_system_default" "pg_catalog"."bool_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_view_configuration_entity_user_id" ON "public"."view_configuration" USING btree (
  "entity" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_view_configuration_user_id" ON "public"."view_configuration" USING btree (
  "user_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table view_configuration
-- ----------------------------
ALTER TABLE "public"."view_configuration" ADD CONSTRAINT "view_configuration_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table workflow_execution
-- ----------------------------
CREATE INDEX "IDX_workflow_execution_deleted_at" ON "public"."workflow_execution" USING btree (
  "deleted_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_id" ON "public"."workflow_execution" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_retention_time_updated_at_state" ON "public"."workflow_execution" USING btree (
  "retention_time" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST,
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND retention_time IS NOT NULL;
CREATE INDEX "IDX_workflow_execution_run_id" ON "public"."workflow_execution" USING btree (
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_state" ON "public"."workflow_execution" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_state_updated_at" ON "public"."workflow_execution" USING btree (
  "state" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_transaction_id" ON "public"."workflow_execution" USING btree (
  "transaction_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_updated_at_retention_time" ON "public"."workflow_execution" USING btree (
  "updated_at" "pg_catalog"."timestamp_ops" ASC NULLS LAST,
  "retention_time" "pg_catalog"."int4_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL AND retention_time IS NOT NULL AND (state::text = ANY (ARRAY['done'::character varying, 'failed'::character varying, 'reverted'::character varying]::text[]));
CREATE INDEX "IDX_workflow_execution_workflow_id" ON "public"."workflow_execution" USING btree (
  "workflow_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE INDEX "IDX_workflow_execution_workflow_id_transaction_id" ON "public"."workflow_execution" USING btree (
  "workflow_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "transaction_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;
CREATE UNIQUE INDEX "IDX_workflow_execution_workflow_id_transaction_id_run_id_unique" ON "public"."workflow_execution" USING btree (
  "workflow_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "transaction_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "run_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
) WHERE deleted_at IS NULL;

-- ----------------------------
-- Primary Key structure for table workflow_execution
-- ----------------------------
ALTER TABLE "public"."workflow_execution" ADD CONSTRAINT "workflow_execution_pkey" PRIMARY KEY ("workflow_id", "transaction_id", "run_id");

-- ----------------------------
-- Foreign Keys structure for table application_method_buy_rules
-- ----------------------------
ALTER TABLE "public"."application_method_buy_rules" ADD CONSTRAINT "application_method_buy_rules_application_method_id_foreign" FOREIGN KEY ("application_method_id") REFERENCES "public"."promotion_application_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."application_method_buy_rules" ADD CONSTRAINT "application_method_buy_rules_promotion_rule_id_foreign" FOREIGN KEY ("promotion_rule_id") REFERENCES "public"."promotion_rule" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table application_method_target_rules
-- ----------------------------
ALTER TABLE "public"."application_method_target_rules" ADD CONSTRAINT "application_method_target_rules_application_method_id_foreign" FOREIGN KEY ("application_method_id") REFERENCES "public"."promotion_application_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."application_method_target_rules" ADD CONSTRAINT "application_method_target_rules_promotion_rule_id_foreign" FOREIGN KEY ("promotion_rule_id") REFERENCES "public"."promotion_rule" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table capture
-- ----------------------------
ALTER TABLE "public"."capture" ADD CONSTRAINT "capture_payment_id_foreign" FOREIGN KEY ("payment_id") REFERENCES "public"."payment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart
-- ----------------------------
ALTER TABLE "public"."cart" ADD CONSTRAINT "cart_billing_address_id_foreign" FOREIGN KEY ("billing_address_id") REFERENCES "public"."cart_address" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."cart" ADD CONSTRAINT "cart_shipping_address_id_foreign" FOREIGN KEY ("shipping_address_id") REFERENCES "public"."cart_address" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_line_item
-- ----------------------------
ALTER TABLE "public"."cart_line_item" ADD CONSTRAINT "cart_line_item_cart_id_foreign" FOREIGN KEY ("cart_id") REFERENCES "public"."cart" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_line_item_adjustment
-- ----------------------------
ALTER TABLE "public"."cart_line_item_adjustment" ADD CONSTRAINT "cart_line_item_adjustment_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "public"."cart_line_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_line_item_tax_line
-- ----------------------------
ALTER TABLE "public"."cart_line_item_tax_line" ADD CONSTRAINT "cart_line_item_tax_line_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "public"."cart_line_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_shipping_method
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method" ADD CONSTRAINT "cart_shipping_method_cart_id_foreign" FOREIGN KEY ("cart_id") REFERENCES "public"."cart" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_shipping_method_adjustment
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method_adjustment" ADD CONSTRAINT "cart_shipping_method_adjustment_shipping_method_id_foreign" FOREIGN KEY ("shipping_method_id") REFERENCES "public"."cart_shipping_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table cart_shipping_method_tax_line
-- ----------------------------
ALTER TABLE "public"."cart_shipping_method_tax_line" ADD CONSTRAINT "cart_shipping_method_tax_line_shipping_method_id_foreign" FOREIGN KEY ("shipping_method_id") REFERENCES "public"."cart_shipping_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table credit_line
-- ----------------------------
ALTER TABLE "public"."credit_line" ADD CONSTRAINT "credit_line_cart_id_foreign" FOREIGN KEY ("cart_id") REFERENCES "public"."cart" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table customer_address
-- ----------------------------
ALTER TABLE "public"."customer_address" ADD CONSTRAINT "customer_address_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table customer_group_customer
-- ----------------------------
ALTER TABLE "public"."customer_group_customer" ADD CONSTRAINT "customer_group_customer_customer_group_id_foreign" FOREIGN KEY ("customer_group_id") REFERENCES "public"."customer_group" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."customer_group_customer" ADD CONSTRAINT "customer_group_customer_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table fulfillment
-- ----------------------------
ALTER TABLE "public"."fulfillment" ADD CONSTRAINT "fulfillment_delivery_address_id_foreign" FOREIGN KEY ("delivery_address_id") REFERENCES "public"."fulfillment_address" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."fulfillment" ADD CONSTRAINT "fulfillment_provider_id_foreign" FOREIGN KEY ("provider_id") REFERENCES "public"."fulfillment_provider" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."fulfillment" ADD CONSTRAINT "fulfillment_shipping_option_id_foreign" FOREIGN KEY ("shipping_option_id") REFERENCES "public"."shipping_option" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table fulfillment_item
-- ----------------------------
ALTER TABLE "public"."fulfillment_item" ADD CONSTRAINT "fulfillment_item_fulfillment_id_foreign" FOREIGN KEY ("fulfillment_id") REFERENCES "public"."fulfillment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table fulfillment_label
-- ----------------------------
ALTER TABLE "public"."fulfillment_label" ADD CONSTRAINT "fulfillment_label_fulfillment_id_foreign" FOREIGN KEY ("fulfillment_id") REFERENCES "public"."fulfillment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table geo_zone
-- ----------------------------
ALTER TABLE "public"."geo_zone" ADD CONSTRAINT "geo_zone_service_zone_id_foreign" FOREIGN KEY ("service_zone_id") REFERENCES "public"."service_zone" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table image
-- ----------------------------
ALTER TABLE "public"."image" ADD CONSTRAINT "image_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table inventory_level
-- ----------------------------
ALTER TABLE "public"."inventory_level" ADD CONSTRAINT "inventory_level_inventory_item_id_foreign" FOREIGN KEY ("inventory_item_id") REFERENCES "public"."inventory_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table notification
-- ----------------------------
ALTER TABLE "public"."notification" ADD CONSTRAINT "notification_provider_id_foreign" FOREIGN KEY ("provider_id") REFERENCES "public"."notification_provider" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order
-- ----------------------------
ALTER TABLE "public"."order" ADD CONSTRAINT "order_billing_address_id_foreign" FOREIGN KEY ("billing_address_id") REFERENCES "public"."order_address" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."order" ADD CONSTRAINT "order_shipping_address_id_foreign" FOREIGN KEY ("shipping_address_id") REFERENCES "public"."order_address" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_change
-- ----------------------------
ALTER TABLE "public"."order_change" ADD CONSTRAINT "order_change_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_change_action
-- ----------------------------
ALTER TABLE "public"."order_change_action" ADD CONSTRAINT "order_change_action_order_change_id_foreign" FOREIGN KEY ("order_change_id") REFERENCES "public"."order_change" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_credit_line
-- ----------------------------
ALTER TABLE "public"."order_credit_line" ADD CONSTRAINT "order_credit_line_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_item
-- ----------------------------
ALTER TABLE "public"."order_item" ADD CONSTRAINT "order_item_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "public"."order_line_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."order_item" ADD CONSTRAINT "order_item_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_line_item
-- ----------------------------
ALTER TABLE "public"."order_line_item" ADD CONSTRAINT "order_line_item_totals_id_foreign" FOREIGN KEY ("totals_id") REFERENCES "public"."order_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_line_item_adjustment
-- ----------------------------
ALTER TABLE "public"."order_line_item_adjustment" ADD CONSTRAINT "order_line_item_adjustment_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "public"."order_line_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_line_item_tax_line
-- ----------------------------
ALTER TABLE "public"."order_line_item_tax_line" ADD CONSTRAINT "order_line_item_tax_line_item_id_foreign" FOREIGN KEY ("item_id") REFERENCES "public"."order_line_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_shipping
-- ----------------------------
ALTER TABLE "public"."order_shipping" ADD CONSTRAINT "order_shipping_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_shipping_method_adjustment
-- ----------------------------
ALTER TABLE "public"."order_shipping_method_adjustment" ADD CONSTRAINT "order_shipping_method_adjustment_shipping_method_id_foreign" FOREIGN KEY ("shipping_method_id") REFERENCES "public"."order_shipping_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_shipping_method_tax_line
-- ----------------------------
ALTER TABLE "public"."order_shipping_method_tax_line" ADD CONSTRAINT "order_shipping_method_tax_line_shipping_method_id_foreign" FOREIGN KEY ("shipping_method_id") REFERENCES "public"."order_shipping_method" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_summary
-- ----------------------------
ALTER TABLE "public"."order_summary" ADD CONSTRAINT "order_summary_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table order_transaction
-- ----------------------------
ALTER TABLE "public"."order_transaction" ADD CONSTRAINT "order_transaction_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."order" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payment
-- ----------------------------
ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_payment_collection_id_foreign" FOREIGN KEY ("payment_collection_id") REFERENCES "public"."payment_collection" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payment_collection_payment_providers
-- ----------------------------
ALTER TABLE "public"."payment_collection_payment_providers" ADD CONSTRAINT "payment_collection_payment_providers_payment_col_aa276_foreign" FOREIGN KEY ("payment_collection_id") REFERENCES "public"."payment_collection" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."payment_collection_payment_providers" ADD CONSTRAINT "payment_collection_payment_providers_payment_pro_2d555_foreign" FOREIGN KEY ("payment_provider_id") REFERENCES "public"."payment_provider" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payment_session
-- ----------------------------
ALTER TABLE "public"."payment_session" ADD CONSTRAINT "payment_session_payment_collection_id_foreign" FOREIGN KEY ("payment_collection_id") REFERENCES "public"."payment_collection" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table price
-- ----------------------------
ALTER TABLE "public"."price" ADD CONSTRAINT "price_price_list_id_foreign" FOREIGN KEY ("price_list_id") REFERENCES "public"."price_list" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."price" ADD CONSTRAINT "price_price_set_id_foreign" FOREIGN KEY ("price_set_id") REFERENCES "public"."price_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table price_list_rule
-- ----------------------------
ALTER TABLE "public"."price_list_rule" ADD CONSTRAINT "price_list_rule_price_list_id_foreign" FOREIGN KEY ("price_list_id") REFERENCES "public"."price_list" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table price_rule
-- ----------------------------
ALTER TABLE "public"."price_rule" ADD CONSTRAINT "price_rule_price_id_foreign" FOREIGN KEY ("price_id") REFERENCES "public"."price" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_collection_id_foreign" FOREIGN KEY ("collection_id") REFERENCES "public"."product_collection" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."product" ADD CONSTRAINT "product_type_id_foreign" FOREIGN KEY ("type_id") REFERENCES "public"."product_type" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_category
-- ----------------------------
ALTER TABLE "public"."product_category" ADD CONSTRAINT "product_category_parent_category_id_foreign" FOREIGN KEY ("parent_category_id") REFERENCES "public"."product_category" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_category_product
-- ----------------------------
ALTER TABLE "public"."product_category_product" ADD CONSTRAINT "product_category_product_product_category_id_foreign" FOREIGN KEY ("product_category_id") REFERENCES "public"."product_category" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."product_category_product" ADD CONSTRAINT "product_category_product_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_option
-- ----------------------------
ALTER TABLE "public"."product_option" ADD CONSTRAINT "product_option_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_option_value
-- ----------------------------
ALTER TABLE "public"."product_option_value" ADD CONSTRAINT "product_option_value_option_id_foreign" FOREIGN KEY ("option_id") REFERENCES "public"."product_option" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_tags
-- ----------------------------
ALTER TABLE "public"."product_tags" ADD CONSTRAINT "product_tags_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."product_tags" ADD CONSTRAINT "product_tags_product_tag_id_foreign" FOREIGN KEY ("product_tag_id") REFERENCES "public"."product_tag" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_variant
-- ----------------------------
ALTER TABLE "public"."product_variant" ADD CONSTRAINT "product_variant_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."product" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_variant_option
-- ----------------------------
ALTER TABLE "public"."product_variant_option" ADD CONSTRAINT "product_variant_option_option_value_id_foreign" FOREIGN KEY ("option_value_id") REFERENCES "public"."product_option_value" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."product_variant_option" ADD CONSTRAINT "product_variant_option_variant_id_foreign" FOREIGN KEY ("variant_id") REFERENCES "public"."product_variant" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table product_variant_product_image
-- ----------------------------
ALTER TABLE "public"."product_variant_product_image" ADD CONSTRAINT "product_variant_product_image_image_id_foreign" FOREIGN KEY ("image_id") REFERENCES "public"."image" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table promotion
-- ----------------------------
ALTER TABLE "public"."promotion" ADD CONSTRAINT "promotion_campaign_id_foreign" FOREIGN KEY ("campaign_id") REFERENCES "public"."promotion_campaign" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table promotion_application_method
-- ----------------------------
ALTER TABLE "public"."promotion_application_method" ADD CONSTRAINT "promotion_application_method_promotion_id_foreign" FOREIGN KEY ("promotion_id") REFERENCES "public"."promotion" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table promotion_campaign_budget
-- ----------------------------
ALTER TABLE "public"."promotion_campaign_budget" ADD CONSTRAINT "promotion_campaign_budget_campaign_id_foreign" FOREIGN KEY ("campaign_id") REFERENCES "public"."promotion_campaign" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table promotion_campaign_budget_usage
-- ----------------------------
ALTER TABLE "public"."promotion_campaign_budget_usage" ADD CONSTRAINT "promotion_campaign_budget_usage_budget_id_foreign" FOREIGN KEY ("budget_id") REFERENCES "public"."promotion_campaign_budget" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table promotion_promotion_rule
-- ----------------------------
ALTER TABLE "public"."promotion_promotion_rule" ADD CONSTRAINT "promotion_promotion_rule_promotion_id_foreign" FOREIGN KEY ("promotion_id") REFERENCES "public"."promotion" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."promotion_promotion_rule" ADD CONSTRAINT "promotion_promotion_rule_promotion_rule_id_foreign" FOREIGN KEY ("promotion_rule_id") REFERENCES "public"."promotion_rule" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table promotion_rule_value
-- ----------------------------
ALTER TABLE "public"."promotion_rule_value" ADD CONSTRAINT "promotion_rule_value_promotion_rule_id_foreign" FOREIGN KEY ("promotion_rule_id") REFERENCES "public"."promotion_rule" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table provider_identity
-- ----------------------------
ALTER TABLE "public"."provider_identity" ADD CONSTRAINT "provider_identity_auth_identity_id_foreign" FOREIGN KEY ("auth_identity_id") REFERENCES "public"."auth_identity" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table refund
-- ----------------------------
ALTER TABLE "public"."refund" ADD CONSTRAINT "refund_payment_id_foreign" FOREIGN KEY ("payment_id") REFERENCES "public"."payment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table region_country
-- ----------------------------
ALTER TABLE "public"."region_country" ADD CONSTRAINT "region_country_region_id_foreign" FOREIGN KEY ("region_id") REFERENCES "public"."region" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table reservation_item
-- ----------------------------
ALTER TABLE "public"."reservation_item" ADD CONSTRAINT "reservation_item_inventory_item_id_foreign" FOREIGN KEY ("inventory_item_id") REFERENCES "public"."inventory_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table return_reason
-- ----------------------------
ALTER TABLE "public"."return_reason" ADD CONSTRAINT "return_reason_parent_return_reason_id_foreign" FOREIGN KEY ("parent_return_reason_id") REFERENCES "public"."return_reason" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table service_zone
-- ----------------------------
ALTER TABLE "public"."service_zone" ADD CONSTRAINT "service_zone_fulfillment_set_id_foreign" FOREIGN KEY ("fulfillment_set_id") REFERENCES "public"."fulfillment_set" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table shipping_option
-- ----------------------------
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_provider_id_foreign" FOREIGN KEY ("provider_id") REFERENCES "public"."fulfillment_provider" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_service_zone_id_foreign" FOREIGN KEY ("service_zone_id") REFERENCES "public"."service_zone" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_shipping_option_type_id_foreign" FOREIGN KEY ("shipping_option_type_id") REFERENCES "public"."shipping_option_type" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE "public"."shipping_option" ADD CONSTRAINT "shipping_option_shipping_profile_id_foreign" FOREIGN KEY ("shipping_profile_id") REFERENCES "public"."shipping_profile" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table shipping_option_rule
-- ----------------------------
ALTER TABLE "public"."shipping_option_rule" ADD CONSTRAINT "shipping_option_rule_shipping_option_id_foreign" FOREIGN KEY ("shipping_option_id") REFERENCES "public"."shipping_option" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table stock_location
-- ----------------------------
ALTER TABLE "public"."stock_location" ADD CONSTRAINT "stock_location_address_id_foreign" FOREIGN KEY ("address_id") REFERENCES "public"."stock_location_address" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table store_currency
-- ----------------------------
ALTER TABLE "public"."store_currency" ADD CONSTRAINT "store_currency_store_id_foreign" FOREIGN KEY ("store_id") REFERENCES "public"."store" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table store_locale
-- ----------------------------
ALTER TABLE "public"."store_locale" ADD CONSTRAINT "store_locale_store_id_foreign" FOREIGN KEY ("store_id") REFERENCES "public"."store" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table tax_rate
-- ----------------------------
ALTER TABLE "public"."tax_rate" ADD CONSTRAINT "FK_tax_rate_tax_region_id" FOREIGN KEY ("tax_region_id") REFERENCES "public"."tax_region" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tax_rate_rule
-- ----------------------------
ALTER TABLE "public"."tax_rate_rule" ADD CONSTRAINT "FK_tax_rate_rule_tax_rate_id" FOREIGN KEY ("tax_rate_id") REFERENCES "public"."tax_rate" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tax_region
-- ----------------------------
ALTER TABLE "public"."tax_region" ADD CONSTRAINT "FK_tax_region_parent_id" FOREIGN KEY ("parent_id") REFERENCES "public"."tax_region" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."tax_region" ADD CONSTRAINT "FK_tax_region_provider_id" FOREIGN KEY ("provider_id") REFERENCES "public"."tax_provider" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
