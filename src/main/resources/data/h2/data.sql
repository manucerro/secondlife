-- ******************************************************
-- 
--                       MODEL 
-- 
-- ******************************************************

INSERT INTO FAMILIAS (ID, NOMBRE) VALUES
(1, 'SMARTPHONES'),
(2, 'TABLETS'),
(3, 'PORTÁTILES'),
(4, 'ACCESORIOS'),
(5, 'AUDIO'),
(6, 'IMAGEN'),
(7, 'CONSOLAS'),
(8, 'COMPONENTES'),
(9, 'ALMACENAMIENTO'),
(10, 'SOPORTE INFORMÁTICO'),
(11, 'PERIFÉRICOS'),
(12, 'REDES');

INSERT INTO PRODUCTOS (CODIGO, NOMBRE, DESCRIPCION, FECHA_ALTA, PRECIO, DESCATALOGADO, ID_FAMILIA) VALUES
(100,'Auriculares Sony WH-CH510', 'Auriculares inalámbricos con micrófono', '2017-10-21', 29.0, FALSE, 1),
(101,'Auriculares JBL Tune 510BT', 'Bluetooth, 40h de autonomía, plegables', '2017-10-23', 34.0, FALSE, 1),
(102,'Altavoz Bluetooth JBL Go 3', 'Altavoz portátil resistente al agua', '2017-10-21', 25.0, FALSE, 1),
(103,'Altavoz Xiaomi Mi Compact', 'Altavoz bluetooth compacto', '2017-10-21', 15.0, FALSE, 1),
(104,'Smartphone Samsung A20', null, '2017-10-25', 99.0, FALSE, 2),
(105,'iPhone 8 64GB', 'Reacondicionado, batería nueva', '2017-10-16', 159.0, FALSE, 2),
(106,'Samsung Galaxy S9', null, '2017-10-25', 129.0, FALSE, 2),
(107,'Huawei P30 Lite', 'Buen estado, 128GB', '2017-10-25', 139.0, FALSE, 2),
(108,'Tablet Samsung Tab A 10.1"', 'Tablet con Android y pantalla HD', '2017-10-25', 110.0, FALSE, 9),
(109,'iPad 6ª Gen 32GB', 'Tablet Apple con iOS 14', '2017-10-25', 165.0, FALSE, 9),
(110,'iPhone SE 2020', '64GB, perfecto estado', '2017-10-25', 179.0, FALSE, 2),
(111,'Xiaomi Redmi Note 9', 'Versión global, 4GB RAM', '2017-10-22', 120.0, FALSE, 2),
(112,'Nokia 3310 (reacond.)', 'Icónico móvil clásico', '2017-10-14', 25.0, FALSE, 2),
(113,'Motorola G8 Plus', 'Pantalla FHD+, batería 4000mAh', '2017-10-14', 99.0, FALSE, 2),
(114,'Samsung Galaxy A30s', 'Triple cámara, 64GB', '2017-10-12', 115.0, FALSE, 2),
(115,'Router TP-Link Archer C6', 'WiFi AC1200, Dual Band', '2017-10-25', 29.0, FALSE, 8),
(116,'Router Asus RT-AC1200G+', 'Alta velocidad y cobertura', '2017-10-25', 35.0, FALSE, 8),
(117,'Router Huawei B311', '4G LTE WiFi, SIM desbloqueado', '2017-10-26', 45.0, FALSE, 8),
(118,'Adaptador WiFi USB TP-Link', null, '2017-10-25', 10.0, FALSE, 8),
(119,'Switch Netgear 5 Puertos', 'Gigabit Ethernet', '2017-10-25', 18.0, FALSE, 8),
(120,'Cargador Apple 20W USB-C', 'Cargador rápido original Apple', '2017-10-25', 19.0, FALSE, 10),
(121,'Cargador Samsung 25W', 'Carga rápida USB-C', '2017-10-26', 17.0, FALSE, 10),
(122,'Cargador Xiaomi 33W', 'Carga rápida universal', '2017-10-25', 15.0, FALSE, 10),
(123,'Base carga inalámbrica Anker', 'Carga Qi para smartphones', '2017-10-25', 21.0, FALSE, 10),
(124,'Cargador coche USB doble', 'Compatible con Android y iOS', '2017-10-25', 10.0, FALSE, 10),
(125,'Cargador portátil 10.000mAh', 'Batería externa compacta', '2017-10-26', 25.0, FALSE, 10),
(126,'Powerbank Xiaomi 20.000mAh', 'Carga rápida, 3 puertos USB', '2017-10-25', 32.0, FALSE, 10),
(127,'Cargador inalámbrico MagSafe', 'Compatible con iPhone 12/13/14', '2017-10-25', 39.0, FALSE, 10),
(128,'HDMI Cable 2m', 'Alta velocidad, 4K', '2017-10-25', 5.0, FALSE, 4),
(129,'Cable USB-C 1m', 'Carga y datos, reforzado', '2017-10-11', 4.0, FALSE, 4),
(130,'Teclado Logitech K120', 'Teclado USB sencillo y robusto', '2017-10-20', 10.0, FALSE, 7),
(131,'Ratón Logitech M185', 'Ratón inalámbrico con receptor USB', '2017-10-21', 12.0, FALSE, 7),
(132,'Combo teclado/ratón Trust', 'Teclado y ratón inalámbrico', '2017-10-24', 25.0, FALSE, 7),
(133,'Alfombrilla gamer RGB', 'Antideslizante y retroiluminada', '2017-10-23', 14.0, FALSE, 11),
(134,'Auriculares gaming Trust GXT', 'Micrófono integrado, sonido estéreo', '2017-10-25', 35.0, FALSE, 11),
(135,'Silla gaming Drift DR100', 'Ergonómica, reclinable', '2017-10-23', 125.0, FALSE, 11),
(136,'Webcam Logitech C270', 'Videollamadas HD 720p', '2017-10-25', 30.0, TRUE, 7),
(137,'Disco duro Toshiba 1TB', 'HDD externo USB 3.0', '2017-10-27', 45.0, FALSE, 6),
(138,'Disco duro WD 2TB', 'Almacenamiento fiable para PC', '2017-10-15', 65.0, FALSE, 6),
(139,'Pendrive Kingston 64GB', 'USB 3.1, alta velocidad', '2017-10-27', 9.0, FALSE, 6),
(140,'PC Dell Optiplex i5', null, '2017-10-25', 199.0, FALSE, 5),
(141,'Portátil HP 15,6" Ryzen 5', '8GB RAM, 256GB SSD', '2017-10-25', 329.0, FALSE, 5),
(142,'Portátil Lenovo i3 8GB', 'Disco SSD, reacondicionado', '2017-10-25', 299.0, FALSE, 5),
(143,'Mini PC Intel NUC', null, '2017-10-25', 150.0, FALSE, 5),
(144,'PC Gamer Ryzen 7', 'Gráfica RX 6600, SSD 1TB', '2017-10-25', 850.0, FALSE, 5),
(145,'All-in-One HP 24"', 'Todo en uno, Windows 10', '2017-10-25', 399.0, FALSE, 5),
(146,'Monitor LG 24"', 'FullHD, HDMI y VGA', '2017-10-25', 109.0, FALSE, 5),
(147,'Monitor Samsung 27"', 'Pantalla curva FullHD', '2017-10-25', 179.0, FALSE, 5),
(148,'Impresora HP DeskJet 2710e', 'WiFi, multifunción', '2017-10-25', 59.0, FALSE, 7),
(149,'Impresora láser Brother HL', 'Blanco y negro, económica', '2017-10-25', 79.0, FALSE, 7),
(150,'Impresora Canon Pixma', 'Multifunción a color', '2017-10-25', 65.0, FALSE, 7),
(151,'Portátil reacondicionado Dell', 'i7, 16GB RAM, 512GB SSD', '2017-10-25', 420.0, FALSE, 12),
(152,'Ratón gaming RGB', 'Botones programables', '2017-10-25', 29.0, FALSE, 11),
(153,'Soporte monitor ajustable', 'Soporta hasta 32"', '2017-10-25', 19.0, FALSE, 4),
(154,'Caja externa HDD 2.5"', 'Conexión USB 3.0', '2017-10-25', 12.0, FALSE, 6),
(155,'Mando PS4 Dualshock V2', 'Original Sony', '2017-10-25', 40.0, FALSE, 11),
(156,'Auriculares Sony WH-CH510', 'Auriculares Bluetooth con micrófono integrados', '2023-01-14', 25.0, FALSE, 5),
(157,'Auriculares JBL Tune 500', 'Auriculares on-ear con cable, sonido Pure Bass', '2023-01-16', 18.0, FALSE, 5),
(158,'Auriculares inalámbricos Xiaomi', 'True Wireless, resistentes al agua, caja cargadora', '2023-02-01', 22.5, FALSE, 5),
(159,'Cámara de acción GoPro Hero 7', 'Cámara deportiva con estabilización, 4K', '2023-02-03', 120.0, FALSE, 6),
(160,'Cámara compacta Canon IXUS 185', '20MP, zoom óptico 8x, pantalla LCD', '2023-01-20', 70.0, FALSE, 6),
(161,'Impresora HP DeskJet 2710e', 'Multifunción con Wi-Fi y escáner', '2023-01-14', 39.0, FALSE, 11),
(162,'Impresora Canon Pixma TS3350', 'Multifunción, conexión Wi-Fi, compacta', '2023-01-14', 42.5, FALSE, 11),
(163,'Teclado mecánico Logitech G413', 'Teclado gaming retroiluminado, cableado', '2023-01-12', 55.0, FALSE, 11),
(164,'Ratón Logitech MX Master 2S', 'Ratón ergonómico inalámbrico, 4000 DPI', '2023-01-11', 60.0, FALSE, 11),
(165,'Disco Duro Externo WD Elements 1TB', 'Almacenamiento USB 3.0 portátil', '2023-01-25', 45.0, FALSE, 9),
(166,'Pendrive Kingston 64GB', 'Memoria USB 3.0 de alta velocidad', '2023-01-26', 9.0, FALSE, 9),
(167,'Tarjeta microSD SanDisk 128GB', 'Clase 10 con adaptador SD', '2023-01-27', 15.0, FALSE, 9),
(168,'Router TP-Link Archer C6', 'Wi-Fi Dual Band AC1200 con 4 antenas', '2023-01-30', 35.0, FALSE, 12),
(169,'Switch D-Link 8 puertos', 'Switch Ethernet no gestionado, 10/100 Mbps', '2023-02-01', 20.0, FALSE, 12);

