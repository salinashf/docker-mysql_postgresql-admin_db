INSERT INTO public.provincia (id_provincia, codigo, nombre, descripcion) VALUES
(1, 'PROV001', 'Pichincha', 'Provincia de la Sierra'),
(2, 'PROV002', 'Guayas', 'Provincia costera'),
(3, 'PROV003', 'Azuay', NULL);

INSERT INTO public.cliente (id_cliente, id_provincia, codigo, razon_social, direccion, telefono, ruc) VALUES
(1, 1, 'CLI001', 'Cliente X', 'Av. Principal #123', '0987654321', '1712345678'),
(2, 2, 'CLI002', 'Cliente Y', 'Calle Secundaria #456', '0998765432', '0923456789'),
(3, NULL, 'CLI003', 'Cliente Z', 'Sin dirección', NULL, '1823456780');

INSERT INTO public.catergoria  (id_catergoria, codigo, nombre, descripcion) VALUES
(1, 'CATE001', 'Catergoria A', 'Descripción del catergoria A'),
(2, 'CATE002', 'Catergoria B', 'Descripción del catergoria B'),
(3, 'CATE003', 'Catergoria C', NULL);

INSERT INTO public.producto (id_producto, id_catergoria , codigo, nombre, descripcion) VALUES
(1,1, 'PROD001', 'Producto A', 'Descripción del producto A'),
(2,2, 'PROD002', 'Producto B', 'Descripción del producto B'),
(3,2, 'PROD003', 'Producto C', NULL);

INSERT INTO public.factura (id_factura, id_cliente, fecha, numero_factura, subtotal, iva, total) VALUES
(1, 1, '2025-04-22', 'FAC001', 100.00, 12.00, 112.00),
(2, 2, '2025-04-23', 'FAC002', 200.00, 24.00, 224.00),
(3, NULL, '2025-04-24', 'FAC003', 300.00, 36.00, 336.00);


INSERT INTO public.detalle_factura (id_factura, id_producto, cantidad, precio_unitario, graba_iva) VALUES
(1, 1, 2, 50.00, 'Si'),
(1, 2, 1, 100.00, 'No'),
(2, 3, 3, 75.00, 'Si'),
(3, 1, 5, 20.00, 'No');
