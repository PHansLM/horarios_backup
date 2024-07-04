/*
 Navicat Premium Data Transfer

 Source Server         : noraaC
 Source Server Type    : PostgreSQL
 Source Server Version : 120017 (120017)
 Source Host           : localhost:5432
 Source Catalog        : umsshorarios
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120017 (120017)
 File Encoding         : 65001

 Date: 04/07/2024 18:42:11
*/


-- ----------------------------
-- Sequence structure for carrera_id_carrera_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."carrera_id_carrera_seq";
CREATE SEQUENCE "public"."carrera_id_carrera_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for grupo_id_grupo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."grupo_id_grupo_seq";
CREATE SEQUENCE "public"."grupo_id_grupo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for materia_id_materia_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."materia_id_materia_seq";
CREATE SEQUENCE "public"."materia_id_materia_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for periodo_id_periodo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."periodo_id_periodo_seq";
CREATE SEQUENCE "public"."periodo_id_periodo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS "public"."carrera";
CREATE TABLE "public"."carrera" (
  "id_carrera" int4 NOT NULL DEFAULT nextval('carrera_id_carrera_seq'::regclass),
  "nombre_carrera" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo_carrera" varchar(10) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS "public"."clase";
CREATE TABLE "public"."clase" (
  "id_grupo" int4 NOT NULL,
  "id_periodo" int4 NOT NULL,
  "aula" varchar(6) COLLATE "pg_catalog"."default" NOT NULL,
  "dia" int2 NOT NULL
)
;

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupo";
CREATE TABLE "public"."grupo" (
  "id_grupo" int4 NOT NULL DEFAULT nextval('grupo_id_grupo_seq'::regclass),
  "numero_grupo" int4 NOT NULL,
  "nombre_docente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_materia" int4
)
;

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS "public"."materia";
CREATE TABLE "public"."materia" (
  "id_materia" int4 NOT NULL DEFAULT nextval('materia_id_materia_seq'::regclass),
  "nombre_materia" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo_materia" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "id_carrera" int4,
  "nivel" char(1) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS "public"."periodo";
CREATE TABLE "public"."periodo" (
  "id_periodo" int4 NOT NULL DEFAULT nextval('periodo_id_periodo_seq'::regclass),
  "hora_inicio" time(6) NOT NULL,
  "hora_fin" time(6) NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."carrera_id_carrera_seq"
OWNED BY "public"."carrera"."id_carrera";
SELECT setval('"public"."carrera_id_carrera_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."grupo_id_grupo_seq"
OWNED BY "public"."grupo"."id_grupo";
SELECT setval('"public"."grupo_id_grupo_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."materia_id_materia_seq"
OWNED BY "public"."materia"."id_materia";
SELECT setval('"public"."materia_id_materia_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."periodo_id_periodo_seq"
OWNED BY "public"."periodo"."id_periodo";
SELECT setval('"public"."periodo_id_periodo_seq"', 1, false);

-- ----------------------------
-- Uniques structure for table carrera
-- ----------------------------
ALTER TABLE "public"."carrera" ADD CONSTRAINT "carrera_codigo_carrera_key" UNIQUE ("codigo_carrera");

-- ----------------------------
-- Primary Key structure for table carrera
-- ----------------------------
ALTER TABLE "public"."carrera" ADD CONSTRAINT "carrera_pkey" PRIMARY KEY ("id_carrera");

-- ----------------------------
-- Primary Key structure for table clase
-- ----------------------------
ALTER TABLE "public"."clase" ADD CONSTRAINT "clase_pkey" PRIMARY KEY ("id_grupo", "id_periodo", "dia");

-- ----------------------------
-- Primary Key structure for table grupo
-- ----------------------------
ALTER TABLE "public"."grupo" ADD CONSTRAINT "grupo_pkey" PRIMARY KEY ("id_grupo");

-- ----------------------------
-- Uniques structure for table materia
-- ----------------------------
ALTER TABLE "public"."materia" ADD CONSTRAINT "materia_codigo_materia_key" UNIQUE ("codigo_materia");

-- ----------------------------
-- Primary Key structure for table materia
-- ----------------------------
ALTER TABLE "public"."materia" ADD CONSTRAINT "materia_pkey" PRIMARY KEY ("id_materia");

-- ----------------------------
-- Primary Key structure for table periodo
-- ----------------------------
ALTER TABLE "public"."periodo" ADD CONSTRAINT "periodo_pkey" PRIMARY KEY ("id_periodo");

-- ----------------------------
-- Foreign Keys structure for table clase
-- ----------------------------
ALTER TABLE "public"."clase" ADD CONSTRAINT "clase_id_grupo_fkey" FOREIGN KEY ("id_grupo") REFERENCES "public"."grupo" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."clase" ADD CONSTRAINT "clase_id_periodo_fkey" FOREIGN KEY ("id_periodo") REFERENCES "public"."periodo" ("id_periodo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table grupo
-- ----------------------------
ALTER TABLE "public"."grupo" ADD CONSTRAINT "grupo_id_materia_fkey" FOREIGN KEY ("id_materia") REFERENCES "public"."materia" ("id_materia") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table materia
-- ----------------------------
ALTER TABLE "public"."materia" ADD CONSTRAINT "materia_id_carrera_fkey" FOREIGN KEY ("id_carrera") REFERENCES "public"."carrera" ("id_carrera") ON DELETE NO ACTION ON UPDATE NO ACTION;