INSERT INTO ESTABLECIMIENTOS (NIF,
							  NOMBRE_COMERCIAL,
							  DIRECCION,
							  POBLACION,
							  PROVINCIA,
							  CODIGO_POSTAL,
							  PAIS,
							  TELEFONO,
							  MOVIL,
							  EMAIL,
							  FECHA_INAUGURACION) VALUES
('B38983321', 'Gran Via 2', 'Gran Via de Les Corts Catalanes, 345', 'Barcelona', 'Barcelona','08034', 'España', '+34 932247078', null, 'granvia2@secondlife.com', '2003-10-20'),
('B00177845', 'Vaguada', 'Av. de Monforte de Lemos, 36', 'Madrid', 'Madrid','28029', 'España', '+34 913682828', '620897644', 'lavaguada@secondlife.com', '2011-08-14');

INSERT INTO PERSONAS(CODIGO, 
					 DNI,
					 NOMBRE,
					 APELLIDO1,
					 APELLIDO2,
					 DIRECCION,
					 POBLACION,
					 CODIGO_POSTAL,
					 PROVINCIA,
					 PAIS,
					 TELEFONO,
					 MOVIL,
					 EMAIL) VALUES
(10, '45899812L', 'Marta', 'Quesada', 'Olmos', 'c/Marina, 234 2º 1ª', 'Barcelona', '08014', 'Barcelona', 'España', '932318811', null, 'apax344@hotmail.com'),
(11, '30092765K', 'José Ramón', 'Peña', 'Ojeda', 'c/Muntaner, 230 ', 'Barcelona', '08020', 'Barcelona', 'España', '93 2209088', '620109034', 'jr200@gmail.com'),
(12, '45011723P', 'Carlos Jesús', 'Olmedo', 'Cierco', null, 'Madrid', null, 'Madrid', 'España', null, null, 'carlosj20@gmail.com'),
(13, 'X58993234', 'Walter', 'Peralta', null, 'c/ Juan Soldevila, 34 ático 1', 'Teruel', '28933', 'Teruel', 'España', '982209090', null, 'jsprod34@hotmail.com'),
(14, '40922311S', 'Anna', 'Balcells', 'Rius', 'Avda. Del Roble, 230', 'Santa Coloma de Gramanet', '08921', 'Barcelona', 'España', '934567809', '609908756', 'balc.rius@hotmail.com'),
(15, '30998123T', 'Enric', 'Balcells', 'Rius', 'c/ Republica 201', 'Barcelona', '08003', 'Barcelona', 'España', '932209012', null, 'enric.enric@hotmail.com');

