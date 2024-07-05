-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION postgres;

-- DROP SEQUENCE public.carrera_id_carrera_seq;

CREATE SEQUENCE public.carrera_id_carrera_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.grupo_id_grupo_seq;

CREATE SEQUENCE public.grupo_id_grupo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.materia_id_materia_seq;

CREATE SEQUENCE public.materia_id_materia_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE public.periodo_id_periodo_seq;

CREATE SEQUENCE public.periodo_id_periodo_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.carrera definition

-- Drop table

-- DROP TABLE public.carrera;

CREATE TABLE public.carrera (
	id_carrera serial4 NOT NULL,
	nombre_carrera varchar(100) NOT NULL,
	codigo_carrera varchar(10) NOT NULL,
	CONSTRAINT carrera_codigo_carrera_key UNIQUE (codigo_carrera),
	CONSTRAINT carrera_pkey PRIMARY KEY (id_carrera),
	CONSTRAINT unique_codigo_carrera UNIQUE (codigo_carrera)
);


-- public.periodo definition

-- Drop table

-- DROP TABLE public.periodo;

CREATE TABLE public.periodo (
	id_periodo serial4 NOT NULL,
	hora_inicio time(6) NOT NULL,
	hora_fin time(6) NOT NULL,
	CONSTRAINT periodo_pkey PRIMARY KEY (id_periodo)
);


-- public.materia definition

-- Drop table

-- DROP TABLE public.materia;

CREATE TABLE public.materia (
	id_materia serial4 NOT NULL,
	nombre_materia varchar(100) NOT NULL,
	codigo_materia varchar(10) NOT NULL,
	id_carrera int4 NULL,
	nivel bpchar(1) NOT NULL,
	CONSTRAINT materia_codigo_materia_key UNIQUE (codigo_materia),
	CONSTRAINT materia_pkey PRIMARY KEY (id_materia),
	CONSTRAINT unique_codigo_materia UNIQUE (codigo_materia),
	CONSTRAINT materia_id_carrera_fkey FOREIGN KEY (id_carrera) REFERENCES public.carrera(id_carrera)
);


-- public.grupo definition

-- Drop table

-- DROP TABLE public.grupo;

CREATE TABLE public.grupo (
	id_grupo serial4 NOT NULL,
	numero_grupo varchar(10) NOT NULL,
	nombre_docente varchar(255) NOT NULL,
	id_materia int4 NOT NULL,
	CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo),
	CONSTRAINT unique_grupo_materia UNIQUE (id_materia, numero_grupo),
	CONSTRAINT grupo_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES public.materia(id_materia)
);


-- public.clase definition

-- Drop table

-- DROP TABLE public.clase;

CREATE TABLE public.clase (
	id_grupo int4 NOT NULL,
	id_periodo int4 NOT NULL,
	aula varchar(50) NOT NULL,
	dia int2 NOT NULL,
	CONSTRAINT clase_pkey PRIMARY KEY (id_grupo, id_periodo, dia),
	CONSTRAINT clase_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupo(id_grupo),
	CONSTRAINT clase_id_periodo_fkey FOREIGN KEY (id_periodo) REFERENCES public.periodo(id_periodo)
);

INSERT INTO periodo(hora_inicio,hora_fin) 
  VALUES (1,'08:15:00','09:45:00'),
  (2,'09:45:00','11:15:00'),
  (3,'11:15:00','12:45:00'),
  (4,'12:45:00','14:15:00'),
  (5,'14:15:00','15:45:00'),
  (6,'15:45:00','17:15:00'),
  (7,'17:15:00','18:45:00'),
  (8,'18:45:00','20:15:00'),
  (9,'20:15:00','21:45:00');