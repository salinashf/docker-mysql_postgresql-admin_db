--
-- PostgreSQL database cluster dump
--

-- Started on 2025-04-23 17:35:01

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "useradmin@mimail.com";
ALTER ROLE "useradmin@mimail.com" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-23 17:35:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-04-23 17:35:01

--
-- PostgreSQL database dump complete
--

--
-- Database "db_springboot" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-23 17:35:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3389 (class 1262 OID 16384)
-- Name: db_springboot; Type: DATABASE; Schema: -; Owner: useradmin@mimail.com
--

CREATE DATABASE db_springboot WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE db_springboot OWNER TO "useradmin@mimail.com";

\connect db_springboot

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16453)
-- Name: catergoria; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.catergoria (
    id_catergoria integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.catergoria OWNER TO "useradmin@mimail.com";

--
-- TOC entry 215 (class 1259 OID 16396)
-- Name: cliente; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    id_provincia integer,
    codigo character varying(50) NOT NULL,
    razon_social character varying(100) NOT NULL,
    direccion text,
    telefono character varying(20),
    ruc character varying(20)
);


ALTER TABLE public.cliente OWNER TO "useradmin@mimail.com";

--
-- TOC entry 218 (class 1259 OID 16425)
-- Name: detalle_factura; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.detalle_factura (
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    graba_iva character(2),
    CONSTRAINT detalle_factura_graba_iva_check CHECK ((graba_iva = ANY (ARRAY['Si'::bpchar, 'No'::bpchar])))
);


ALTER TABLE public.detalle_factura OWNER TO "useradmin@mimail.com";

--
-- TOC entry 217 (class 1259 OID 16415)
-- Name: factura; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.factura (
    id_factura integer NOT NULL,
    id_cliente integer,
    fecha date,
    numero_factura character varying(50) NOT NULL,
    subtotal numeric(10,2),
    iva numeric(10,2),
    total numeric(10,2)
);


ALTER TABLE public.factura OWNER TO "useradmin@mimail.com";

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: producto; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    id_catergoria integer
);


ALTER TABLE public.producto OWNER TO "useradmin@mimail.com";

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: provincia; Type: TABLE; Schema: public; Owner: useradmin@mimail.com
--

CREATE TABLE public.provincia (
    id_provincia integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.provincia OWNER TO "useradmin@mimail.com";

--
-- TOC entry 3383 (class 0 OID 16453)
-- Dependencies: 219
-- Data for Name: catergoria; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.catergoria (id_catergoria, codigo, nombre, descripcion) FROM stdin;
1	CATE001	Catergoria A	Descripción del catergoria A
2	CATE002	Catergoria B	Descripción del catergoria B
3	CATE003	Catergoria C	\N
\.


--
-- TOC entry 3379 (class 0 OID 16396)
-- Dependencies: 215
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.cliente (id_cliente, id_provincia, codigo, razon_social, direccion, telefono, ruc) FROM stdin;
1	1	CLI001	Cliente X	Av. Principal #123	0987654321	1712345678
2	2	CLI002	Cliente Y	Calle Secundaria #456	0998765432	0923456789
3	\N	CLI003	Cliente Z	Sin dirección	\N	1823456780
\.


--
-- TOC entry 3382 (class 0 OID 16425)
-- Dependencies: 218
-- Data for Name: detalle_factura; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.detalle_factura (id_factura, id_producto, cantidad, precio_unitario, graba_iva) FROM stdin;
1	1	2	50.00	Si
1	2	1	100.00	No
2	3	3	75.00	Si
3	1	5	20.00	No
\.


--
-- TOC entry 3381 (class 0 OID 16415)
-- Dependencies: 217
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.factura (id_factura, id_cliente, fecha, numero_factura, subtotal, iva, total) FROM stdin;
1	1	2025-04-22	FAC001	100.00	12.00	112.00
2	2	2025-04-23	FAC002	200.00	24.00	224.00
3	\N	2025-04-24	FAC003	300.00	36.00	336.00
\.


--
-- TOC entry 3380 (class 0 OID 16408)
-- Dependencies: 216
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.producto (id_producto, codigo, nombre, descripcion, id_catergoria) FROM stdin;
1	PROD001	Producto A	Descripción del producto A	1
2	PROD002	Producto B	Descripción del producto B	2
3	PROD003	Producto C	\N	2
\.


--
-- TOC entry 3378 (class 0 OID 16389)
-- Dependencies: 214
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: useradmin@mimail.com
--

COPY public.provincia (id_provincia, codigo, nombre, descripcion) FROM stdin;
1	PROV001	Pichincha	Provincia de la Sierra
2	PROV002	Guayas	Provincia costera
3	PROV003	Azuay	\N
\.


--
-- TOC entry 3230 (class 2606 OID 16459)
-- Name: catergoria catergoria_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.catergoria
    ADD CONSTRAINT catergoria_pkey PRIMARY KEY (id_catergoria);


--
-- TOC entry 3222 (class 2606 OID 16402)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3228 (class 2606 OID 16430)
-- Name: detalle_factura detalle_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (id_factura, id_producto);


--
-- TOC entry 3226 (class 2606 OID 16419)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 3224 (class 2606 OID 16414)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 3220 (class 2606 OID 16395)
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia);


--
-- TOC entry 3231 (class 2606 OID 16403)
-- Name: cliente cliente_id_provincia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id_provincia);


--
-- TOC entry 3234 (class 2606 OID 16431)
-- Name: detalle_factura detalle_factura_id_factura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura);


--
-- TOC entry 3235 (class 2606 OID 16436)
-- Name: detalle_factura detalle_factura_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);


--
-- TOC entry 3233 (class 2606 OID 16420)
-- Name: factura factura_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- TOC entry 3232 (class 2606 OID 16460)
-- Name: producto producto_catergoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: useradmin@mimail.com
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_catergoria_fk FOREIGN KEY (id_catergoria) REFERENCES public.catergoria(id_catergoria);


-- Completed on 2025-04-23 17:35:01

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-23 17:35:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-04-23 17:35:01

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-04-23 17:35:01

--
-- PostgreSQL database cluster dump complete
--