INSERT INTO CLIENTES(CODIGO, GOLD) VALUES
(10, true),
(12, false);

INSERT INTO EMPLEADOS(CODIGO, LICENCIA_MANIPULADOR_ALIMENTOS) VALUES
(11, 'LMA200912T'),
(13, 'LMA009200S'),
(14, 'LMA201222R'),
(15, 'LMA200001T');

INSERT INTO PEDIDOS (CODIGO, FECHA_HORA, CODIGO_EMPLEADO, ESTADO, CODIGO_CLIENTE, NIF_ESTABLECIMIENTO) VALUES
(1000, '2023-04-17 09:01:42.069', 11, 'SERVIDO', null, 'B38983321'),
(1001, '2023-04-17 09:05:13.012', 13, 'SERVIDO', null, 'B00177845'),
(1002, '2023-04-17 09:12:11.134', 11, 'SERVIDO', null, 'B38983321'),
(1003, '2023-04-17 09:22:02.234', 15, 'CANCELADO', null, 'B00177845'),
(1004, '2023-04-17 09:23:17.123', 11, 'SERVIDO', null, 'B38983321'),
(1005, '2023-04-17 09:25:39.009', 11, 'SERVIDO', null, 'B38983321'),
(1006, '2023-04-17 09:31:23.204', 15, 'SERVIDO', null, 'B38983321'),
(1007, '2023-04-17 09:37:43.401', 11, 'SERVIDO', 10, 'B38983321'),
(1008, '2023-04-17 09:42:54.403', 15, 'SERVIDO', null, 'B00177845'),
(1009, '2023-04-17 09:48:33.500', 11, 'SERVIDO', null, 'B38983321'),
(1010, '2023-04-17 09:51:19.030', 11, 'EN_PROCESO', null, 'B38983321'),
(1011, '2023-04-17 09:58:13.509', 13, 'SERVIDO', null, 'B38983321'),
(1012, '2023-04-17 10:00:07.124', 11, 'PENDIENTE_ENTREGA', 10, 'B38983321'),
(1013, '2023-04-17 10:06:10.222', 13, 'PENDIENTE_ENTREGA', null, 'B38983321'),
(1014, '2023-04-17 10:14:51.298', 15, 'NUEVO', null, 'B00177845');

