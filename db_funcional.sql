-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

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
-- Sequence structure for carrera_id_carrera_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."carrera_id_carrera_seq1";
CREATE SEQUENCE "public"."carrera_id_carrera_seq1" 
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
-- Sequence structure for grupo_id_grupo_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."grupo_id_grupo_seq1";
CREATE SEQUENCE "public"."grupo_id_grupo_seq1" 
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
-- Sequence structure for materia_id_materia_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."materia_id_materia_seq1";
CREATE SEQUENCE "public"."materia_id_materia_seq1" 
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
-- Sequence structure for periodo_id_periodo_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."periodo_id_periodo_seq1";
CREATE SEQUENCE "public"."periodo_id_periodo_seq1" 
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
  "id_carrera" int4 NOT NULL DEFAULT nextval('carrera_id_carrera_seq1'::regclass),
  "nombre_carrera" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo_carrera" varchar(10) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO "public"."carrera" VALUES (2, 'LICENCIATURA EN INGENIERIA INFORMATICA', '134111');

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS "public"."clase";
CREATE TABLE "public"."clase" (
  "id_grupo" int4 NOT NULL,
  "id_periodo" int4 NOT NULL,
  "aula" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dia" int2 NOT NULL
)
;

-- ----------------------------
-- Records of clase
-- ----------------------------
INSERT INTO "public"."clase" VALUES (63, 2, '693B', 2);
INSERT INTO "public"."clase" VALUES (63, 2, '691D', 5);
INSERT INTO "public"."clase" VALUES (64, 4, '690D', 2);
INSERT INTO "public"."clase" VALUES (64, 3, '690D', 5);
INSERT INTO "public"."clase" VALUES (65, 1, '681B', 1);
INSERT INTO "public"."clase" VALUES (65, 1, '692H', 3);
INSERT INTO "public"."clase" VALUES (66, 3, '692F', 4);
INSERT INTO "public"."clase" VALUES (66, 4, '691B', 5);
INSERT INTO "public"."clase" VALUES (67, 4, '651', 2);
INSERT INTO "public"."clase" VALUES (67, 6, '692C', 3);
INSERT INTO "public"."clase" VALUES (68, 1, '621', 4);
INSERT INTO "public"."clase" VALUES (69, 3, '620', 1);
INSERT INTO "public"."clase" VALUES (70, 5, '620', 3);
INSERT INTO "public"."clase" VALUES (71, 3, '621', 3);
INSERT INTO "public"."clase" VALUES (72, 4, '620', 3);
INSERT INTO "public"."clase" VALUES (73, 4, '620', 4);
INSERT INTO "public"."clase" VALUES (74, 3, '661', 2);
INSERT INTO "public"."clase" VALUES (74, 2, '692C', 3);
INSERT INTO "public"."clase" VALUES (74, 3, '692F', 5);
INSERT INTO "public"."clase" VALUES (75, 8, '642', 1);
INSERT INTO "public"."clase" VALUES (75, 7, '617', 2);
INSERT INTO "public"."clase" VALUES (75, 6, '607', 3);
INSERT INTO "public"."clase" VALUES (76, 4, '691C', 3);
INSERT INTO "public"."clase" VALUES (76, 1, '625D', 4);
INSERT INTO "public"."clase" VALUES (76, 5, '607', 5);
INSERT INTO "public"."clase" VALUES (77, 1, '642', 3);
INSERT INTO "public"."clase" VALUES (77, 1, '642', 5);
INSERT INTO "public"."clase" VALUES (77, 3, '617C', 6);
INSERT INTO "public"."clase" VALUES (78, 1, '622', 1);
INSERT INTO "public"."clase" VALUES (78, 2, '690B', 2);
INSERT INTO "public"."clase" VALUES (78, 2, '692E', 4);
INSERT INTO "public"."clase" VALUES (79, 4, '691A', 4);
INSERT INTO "public"."clase" VALUES (79, 4, '691E', 5);
INSERT INTO "public"."clase" VALUES (79, 8, '623', 5);
INSERT INTO "public"."clase" VALUES (80, 3, '691B', 2);
INSERT INTO "public"."clase" VALUES (80, 3, '691A', 4);
INSERT INTO "public"."clase" VALUES (80, 6, '691B', 4);
INSERT INTO "public"."clase" VALUES (81, 8, '617', 2);
INSERT INTO "public"."clase" VALUES (81, 8, '691B', 3);
INSERT INTO "public"."clase" VALUES (81, 7, '624', 4);
INSERT INTO "public"."clase" VALUES (82, 5, '607', 1);
INSERT INTO "public"."clase" VALUES (82, 5, '612', 3);
INSERT INTO "public"."clase" VALUES (82, 5, '624', 5);
INSERT INTO "public"."clase" VALUES (83, 7, '623', 2);
INSERT INTO "public"."clase" VALUES (83, 7, '693C', 3);
INSERT INTO "public"."clase" VALUES (83, 8, '691E', 5);
INSERT INTO "public"."clase" VALUES (84, 3, '690B', 3);
INSERT INTO "public"."clase" VALUES (84, 3, '623', 4);
INSERT INTO "public"."clase" VALUES (84, 3, '691C', 6);
INSERT INTO "public"."clase" VALUES (85, 8, '692D', 3);
INSERT INTO "public"."clase" VALUES (85, 8, '691E', 4);
INSERT INTO "public"."clase" VALUES (85, 2, '661', 6);
INSERT INTO "public"."clase" VALUES (86, 5, '690C', 2);
INSERT INTO "public"."clase" VALUES (86, 7, '692E', 3);
INSERT INTO "public"."clase" VALUES (86, 2, '691F', 4);
INSERT INTO "public"."clase" VALUES (87, 3, '644', 2);
INSERT INTO "public"."clase" VALUES (87, 1, '661', 4);
INSERT INTO "public"."clase" VALUES (88, 3, '691B', 4);
INSERT INTO "public"."clase" VALUES (88, 3, '691C', 5);
INSERT INTO "public"."clase" VALUES (89, 1, '692G', 2);
INSERT INTO "public"."clase" VALUES (89, 1, '652D', 5);
INSERT INTO "public"."clase" VALUES (90, 8, '690E', 1);
INSERT INTO "public"."clase" VALUES (90, 8, '692A', 2);
INSERT INTO "public"."clase" VALUES (90, 9, '690E', 4);
INSERT INTO "public"."clase" VALUES (91, 7, '660', 4);
INSERT INTO "public"."clase" VALUES (91, 8, '691A', 5);
INSERT INTO "public"."clase" VALUES (91, 2, '692A', 6);
INSERT INTO "public"."clase" VALUES (92, 4, '624', 1);
INSERT INTO "public"."clase" VALUES (92, 6, '692D', 2);
INSERT INTO "public"."clase" VALUES (92, 6, '692B', 4);
INSERT INTO "public"."clase" VALUES (93, 3, '612', 2);
INSERT INTO "public"."clase" VALUES (93, 6, '624', 3);
INSERT INTO "public"."clase" VALUES (93, 5, '617C', 5);
INSERT INTO "public"."clase" VALUES (94, 3, '691D', 3);
INSERT INTO "public"."clase" VALUES (94, 6, '625C', 3);
INSERT INTO "public"."clase" VALUES (94, 6, '693A', 4);
INSERT INTO "public"."clase" VALUES (95, 2, '617C', 2);
INSERT INTO "public"."clase" VALUES (95, 4, '651', 3);
INSERT INTO "public"."clase" VALUES (95, 2, '690C', 5);
INSERT INTO "public"."clase" VALUES (96, 5, '623', 1);
INSERT INTO "public"."clase" VALUES (96, 7, '623', 3);
INSERT INTO "public"."clase" VALUES (96, 5, '624', 4);
INSERT INTO "public"."clase" VALUES (97, 9, '622', 2);
INSERT INTO "public"."clase" VALUES (97, 1, '691C', 3);
INSERT INTO "public"."clase" VALUES (97, 5, '690C', 4);
INSERT INTO "public"."clase" VALUES (98, 5, '691B', 1);
INSERT INTO "public"."clase" VALUES (98, 6, '607', 2);
INSERT INTO "public"."clase" VALUES (98, 6, '693D', 4);
INSERT INTO "public"."clase" VALUES (99, 8, '651', 1);
INSERT INTO "public"."clase" VALUES (99, 4, '690D', 2);
INSERT INTO "public"."clase" VALUES (100, 6, '691B', 1);
INSERT INTO "public"."clase" VALUES (100, 6, '624', 4);
INSERT INTO "public"."clase" VALUES (101, 3, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (101, 1, 'INFLAB', 3);
INSERT INTO "public"."clase" VALUES (101, 4, '691A', 5);
INSERT INTO "public"."clase" VALUES (102, 6, '622', 1);
INSERT INTO "public"."clase" VALUES (102, 4, '693A', 2);
INSERT INTO "public"."clase" VALUES (102, 1, '693D', 4);
INSERT INTO "public"."clase" VALUES (103, 2, '644', 1);
INSERT INTO "public"."clase" VALUES (103, 7, '692H', 2);
INSERT INTO "public"."clase" VALUES (103, 7, '690D', 3);
INSERT INTO "public"."clase" VALUES (104, 1, '617C', 1);
INSERT INTO "public"."clase" VALUES (104, 1, '607', 2);
INSERT INTO "public"."clase" VALUES (104, 6, '690B', 4);
INSERT INTO "public"."clase" VALUES (105, 7, '691F', 2);
INSERT INTO "public"."clase" VALUES (105, 8, '692C', 4);
INSERT INTO "public"."clase" VALUES (106, 2, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (106, 2, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (106, 5, '690B', 4);
INSERT INTO "public"."clase" VALUES (107, 2, '690E', 2);
INSERT INTO "public"."clase" VALUES (107, 2, '660', 4);
INSERT INTO "public"."clase" VALUES (108, 4, '652', 1);
INSERT INTO "public"."clase" VALUES (108, 2, '625D', 2);
INSERT INTO "public"."clase" VALUES (108, 2, '652', 3);
INSERT INTO "public"."clase" VALUES (109, 1, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (109, 1, '651', 5);
INSERT INTO "public"."clase" VALUES (109, 1, '651', 6);
INSERT INTO "public"."clase" VALUES (110, 3, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (110, 3, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (110, 3, '690E', 3);
INSERT INTO "public"."clase" VALUES (111, 5, '691D', 1);
INSERT INTO "public"."clase" VALUES (111, 9, '691E', 5);
INSERT INTO "public"."clase" VALUES (111, 4, '691B', 6);
INSERT INTO "public"."clase" VALUES (112, 3, '612', 1);
INSERT INTO "public"."clase" VALUES (112, 5, '624', 2);
INSERT INTO "public"."clase" VALUES (112, 3, '642', 5);
INSERT INTO "public"."clase" VALUES (113, 7, '691B', 2);
INSERT INTO "public"."clase" VALUES (113, 7, '661', 3);
INSERT INTO "public"."clase" VALUES (113, 7, '691E', 4);
INSERT INTO "public"."clase" VALUES (114, 5, '691B', 2);
INSERT INTO "public"."clase" VALUES (114, 5, '691B', 3);
INSERT INTO "public"."clase" VALUES (114, 5, '693D', 4);
INSERT INTO "public"."clase" VALUES (115, 1, '692H', 1);
INSERT INTO "public"."clase" VALUES (115, 1, '693B', 2);
INSERT INTO "public"."clase" VALUES (115, 1, '692D', 5);
INSERT INTO "public"."clase" VALUES (116, 7, '692B', 3);
INSERT INTO "public"."clase" VALUES (116, 3, '607', 4);
INSERT INTO "public"."clase" VALUES (116, 3, '691E', 5);
INSERT INTO "public"."clase" VALUES (117, 8, '691B', 1);
INSERT INTO "public"."clase" VALUES (117, 8, '617B', 2);
INSERT INTO "public"."clase" VALUES (117, 4, '693A', 3);
INSERT INTO "public"."clase" VALUES (118, 2, '625D', 1);
INSERT INTO "public"."clase" VALUES (118, 6, '690D', 2);
INSERT INTO "public"."clase" VALUES (118, 1, '612', 3);
INSERT INTO "public"."clase" VALUES (119, 1, '691C', 2);
INSERT INTO "public"."clase" VALUES (119, 1, '690D', 4);
INSERT INTO "public"."clase" VALUES (119, 1, '693D', 5);
INSERT INTO "public"."clase" VALUES (120, 1, '617B', 1);
INSERT INTO "public"."clase" VALUES (120, 1, '691F', 2);
INSERT INTO "public"."clase" VALUES (120, 2, '617B', 3);
INSERT INTO "public"."clase" VALUES (121, 5, '692B', 1);
INSERT INTO "public"."clase" VALUES (121, 2, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (121, 3, '612', 3);
INSERT INTO "public"."clase" VALUES (122, 7, '692C', 1);
INSERT INTO "public"."clase" VALUES (122, 6, '691A', 3);
INSERT INTO "public"."clase" VALUES (122, 6, '691C', 5);
INSERT INTO "public"."clase" VALUES (123, 2, '623', 1);
INSERT INTO "public"."clase" VALUES (123, 2, '625C', 3);
INSERT INTO "public"."clase" VALUES (123, 2, '624', 5);
INSERT INTO "public"."clase" VALUES (124, 9, '691E', 2);
INSERT INTO "public"."clase" VALUES (124, 10, '691A', 4);
INSERT INTO "public"."clase" VALUES (124, 2, 'INFLAB', 6);
INSERT INTO "public"."clase" VALUES (125, 1, '690E', 2);
INSERT INTO "public"."clase" VALUES (125, 1, '690D', 3);
INSERT INTO "public"."clase" VALUES (125, 1, 'AUDMEMI', 5);
INSERT INTO "public"."clase" VALUES (126, 2, '690E', 3);
INSERT INTO "public"."clase" VALUES (126, 3, '690E', 4);
INSERT INTO "public"."clase" VALUES (126, 3, '690D', 5);
INSERT INTO "public"."clase" VALUES (127, 3, '692H', 1);
INSERT INTO "public"."clase" VALUES (127, 3, '617C', 2);
INSERT INTO "public"."clase" VALUES (127, 4, '691D', 4);
INSERT INTO "public"."clase" VALUES (128, 5, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (128, 1, 'INFDEP', 3);
INSERT INTO "public"."clase" VALUES (128, 1, 'INFLAB', 4);
INSERT INTO "public"."clase" VALUES (129, 4, '692D', 2);
INSERT INTO "public"."clase" VALUES (129, 3, '692A', 3);
INSERT INTO "public"."clase" VALUES (129, 4, '692D', 4);
INSERT INTO "public"."clase" VALUES (130, 5, '691C', 1);
INSERT INTO "public"."clase" VALUES (130, 5, '690B', 2);
INSERT INTO "public"."clase" VALUES (130, 5, '692C', 3);
INSERT INTO "public"."clase" VALUES (131, 1, '651', 2);
INSERT INTO "public"."clase" VALUES (131, 1, '652', 3);
INSERT INTO "public"."clase" VALUES (131, 1, '692D', 4);
INSERT INTO "public"."clase" VALUES (132, 4, '690B', 2);
INSERT INTO "public"."clase" VALUES (132, 3, 'INFLAB', 3);
INSERT INTO "public"."clase" VALUES (132, 3, '691D', 5);
INSERT INTO "public"."clase" VALUES (133, 6, '692B', 1);
INSERT INTO "public"."clase" VALUES (133, 3, '693A', 3);
INSERT INTO "public"."clase" VALUES (133, 3, '692C', 5);
INSERT INTO "public"."clase" VALUES (134, 3, '691B', 1);
INSERT INTO "public"."clase" VALUES (134, 3, '693A', 2);
INSERT INTO "public"."clase" VALUES (134, 3, '691C', 4);
INSERT INTO "public"."clase" VALUES (135, 4, '617B', 1);
INSERT INTO "public"."clase" VALUES (135, 2, '690C', 2);
INSERT INTO "public"."clase" VALUES (135, 4, '692H', 4);
INSERT INTO "public"."clase" VALUES (136, 5, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (136, 5, 'INFLAB', 5);
INSERT INTO "public"."clase" VALUES (137, 9, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (137, 9, 'INFLAB', 4);
INSERT INTO "public"."clase" VALUES (138, 1, '690B', 1);
INSERT INTO "public"."clase" VALUES (138, 1, '690B', 4);
INSERT INTO "public"."clase" VALUES (139, 5, 'INFLAB', 3);
INSERT INTO "public"."clase" VALUES (139, 5, 'INFLAB', 4);
INSERT INTO "public"."clase" VALUES (140, 5, '691C', 2);
INSERT INTO "public"."clase" VALUES (140, 4, '690B', 3);
INSERT INTO "public"."clase" VALUES (140, 5, '691A', 4);
INSERT INTO "public"."clase" VALUES (141, 2, '691B', 2);
INSERT INTO "public"."clase" VALUES (141, 3, '692C', 3);
INSERT INTO "public"."clase" VALUES (141, 6, '690E', 3);
INSERT INTO "public"."clase" VALUES (142, 6, '692G', 1);
INSERT INTO "public"."clase" VALUES (142, 1, '690E', 3);
INSERT INTO "public"."clase" VALUES (143, 3, '690D', 1);
INSERT INTO "public"."clase" VALUES (143, 3, '690E', 2);
INSERT INTO "public"."clase" VALUES (144, 2, '651', 2);
INSERT INTO "public"."clase" VALUES (144, 2, 'INFLAB', 3);
INSERT INTO "public"."clase" VALUES (145, 6, '625C', 1);
INSERT INTO "public"."clase" VALUES (145, 1, '690C', 4);
INSERT INTO "public"."clase" VALUES (145, 7, '692D', 5);
INSERT INTO "public"."clase" VALUES (146, 1, '690D', 2);
INSERT INTO "public"."clase" VALUES (146, 9, '690E', 4);
INSERT INTO "public"."clase" VALUES (147, 6, '691D', 2);
INSERT INTO "public"."clase" VALUES (147, 6, '661', 3);
INSERT INTO "public"."clase" VALUES (147, 6, '691E', 4);
INSERT INTO "public"."clase" VALUES (148, 9, '693D', 5);
INSERT INTO "public"."clase" VALUES (148, 3, '691B', 6);
INSERT INTO "public"."clase" VALUES (149, 5, '693B', 1);
INSERT INTO "public"."clase" VALUES (149, 9, '690B', 4);
INSERT INTO "public"."clase" VALUES (150, 4, '691F', 2);
INSERT INTO "public"."clase" VALUES (150, 2, '690B', 3);
INSERT INTO "public"."clase" VALUES (150, 2, '690C', 4);
INSERT INTO "public"."clase" VALUES (151, 4, '692H', 1);
INSERT INTO "public"."clase" VALUES (151, 2, '691D', 2);
INSERT INTO "public"."clase" VALUES (151, 5, '690B', 3);
INSERT INTO "public"."clase" VALUES (152, 8, '690E', 1);
INSERT INTO "public"."clase" VALUES (152, 4, '692H', 3);
INSERT INTO "public"."clase" VALUES (152, 8, '690E', 4);
INSERT INTO "public"."clase" VALUES (153, 3, '617C', 1);
INSERT INTO "public"."clase" VALUES (153, 4, '617B', 3);
INSERT INTO "public"."clase" VALUES (153, 3, '690C', 4);
INSERT INTO "public"."clase" VALUES (154, 6, '692D', 3);
INSERT INTO "public"."clase" VALUES (154, 6, '692D', 5);
INSERT INTO "public"."clase" VALUES (155, 6, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (155, 2, '692G', 3);
INSERT INTO "public"."clase" VALUES (156, 10, '691C', 2);
INSERT INTO "public"."clase" VALUES (156, 10, '691E', 5);
INSERT INTO "public"."clase" VALUES (157, 3, '692F', 2);
INSERT INTO "public"."clase" VALUES (157, 3, '692G', 4);
INSERT INTO "public"."clase" VALUES (158, 4, 'INFLAB', 1);
INSERT INTO "public"."clase" VALUES (158, 4, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (159, 4, 'INFLAB', 2);
INSERT INTO "public"."clase" VALUES (159, 2, 'INFDEP', 4);
INSERT INTO "public"."clase" VALUES (160, 2, 'INFDEP', 2);
INSERT INTO "public"."clase" VALUES (160, 2, '690E', 4);
INSERT INTO "public"."clase" VALUES (161, 3, '625C', 2);
INSERT INTO "public"."clase" VALUES (161, 6, '617C', 3);
INSERT INTO "public"."clase" VALUES (162, 4, '690E', 1);
INSERT INTO "public"."clase" VALUES (162, 2, 'INFLAB', 3);
INSERT INTO "public"."clase" VALUES (163, 2, '693B', 6);
INSERT INTO "public"."clase" VALUES (163, 3, '692A', 6);
INSERT INTO "public"."clase" VALUES (164, 4, '691C', 1);
INSERT INTO "public"."clase" VALUES (164, 6, '681B', 3);

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupo";
CREATE TABLE "public"."grupo" (
  "id_grupo" int4 NOT NULL DEFAULT nextval('grupo_id_grupo_seq1'::regclass),
  "numero_grupo" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre_docente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_materia" int4 NOT NULL
)
;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO "public"."grupo" VALUES (63, '1', 'CESPEDES GUIZADA MARIA BENITA', 26);
INSERT INTO "public"."grupo" VALUES (64, '2', 'CESPEDES GUIZADA MARIA BENITA', 26);
INSERT INTO "public"."grupo" VALUES (65, '3', 'PEETERS ILONAA MAGDA LENA', 26);
INSERT INTO "public"."grupo" VALUES (66, '5', 'CESPEDES GUIZADA MARIA BENITA', 26);
INSERT INTO "public"."grupo" VALUES (67, 'B', 'VALENZUELA MIRANDA ROBERTO', 27);
INSERT INTO "public"."grupo" VALUES (68, 'B1', 'MOREIRA CALIZAYA RENE', 27);
INSERT INTO "public"."grupo" VALUES (69, 'B2', 'GUZMAN SAAVEDRA ROCIO', 27);
INSERT INTO "public"."grupo" VALUES (70, 'B3', 'ORDONEZ SALVATIERRA MIGUEL ANGEL', 27);
INSERT INTO "public"."grupo" VALUES (71, 'B4', 'GUZMAN SAAVEDRA ROCIO', 27);
INSERT INTO "public"."grupo" VALUES (72, 'B5', 'TERRAZAS VARGAS JUAN CARLOS', 27);
INSERT INTO "public"."grupo" VALUES (73, 'B6', 'TERRAZAS VARGAS JUAN CARLOS', 27);
INSERT INTO "public"."grupo" VALUES (74, '10', 'RODRIGUEZ SEJAS JUAN ANTONIO', 28);
INSERT INTO "public"."grupo" VALUES (75, '15', 'CARRASCO CALVO ALVARO HERNANDO', 28);
INSERT INTO "public"."grupo" VALUES (76, '8', 'LEON ROMERO GUALBERTO', 28);
INSERT INTO "public"."grupo" VALUES (77, '10', '. POR DESIGNAR', 29);
INSERT INTO "public"."grupo" VALUES (78, '11', 'ROJAS ZURITA RAMIRO', 29);
INSERT INTO "public"."grupo" VALUES (79, '1', 'SALAZAR SERRUDO CARLA', 30);
INSERT INTO "public"."grupo" VALUES (80, '10', 'COSTAS JAUREGUI VLADIMIR ABEL', 30);
INSERT INTO "public"."grupo" VALUES (81, '2', 'BLANCO COCA LETICIA', 30);
INSERT INTO "public"."grupo" VALUES (82, '3', 'USTARIZ VARGAS HERNAN', 30);
INSERT INTO "public"."grupo" VALUES (83, '4', 'VILLARROEL TAPIA HENRY FRANK', 30);
INSERT INTO "public"."grupo" VALUES (84, '5', 'MONTANO QUIROGA VICTOR HUGO', 30);
INSERT INTO "public"."grupo" VALUES (85, '6', 'SALAZAR SERRUDO CARLA', 30);
INSERT INTO "public"."grupo" VALUES (86, '7', 'ANTEZANA SERRANO DILAN ALEJANDRO', 30);
INSERT INTO "public"."grupo" VALUES (87, '1', 'PEETERS ILONAA MAGDA LENA', 31);
INSERT INTO "public"."grupo" VALUES (88, '2', 'PEETERS ILONAA MAGDA LENA', 31);
INSERT INTO "public"."grupo" VALUES (89, '3', 'PEETERS ILONAA MAGDA LENA', 31);
INSERT INTO "public"."grupo" VALUES (90, '5A', 'SALINAS PERICON WALTER OSCAR GONZALO', 32);
INSERT INTO "public"."grupo" VALUES (91, '6', 'SILVA RAMOS HERNAN VICTOR', 32);
INSERT INTO "public"."grupo" VALUES (92, '8', 'OMONTE OJALVO JOSE ROBERTO', 32);
INSERT INTO "public"."grupo" VALUES (93, '12', 'MARTINEZ MAIDA AMILCAR SAUL', 33);
INSERT INTO "public"."grupo" VALUES (94, '6', 'TERRAZAS LOBO JUAN', 33);
INSERT INTO "public"."grupo" VALUES (95, '1', 'TORRICO BASCOPE ROSEMARY', 34);
INSERT INTO "public"."grupo" VALUES (96, '2', 'BLANCO COCA LETICIA', 34);
INSERT INTO "public"."grupo" VALUES (97, '3', 'BLANCO COCA LETICIA', 34);
INSERT INTO "public"."grupo" VALUES (98, '5', 'GUTIERREZ GONZALES JESUS ALEJANDRO', 34);
INSERT INTO "public"."grupo" VALUES (99, '1', 'ACHA PEREZ SAMUEL', 35);
INSERT INTO "public"."grupo" VALUES (100, '2', 'BLANCO COCA LETICIA', 35);
INSERT INTO "public"."grupo" VALUES (101, '1', 'TORRICO BASCOPE ROSEMARY', 36);
INSERT INTO "public"."grupo" VALUES (102, '2', 'JUCHANI BAZUALDO DEMETRIO', 37);
INSERT INTO "public"."grupo" VALUES (103, '3', 'ZABALAGA MONTANO OSCAR A.', 37);
INSERT INTO "public"."grupo" VALUES (104, '1', 'HOEPFNER REYNOLDS MAURICIO', 38);
INSERT INTO "public"."grupo" VALUES (105, '1', 'AGREDA CORRALES LUIS ROBERTO', 39);
INSERT INTO "public"."grupo" VALUES (106, '1', 'MONTOYA BURGOS YONY RICHARD', 40);
INSERT INTO "public"."grupo" VALUES (107, '1', 'CAMACHO DEL CASTILLO INDIRA', 41);
INSERT INTO "public"."grupo" VALUES (108, '1', 'FLORES VILLARROEL CORINA', 42);
INSERT INTO "public"."grupo" VALUES (109, '2', 'MANZUR SORIA CARLOS B.', 42);
INSERT INTO "public"."grupo" VALUES (110, '5', 'MONTOYA BURGOS YONY RICHARD', 42);
INSERT INTO "public"."grupo" VALUES (111, '3', 'DELGADILLO COSSIO DAVID ALFREDO', 43);
INSERT INTO "public"."grupo" VALUES (112, '4', 'OMONTE OJALVO JOSE ROBERTO', 43);
INSERT INTO "public"."grupo" VALUES (113, '1', 'MONTECINOS CHOQUE MARCO ANTONIO', 44);
INSERT INTO "public"."grupo" VALUES (114, '1', 'MEDRANO PEREZ VITTER JESUS', 45);
INSERT INTO "public"."grupo" VALUES (115, '2', 'CALANCHA NAVIA BORIS', 45);
INSERT INTO "public"."grupo" VALUES (116, '1', 'SALAZAR SERRUDO CARLA', 46);
INSERT INTO "public"."grupo" VALUES (117, '2', 'SALAZAR SERRUDO CARLA', 46);
INSERT INTO "public"."grupo" VALUES (118, '1', 'APARICIO YUJA TATIANA', 47);
INSERT INTO "public"."grupo" VALUES (119, '1', 'BLANCO COCA LETICIA', 48);
INSERT INTO "public"."grupo" VALUES (120, '1', 'APARICIO YUJA TATIANA', 49);
INSERT INTO "public"."grupo" VALUES (121, '2', 'APARICIO YUJA TATIANA', 49);
INSERT INTO "public"."grupo" VALUES (122, '1', 'ORELLANA ARAOZ JORGE WALTER', 50);
INSERT INTO "public"."grupo" VALUES (123, '2', 'ORELLANA ARAOZ JORGE WALTER', 50);
INSERT INTO "public"."grupo" VALUES (124, '3', 'CUSSI NICOLAS GROVER HUMBERTO', 50);
INSERT INTO "public"."grupo" VALUES (125, '1', 'FLORES SOLIZ JUAN MARCELO', 51);
INSERT INTO "public"."grupo" VALUES (126, '2', 'JALDIN ROSALES K. ROLANDO', 51);
INSERT INTO "public"."grupo" VALUES (127, '1', 'MONTANO QUIROGA VICTOR HUGO', 52);
INSERT INTO "public"."grupo" VALUES (128, '1', 'CALANCHA NAVIA BORIS', 53);
INSERT INTO "public"."grupo" VALUES (129, '1', 'GARCIA PEREZ CARMEN ROSA', 54);
INSERT INTO "public"."grupo" VALUES (130, '2', 'RODRIGUEZ BILBAO ERIKA PATRICIA', 54);
INSERT INTO "public"."grupo" VALUES (131, '1', 'CAMACHO DEL CASTILLO INDIRA', 55);
INSERT INTO "public"."grupo" VALUES (132, '2', 'TORRICO BASCOPE ROSEMARY', 55);
INSERT INTO "public"."grupo" VALUES (133, '1', 'ORELLANA ARAOZ JORGE WALTER', 56);
INSERT INTO "public"."grupo" VALUES (134, '2', 'ORELLANA ARAOZ JORGE WALTER', 56);
INSERT INTO "public"."grupo" VALUES (135, '1', 'ROMERO RODRIGUEZ PATRICIA', 57);
INSERT INTO "public"."grupo" VALUES (136, '1', 'CALANCHA NAVIA BORIS', 58);
INSERT INTO "public"."grupo" VALUES (137, '2', 'CALANCHA NAVIA BORIS', 58);
INSERT INTO "public"."grupo" VALUES (138, '3', 'FLORES SOLIZ JUAN MARCELO', 58);
INSERT INTO "public"."grupo" VALUES (139, '4', 'CALANCHA NAVIA BORIS', 58);
INSERT INTO "public"."grupo" VALUES (140, '2', 'GARCIA PEREZ CARMEN ROSA', 59);
INSERT INTO "public"."grupo" VALUES (141, '1', 'COSTAS JAUREGUI VLADIMIR ABEL', 60);
INSERT INTO "public"."grupo" VALUES (142, '1', 'VILLARROEL TAPIA HENRY FRANK', 61);
INSERT INTO "public"."grupo" VALUES (143, '1', 'FLORES VILLARROEL CORINA', 62);
INSERT INTO "public"."grupo" VALUES (144, '2', 'BLANCO COCA LETICIA', 62);
INSERT INTO "public"."grupo" VALUES (145, '1', 'URENA HINOJOSA CLAUDIA', 63);
INSERT INTO "public"."grupo" VALUES (146, '1', 'FLORES VILLARROEL CORINA', 64);
INSERT INTO "public"."grupo" VALUES (147, '1', 'MONTECINOS CHOQUE MARCO ANTONIO', 65);
INSERT INTO "public"."grupo" VALUES (148, '1', 'CUSSI NICOLAS GROVER HUMBERTO', 66);
INSERT INTO "public"."grupo" VALUES (149, '2', 'CUSSI NICOLAS GROVER HUMBERTO', 66);
INSERT INTO "public"."grupo" VALUES (150, '1', 'ROMERO RODRIGUEZ PATRICIA', 67);
INSERT INTO "public"."grupo" VALUES (151, '2', 'VILLARROEL NOVILLO JIMMY', 67);
INSERT INTO "public"."grupo" VALUES (152, '6', 'FLORES VILLARROEL CORINA', 68);
INSERT INTO "public"."grupo" VALUES (153, '7', 'ROMERO RODRIGUEZ PATRICIA', 68);
INSERT INTO "public"."grupo" VALUES (154, '1', 'MENA MAMANI NIBETH', 69);
INSERT INTO "public"."grupo" VALUES (155, '1', 'COSTAS JAUREGUI VLADIMIR ABEL', 70);
INSERT INTO "public"."grupo" VALUES (156, '1', 'FIORILO LOZADA AMERICO', 71);
INSERT INTO "public"."grupo" VALUES (157, '1', 'GARCIA PEREZ CARMEN ROSA', 72);
INSERT INTO "public"."grupo" VALUES (158, '1', 'ANTEZANA CAMACHO MARCELO', 73);
INSERT INTO "public"."grupo" VALUES (159, '2', 'MONTANO QUIROGA VICTOR HUGO', 74);
INSERT INTO "public"."grupo" VALUES (160, '3', 'GARCIA PEREZ CARMEN ROSA', 74);
INSERT INTO "public"."grupo" VALUES (161, '4', 'ROMERO RODRIGUEZ PATRICIA', 74);
INSERT INTO "public"."grupo" VALUES (162, '1', 'MONTOYA BURGOS YONY RICHARD', 75);
INSERT INTO "public"."grupo" VALUES (163, '1', 'RODRIGUEZ ESTEVEZ VICTOR ADOLFO', 76);
INSERT INTO "public"."grupo" VALUES (164, '1', 'RODRIGUEZ BILBAO ERIKA PATRICIA', 77);

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS "public"."materia";
CREATE TABLE "public"."materia" (
  "id_materia" int4 NOT NULL DEFAULT nextval('materia_id_materia_seq1'::regclass),
  "nombre_materia" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo_materia" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "id_carrera" int4,
  "nivel" char(1) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of materia
-- ----------------------------
INSERT INTO "public"."materia" VALUES (26, 'INGLES I', '1803001', 2, 'A');
INSERT INTO "public"."materia" VALUES (27, 'FISICA GENERAL', '2006063', 2, 'A');
INSERT INTO "public"."materia" VALUES (28, 'ALGEBRA I', '2008019', 2, 'A');
INSERT INTO "public"."materia" VALUES (29, 'CALCULO I', '2008054', 2, 'A');
INSERT INTO "public"."materia" VALUES (30, 'INTRODUCCION A LA PROGRAMACION', '2010010', 2, 'A');
INSERT INTO "public"."materia" VALUES (31, 'INGLES II', '1803002', 2, 'B');
INSERT INTO "public"."materia" VALUES (32, 'ALGEBRA II', '2008022', 2, 'B');
INSERT INTO "public"."materia" VALUES (33, 'CALCULO II', '2008056', 2, 'B');
INSERT INTO "public"."materia" VALUES (34, 'ELEM. DE PROGRAMACION Y ESTRUC. DE DATOS', '2010003', 2, 'B');
INSERT INTO "public"."materia" VALUES (35, 'ARQUITECTURA DE COMPUTADORAS I', '2010013', 2, 'B');
INSERT INTO "public"."materia" VALUES (36, 'PROGRAMACION', '2010200', 2, 'B');
INSERT INTO "public"."materia" VALUES (37, 'CALCULO NUMERICO', '2008060', 2, 'C');
INSERT INTO "public"."materia" VALUES (38, 'LOGICA', '2008140', 2, 'C');
INSERT INTO "public"."materia" VALUES (39, 'ARQUITECTURA DE COMPUTADORAS II', '2010014', 2, 'C');
INSERT INTO "public"."materia" VALUES (40, 'TEORIA DE GRAFOS', '2010037', 2, 'C');
INSERT INTO "public"."materia" VALUES (41, 'ORGANIZACION Y METODOS', '2010041', 2, 'C');
INSERT INTO "public"."materia" VALUES (42, 'METODOS Y TECNICAS DE PROGRAMACION', '2010206', 2, 'C');
INSERT INTO "public"."materia" VALUES (43, 'PROBABILIDAD Y ESTADISTICA', '2008029', 2, 'D');
INSERT INTO "public"."materia" VALUES (44, 'TALLER DE PROGRAMACION EN BAJO NIVEL', '2010005', 2, 'D');
INSERT INTO "public"."materia" VALUES (45, 'BASE DE DATOS I', '2010015', 2, 'D');
INSERT INTO "public"."materia" VALUES (46, 'SISTEMAS DE INFORMACION I', '2010018', 2, 'D');
INSERT INTO "public"."materia" VALUES (47, 'PROGRAMACION FUNCIONAL', '2010038', 2, 'D');
INSERT INTO "public"."materia" VALUES (48, 'ALGORITMOS AVANZADOS', '2010197', 2, 'D');
INSERT INTO "public"."materia" VALUES (49, 'BASE DE DATOS II', '2010016', 2, 'E');
INSERT INTO "public"."materia" VALUES (50, 'TALLER DE SISTEMAS OPERATIVOS', '2010017', 2, 'E');
INSERT INTO "public"."materia" VALUES (51, 'SISTEMAS DE INFORMACION II', '2010022', 2, 'E');
INSERT INTO "public"."materia" VALUES (52, 'TEORIA DE AUTOMATAS Y LENG. FORMALES', '2010040', 2, 'E');
INSERT INTO "public"."materia" VALUES (53, 'GRAFICACION POR COMPUTADORA', '2010042', 2, 'E');
INSERT INTO "public"."materia" VALUES (54, 'INTELIGENCIA ARTIFICIAL I', '2010201', 2, 'E');
INSERT INTO "public"."materia" VALUES (55, 'INGENIERIA DE SOFTWARE', '2010020', 2, 'F');
INSERT INTO "public"."materia" VALUES (56, 'REDES DE COMPUTADORAS', '2010047', 2, 'F');
INSERT INTO "public"."materia" VALUES (57, 'ESTRUCTURA Y SEMANTICA DE LENGUAJES DE PROGRA', '2010049', 2, 'F');
INSERT INTO "public"."materia" VALUES (58, 'TALLER DE BASE DE DATOS', '2010053', 2, 'F');
INSERT INTO "public"."materia" VALUES (59, 'INTELIGENCIA ARTIFICIAL II', '2010202', 2, 'F');
INSERT INTO "public"."materia" VALUES (60, 'PROGRAMACION WEB', '2010203', 2, 'F');
INSERT INTO "public"."materia" VALUES (61, 'SIMULACION DE SISTEMAS', '2010019', 2, 'G');
INSERT INTO "public"."materia" VALUES (62, 'TALLER DE INGENIERIA DE SOFTWARE', '2010024', 2, 'G');
INSERT INTO "public"."materia" VALUES (63, 'ARQUITECTURA DE SOFTWARE', '2010100', 2, 'G');
INSERT INTO "public"."materia" VALUES (64, 'INTERACCION HUMANO COMPUTADOR', '2010204', 2, 'G');
INSERT INTO "public"."materia" VALUES (65, 'TECNOLOGIA REDES AVANZADAS', '2010205', 2, 'G');
INSERT INTO "public"."materia" VALUES (66, 'APLICACION DE SISTEMAS OPERATIVOS', '2010035', 2, 'H');
INSERT INTO "public"."materia" VALUES (67, 'EVALUACION Y AUDITORIA DE SISTEMAS', '2010102', 2, 'H');
INSERT INTO "public"."materia" VALUES (68, 'TALLER DE GRADO I', '2010214', 2, 'H');
INSERT INTO "public"."materia" VALUES (69, 'PROCESOS AGILES', '2010066', 2, 'I');
INSERT INTO "public"."materia" VALUES (70, 'ENTORNOS VIRTUALES DE APRENDIZAJE', '2010178', 2, 'I');
INSERT INTO "public"."materia" VALUES (71, 'SERVICIOS TELEMATICOS', '2010188', 2, 'I');
INSERT INTO "public"."materia" VALUES (72, 'RECONOCIMIENTO DE VOZ', '2010189', 2, 'I');
INSERT INTO "public"."materia" VALUES (73, 'SEGURIDAD DE SISTEMAS', '2010209', 2, 'I');
INSERT INTO "public"."materia" VALUES (74, 'TALLER DE GRADO II', '2010215', 2, 'I');
INSERT INTO "public"."materia" VALUES (75, 'CLOUD COMPUTING', '2010216', 2, 'I');
INSERT INTO "public"."materia" VALUES (76, 'BUSINESS INTELLIGENCE Y BIG DATA', '2010217', 2, 'I');
INSERT INTO "public"."materia" VALUES (77, 'CIENCIA DE DATOS Y MACHINE LEARNING', '2010218', 2, 'I');

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS "public"."periodo";
CREATE TABLE "public"."periodo" (
  "id_periodo" int4 NOT NULL DEFAULT nextval('periodo_id_periodo_seq1'::regclass),
  "hora_inicio" time(6) NOT NULL,
  "hora_fin" time(6) NOT NULL
)
;

-- ----------------------------
-- Records of periodo
-- ----------------------------
INSERT INTO "public"."periodo" VALUES (1, '06:45:00', '08:15:00');
INSERT INTO "public"."periodo" VALUES (10, '20:15:00', '21:45:00');
INSERT INTO "public"."periodo" VALUES (9, '18:45:00', '20:15:00');
INSERT INTO "public"."periodo" VALUES (8, '17:15:00', '18:45:00');
INSERT INTO "public"."periodo" VALUES (7, '15:45:00', '17:15:00');
INSERT INTO "public"."periodo" VALUES (6, '14:15:00', '15:45:00');
INSERT INTO "public"."periodo" VALUES (5, '12:45:00', '14:15:00');
INSERT INTO "public"."periodo" VALUES (4, '11:15:00', '12:45:00');
INSERT INTO "public"."periodo" VALUES (3, '09:45:00', '11:15:00');
INSERT INTO "public"."periodo" VALUES (2, '08:15:00', '09:45:00');

-- ----------------------------
-- View structure for vista_clase_periodos
-- ----------------------------
DROP VIEW IF EXISTS "public"."vista_clase_periodos";
CREATE VIEW "public"."vista_clase_periodos" AS  SELECT cl.id_grupo,
    cl.dia,
    cl.id_periodo,
    p.hora_inicio,
    p.hora_fin,
    cl.aula
   FROM clase cl
     JOIN periodo p ON cl.id_periodo = p.id_periodo;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."carrera_id_carrera_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."carrera_id_carrera_seq1"
OWNED BY "public"."carrera"."id_carrera";
SELECT setval('"public"."carrera_id_carrera_seq1"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."grupo_id_grupo_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."grupo_id_grupo_seq1"
OWNED BY "public"."grupo"."id_grupo";
SELECT setval('"public"."grupo_id_grupo_seq1"', 164, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."materia_id_materia_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."materia_id_materia_seq1"
OWNED BY "public"."materia"."id_materia";
SELECT setval('"public"."materia_id_materia_seq1"', 77, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."periodo_id_periodo_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."periodo_id_periodo_seq1"
OWNED BY "public"."periodo"."id_periodo";
SELECT setval('"public"."periodo_id_periodo_seq1"', 1, false);

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
-- Uniques structure for table grupo
-- ----------------------------
ALTER TABLE "public"."grupo" ADD CONSTRAINT "unique_grupo_materia" UNIQUE ("id_materia", "numero_grupo");

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
