-- public.catergoria definition

-- Drop table

-- DROP TABLE public.catergoria;

CREATE TABLE public.catergoria (
	id_catergoria int4 NOT NULL,
	codigo varchar(50) NOT NULL,
	nombre varchar(100) NOT NULL,
	descripcion text NULL,
	CONSTRAINT catergoria_pkey PRIMARY KEY (id_catergoria)
);


-- public.provincia definition

-- Drop table

-- DROP TABLE public.provincia;

CREATE TABLE public.provincia (
	id_provincia int4 NOT NULL,
	codigo varchar(50) NOT NULL,
	nombre varchar(100) NOT NULL,
	descripcion text NULL,
	CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia)
);


-- public.cliente definition

-- Drop table

-- DROP TABLE public.cliente;

CREATE TABLE public.cliente (
	id_cliente int4 NOT NULL,
	id_provincia int4 NULL,
	codigo varchar(50) NOT NULL,
	razon_social varchar(100) NOT NULL,
	direccion text NULL,
	telefono varchar(20) NULL,
	ruc varchar(20) NULL,
	CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente),
	CONSTRAINT cliente_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id_provincia)
);


-- public.factura definition

-- Drop table

-- DROP TABLE public.factura;

CREATE TABLE public.factura (
	id_factura int4 NOT NULL,
	id_cliente int4 NULL,
	fecha date NULL,
	numero_factura varchar(50) NOT NULL,
	subtotal numeric(10, 2) NULL,
	iva numeric(10, 2) NULL,
	total numeric(10, 2) NULL,
	CONSTRAINT factura_pkey PRIMARY KEY (id_factura),
	CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente)
);


-- public.producto definition

-- Drop table

-- DROP TABLE public.producto;

CREATE TABLE public.producto (
	id_producto int4 NOT NULL,
	codigo varchar(50) NOT NULL,
	nombre varchar(100) NOT NULL,
	descripcion text NULL,
	id_catergoria int4 NULL,
	CONSTRAINT producto_pkey PRIMARY KEY (id_producto),
	CONSTRAINT producto_catergoria_fk FOREIGN KEY (id_catergoria) REFERENCES public.catergoria(id_catergoria)
);


-- public.detalle_factura definition

-- Drop table

-- DROP TABLE public.detalle_factura;

CREATE TABLE public.detalle_factura (
	id_factura int4 NOT NULL,
	id_producto int4 NOT NULL,
	cantidad int4 NOT NULL,
	precio_unitario numeric(10, 2) NOT NULL,
	graba_iva bpchar(2) NULL,
	CONSTRAINT detalle_factura_graba_iva_check CHECK ((graba_iva = ANY (ARRAY['Si'::bpchar, 'No'::bpchar]))),
	CONSTRAINT detalle_factura_pkey PRIMARY KEY (id_factura, id_producto),
	CONSTRAINT detalle_factura_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.factura(id_factura),
	CONSTRAINT detalle_factura_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto)
);