UPDATE PEDIDOS SET comentario = 'No incluir servilletas' WHERE CODIGO = 1000;
UPDATE PEDIDOS SET comentario = 'Vasos con hielo' WHERE CODIGO = 1011;

INSERT INTO LINEAS_PEDIDO (CODIGO_PEDIDO, ORDEN, CODIGO_PRODUCTO, CANTIDAD, PRECIO) VALUES
(1000, 0, 100, 2, 6.0),
(1000, 1, 103, 8, 3.0),
(1001, 0, 102, 1, 3.0),
(1002, 0, 137, 2, 1.2),
(1002, 1, 108, 1, 7.7),
(1002, 2, 115, 1, 2.5),
(1002, 3, 120, 1, 1.7),
(1003, 0, 159, 1, 2.0),
(1003, 1, 137, 1, 1.2),
(1004, 0, 108, 1, 7.7),
(1004, 1, 103, 1, 3.0),
(1004, 2, 105, 1, 8.5),
(1004, 3, 137, 1, 1.2),
(1004, 4, 156, 3, 1.5),
(1005, 0, 156, 2, 1.5),
(1006, 0, 156, 2, 1.5),
(1006, 1, 158, 1, 1.5),
(1006, 2, 120, 1, 1.7),
(1006, 3, 104, 1, 6.7),
(1007, 0, 156, 3, 1.5),
(1007, 1, 158, 1, 1.5),
(1007, 2, 115, 1, 2.5),
(1007, 3, 110, 2, 8.0),
(1007, 4, 139, 1, 2.0),
(1007, 5, 121, 1, 1.7),
(1007, 6, 111, 1, 7.0),
(1007, 7, 103, 2, 3.0),
(1007, 8, 161, 2, 2.5),
(1007, 9, 162, 1, 2.5),
(1008, 0, 159, 2, 2.0),
(1008, 1, 163, 1, 2.6),
(1008, 2, 137, 3, 1.2),
(1008, 3, 109, 1, 6.7),
(1008, 4, 161, 1, 2.5),
(1008, 5, 117, 1, 2.5),
(1009, 0, 166, 1, 2.7),
(1009, 1, 157, 1, 1.8),
(1009, 2, 162, 1, 2.5),
(1010, 0, 107, 1, 7.0),
(1010, 1, 120, 1, 1.7),
(1010, 2, 156, 1, 1.5),
(1011, 0, 167, 1, 2.7),
(1011, 1, 161, 1, 2.5),
(1012, 0, 159, 1, 2.0),
(1012, 1, 161, 2, 2.5),
(1013, 0, 159, 2, 2.0),
(1013, 1, 164, 1, 2.9),
(1013, 2, 157, 1, 1.8),
(1014, 0, 108, 1, 7.7),
(1014, 1, 103, 1, 3.0),
(1014, 2, 166, 1, 2.7),
(1014, 3, 156, 3, 1.5),
(1014, 4, 102, 2, 2.5);

-- ******************************************************
-- 
--                  SPRING SECURITY 
-- 
-- ******************************************************

INSERT INTO ROLES (ID, NAME) VALUES (1, 'SUPER_ADMIN');
INSERT INTO ROLES (ID, NAME) VALUES (2, 'ADMIN');
INSERT INTO ROLES (ID, NAME) VALUES (3, 'CLIENTE');

/*
  	role						        username	password        enabled
 	========================================================================================================
 	SUPER_ADMIN, ADMIN, CLIENTE	    	u1		    password
 	SUPER_ADMIN, ADMIN	    	        u2		    password
 	SUPER_ADMIN			                u3		    password
 	ADMIN			                    u4		    password
 	CLIENTE                        		u5   	    password
 	CLIENTE		                        u6		    password		(this user is disabled)
 */

INSERT INTO USERS (ID, USERNAME, PASSWORD, FIRST_NAME, LAST_NAME, EMAIL, TELEFONO, ENABLED, LAST_PASSWORD_RESET_DATE) VALUES
(1, 'u1', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Pepín', 'Gálvez Ridruejuela', 'u1@gmail.com', '+34 636598871', 1, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy')),
(2, 'u2', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Montse', 'Queralt Conejero', 'pingo@pingo.com','687253062', 1, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy')),
(3, 'u3', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Carlota', 'Fernández Olaz', 'pingo@pingo.com','962207855', 1, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy')),
(4, 'u4', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Honorio', 'Martín Salvador', 'disabled@user.com', '607253012', 1, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy')),
(5, 'u5', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'Marta', 'Olmos Medina', 'marta@admin.com','93220909872', 1, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy')),
(6, 'u6', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC', 'José Ramón', 'Fernández Grimal', 'admin@admin.com','629457021', 0, PARSEDATETIME('01-01-2016', 'dd-MM-yyyy'));

INSERT INTO USER_ROLES (ID_USER, ID_ROL) VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(3,1),
(4,2),
(5,3),
(6,3);

