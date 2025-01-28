/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     28/08/2023 17:23:12                          */
/*==============================================================*/

/*==============================================================*/
/* Table: CONDUCTOR                                             */
/*==============================================================*/
create table CONDUCTOR (
   ID_CONDUCTOR         SERIAL               not null,
   NOMBRE_CONDUCTOR     VARCHAR(30)          not null,
   APELLIDO_CONDUCTOR   VARCHAR(30)          not null,
   TELEFONO_CONDUCTOR   VARCHAR(10)          not null,
   EMAIL_CONDUCTOR      VARCHAR(30)          not null,
   constraint PK_CONDUCTOR primary key (ID_CONDUCTOR)
);

/*==============================================================*/
/* Index: CONDUCTOR_PK                                          */
/*==============================================================*/
create unique index CONDUCTOR_PK on CONDUCTOR (
ID_CONDUCTOR
);

/*==============================================================*/
/* Table: DIRECCION                                             */
/*==============================================================*/
create table DIRECCION (
   ID_DIRECCION         SERIAL               not null,
   LATITUD_INICIO       FLOAT8               not null,
   LONGITUD_INICIO      FLOAT8               not null,
   LATITUD_FINAL        FLOAT8               not null,
   LONGITUD_FINAL       FLOAT8               not null,
   constraint PK_DIRECCION primary key (ID_DIRECCION)
);

/*==============================================================*/
/* Index: DIRECCION_PK                                          */
/*==============================================================*/
create unique index DIRECCION_PK on DIRECCION (
ID_DIRECCION
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO (
   ID_PEDIDO            SERIAL               not null,
   ID_USUARIO           INT4                 null,
   ID_CONDUCTOR         INT4                 null,
   ID_SERVICIO          INT4                 null,
   NUMERO_PEDIDO        VARCHAR(5)           not null,
   PRECIO_PEDIDO        NUMERIC              not null,
   DISTANCIA_PEDIDO     FLOAT8               not null,
   FECHA_PEDIDO         DATE                 not null,
   constraint PK_PEDIDO primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Index: PEDIDO_PK                                             */
/*==============================================================*/
create unique index PEDIDO_PK on PEDIDO (
ID_PEDIDO
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on PEDIDO (
ID_USUARIO
);

/*==============================================================*/
/* Index: ACEPTA_FK                                             */
/*==============================================================*/
create  index ACEPTA_FK on PEDIDO (
ID_CONDUCTOR
);

/*==============================================================*/
/* Index: OFRECE_FK                                             */
/*==============================================================*/
create  index OFRECE_FK on PEDIDO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          SERIAL               not null,
   NOMBRE_SERVICIO      VARCHAR(15)          not null,
   TARIFA               MONEY                not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE (
   ID                   SERIAL               not null,
   ID_DIRECCION         INT4                 not null,
   ID_PEDIDO            INT4                 not null,
   NUMERO_ESCALAS       INT4                 not null,
   constraint PK_TIENE primary key (ID, ID_DIRECCION, ID_PEDIDO)
);

/*==============================================================*/
/* Index: TIENE_PK                                              */
/*==============================================================*/
create unique index TIENE_PK on TIENE (
ID,
ID_DIRECCION,
ID_PEDIDO
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on TIENE (
ID_DIRECCION
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           SERIAL               not null,
   NOMBRE_USUARIO       VARCHAR(30)          not null,
   APELLIDO_USUARIO     VARCHAR(30)          not null,
   TELEFONO_USUARIO     VARCHAR(10)          not null,
   EMAIL_USUARIO        VARCHAR(30)          not null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
ID_USUARIO
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          SERIAL               not null,
   ID_CONDUCTOR         INT4                 null,
   PLACA_VEHICULO       VARCHAR(7)           not null,
   MARCA_VEHICULO       CHAR(15)             not null,
   MODELO_VEHICULO      VARCHAR(15)          not null,
   COLOR_VEHICULO       VARCHAR(15)          not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Index: VEHICULO_PK                                           */
/*==============================================================*/
create unique index VEHICULO_PK on VEHICULO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: REGISTRA_FK                                           */
/*==============================================================*/
create  index REGISTRA_FK on VEHICULO (
ID_CONDUCTOR
);

alter table PEDIDO
   add constraint FK_PEDIDO_ACEPTA_CONDUCTO foreign key (ID_CONDUCTOR)
      references CONDUCTOR (ID_CONDUCTOR)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_OFRECE_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table PEDIDO
   add constraint FK_PEDIDO_REALIZA_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIENE_TIENE_DIRECCIO foreign key (ID_DIRECCION)
      references DIRECCION (ID_DIRECCION)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIENE_TIENE2_PEDIDO foreign key (ID_PEDIDO)
      references PEDIDO (ID_PEDIDO)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_REGISTRA_CONDUCTO foreign key (ID_CONDUCTOR)
      references CONDUCTOR (ID_CONDUCTOR)
      on delete restrict on update restrict;
------------------------------------------------------------------------
-- Insertar datos de muestra en la tabla CONDUCTOR
INSERT INTO CONDUCTOR (NOMBRE_CONDUCTOR, APELLIDO_CONDUCTOR, TELEFONO_CONDUCTOR, EMAIL_CONDUCTOR)
VALUES
    ('Juan', 'González', '1234567890', 'juan@gmail.com'),
    ('Maria', 'Lopez', '9876543210', 'maria@gmail.com'),
    ('Pedro', 'Rodriguez', '5555555555', 'pedro@gmail.com'),
    ('Carlos', 'López', '5551112233', 'carlos@example.com'),
    ('Laura', 'Gómez', '5554445566', 'laura@example.com'),
    ('Manuel', 'Torres', '5557778899', 'manuel@example.com'),
    ('Elena', 'Vargas', '5552223344', 'elena@example.com'),
    ('Miguel', 'Díaz', '5555556677', 'miguel@example.com'),
    ('Ana', 'Pérez', '5558889900', 'ana@example.com'),
	('Sara', 'García', '5553334455', 'sara@example.com'),
	('Diego', 'Hernández', '5556667788', 'diego@example.com'),
	('Isabel', 'Rojas', '5559990011', 'isabel@example.com'),
	('Javier', 'Martínez', '5554441122', 'javier@example.com'),
	('Luis', 'Fernández', '5557772233', 'luis@example.com'),
	('Paula', 'López', '5551113344', 'paula@example.com'),
	('David', 'Gómez', '5555555566', 'david@example.com'),
	('María', 'Torres', '5558888899', 'maria@example.com'),
	('Sergio', 'Vargas', '5553339900', 'sergio@example.com'),
	('Carmen', 'Díaz', '5556660011', 'carmen@example.com'),
	('Roberto', 'Pérez', '5559991122', 'roberto@example.com'),
	('Lucas', 'Hernández', '5557778899', 'lucas@example.com'),
	('Luisa', 'Gómez', '5556665566', 'luisa@example.com'),
	('Eduardo', 'Martínez', '5553331122', 'eduardo@example.com'),
	('Isabella', 'Rodriguez', '5554442233', 'isabella@example.com'),
	('Andrea', 'González', '5551115566', 'andrea@example.com'),
	('Mario', 'Sánchez', '5558886677', 'mario@example.com'),
	('Silvia', 'Pérez', '5554448899', 'silvia@example.com'),
	('Ricardo', 'Torres', '5555550011', 'ricardo@example.com'),
	('Fernanda', 'Díaz', '5552222233', 'fernanda@example.com'),
	('Gustavo', 'López', '5557775566', 'gustavo@example.com'),
	('Gabriel', 'Hernández', '5551112233', 'gabriel@example.com'),
	('Carmen', 'Rojas', '5554445566', 'carmen@example.com'),
	('Diego', 'Gómez', '5557778899', 'diego@example.com'),
	('Sofía', 'Pérez', '5552223344', 'sofia@example.com'),
	('Andrés', 'Díaz', '5555556677', 'andres@example.com'),
	('María', 'García', '5558889900', 'maria@example.com'),
	('Laura', 'Hernández', '5553334455', 'laura@example.com'),
	('Javier', 'Torres', '5556667788', 'javier@example.com'),
	('Paula', 'Rojas', '5559990011', 'paula@example.com'),
	('Roberto', 'Gómez', '5554441122', 'roberto@example.com'),
	('Valentina', 'López', '5557772233', 'valentina@example.com'),
	('Elena', 'Hernández', '5551113344', 'elena@example.com'),
	('Miguel', 'García', '5555555566', 'miguel@example.com'),
	('Ana', 'Díaz', '5558888899', 'ana@example.com'),
	('Sara', 'Torres', '5553339900', 'sara@example.com'),
	('Diego', 'Rojas', '5556660011', 'diego@example.com'),
	('Isabel', 'Gómez', '5559991122', 'isabel@example.com'),
	('Javier', 'Pérez', '5551112233', 'javier@example.com'),
	('Luis', 'Martínez', '5554445566', 'luis@example.com'),
	('Paula', 'López', '5557778899', 'paula@example.com');

	
	
	
	
	
-- Insertar datos de muestra en la tabla DIRECCION
INSERT INTO DIRECCION (LATITUD_INICIO, LONGITUD_INICIO, LATITUD_FINAL, LONGITUD_FINAL)
VALUES
    (40.7128, -74.0060, 34.0522, -118.2437),
    (51.5074, -0.1278, 48.8566, 2.3522),
    (37.7749, -122.4194, 34.0522, -118.2437),
	(41.8781, -87.6298, 34.0522, -118.2437),
	(51.5099, -0.1337, 48.8566, 2.3522),
	(37.7749, -122.4194, 34.0522, -118.2437),
	(40.7128, -74.0060, 51.5099, -0.1337),
	(34.0522, -118.2437, 37.7749, -122.4194),
	(48.8566, 2.3522, 41.8781, -87.6298),
	(52.5200, 13.4050, 55.7558, 37.6176),
	(45.4215, -75.6919, 43.6511, -79.3832),
	(51.5074, -0.1278, 52.5200, 13.4050),
	(37.7749, -122.4194, 45.4215, -75.6919),
	(40.7128, -74.0060, 51.5074, -0.1278),
	(34.0522, -118.2437, 48.8566, 2.3522),
	(43.6511, -79.3832, 37.7749, -122.4194),
	(55.7558, 37.6176, 52.5200, 13.4050),
	(33.6844, -117.8265, 34.0522, -118.2437),
	(41.8781, -87.6298, 43.6511, -79.3832),
	(13.4050, 55.7558, 33.6844, -117.8265),
	(40.7128, -74.0060, 34.0522, -118.2437),
	(51.5074, -0.1278, 48.8566, 2.3522),
	(34.0522, -118.2437, 40.7128, -74.0060),
	(41.8781, -87.6298, 51.5099, -0.1337),
	(51.5099, -0.1337, 37.7749, -122.4194),
	(37.7749, -122.4194, 48.8566, 2.3522),
	(34.0522, -118.2437, 43.6511, -79.3832),
	(43.6511, -79.3832, 55.7558, 37.6176),
	(55.7558, 37.6176, 33.6844, -117.8265),
	(33.6844, -117.8265, 41.8781, -87.6298),
	(38.8951, -77.0369, 34.0522, -118.2437),
	(37.7749, -122.4194, 41.8781, -87.6298),
	(35.682839, 139.759455, 40.7128, -74.0060),
	(51.509865, -0.118092, 48.8566, 2.3522),
	(34.0522, -118.2437, 37.7749, -122.4194),
	(40.7128, -74.0060, 51.509865, -0.118092),
	(48.8566, 2.3522, 35.682839, 139.759455),
	(55.7558, 37.6176, 45.4215, -75.6919),
	(43.651070, -79.347015, 51.509865, -0.118092),
	(34.0522, -118.2437, 55.7558, 37.6176),
	(37.7749, -122.4194, 43.651070, -79.347015),
	(34.0522, -118.2437, 51.509865, -0.118092),
	(40.7128, -74.0060, 37.7749, -122.4194),
	(48.8566, 2.3522, 34.0522, -118.2437),
	(45.4215, -75.6919, 48.8566, 2.3522),
	(55.7558, 37.6176, 40.7128, -74.0060),
	(33.6844, -117.8265, 34.0522, -118.2437),
	(41.8781, -87.6298, 55.7558, 37.6176),
	(13.4050, 52.5200, 33.6844, -117.8265),
	(37.7749, -122.4194, 34.0522, -118.2437);
	
-- Insertar datos de muestra en la tabla SERVICIO
INSERT INTO SERVICIO (NOMBRE_SERVICIO, TARIFA)
VALUES
	('Paquetes', 15.00),
	('Viaje', 25.00),
	('Mensajería', 12.00),
	('Alimentos', 20.00),
	('Turismo', 10.00),
	('Compras', 18.00),
	('Traslados', 30.00),
	('Documentos', 8.00),
	('Mudanzas', 40.00);
	
-- Insertar datos de muestra en la tabla USUARIO
INSERT INTO USUARIO (NOMBRE_USUARIO, APELLIDO_USUARIO, TELEFONO_USUARIO, EMAIL_USUARIO)
VALUES
	('Carlos', 'Martínez', '1111111111', 'carlos@gmail.com'),
    ('John', 'Doe', '5551234567', 'john@example.com'),
    ('Jane', 'Smith', '5559876543', 'jane@example.com'),
    ('Robert', 'Johnson', '5555555555', 'robert@example.com'),
	('Rosa', 'González', '5551112233', 'rosa@example.com'),
	('Mario', 'López', '5554445566', 'mario@example.com'),
	('Patricia', 'Torres', '5557778899', 'patricia@example.com'),
	('Alejandro', 'Vargas', '5552223344', 'alejandro@example.com'),
	('Silvia', 'Díaz', '5555556677', 'silvia@example.com'),
	('Hugo', 'Pérez', '5558889900', 'hugo@example.com'),
	('Cecilia', 'García', '5553334455', 'cecilia@example.com'),
	('Raúl', 'Hernández', '5556667788', 'raul@example.com'),
	('Adriana', 'Rojas', '5559990011', 'adriana@example.com'),
	('Jorge', 'Martínez', '5554441122', 'jorge@example.com'),
	('Lucía', 'Fernández', '5557772233', 'lucia@example.com'),
	('Pablo', 'López', '5551113344', 'pablo@example.com'),
	('Eva', 'Gómez', '5555555566', 'eva@example.com'),
	('Juan', 'Torres', '5558888899', 'juan@example.com'),
	('Isabella', 'Vargas', '5553339900', 'isabella@example.com'),
	('Fernando', 'Díaz', '5556660011', 'fernando@example.com'),
	('Carolina', 'Pérez', '5559991122', 'carolina@example.com'),
	('Gustavo', 'Rojas', '5555556677', 'gustavo@example.com'),
	('Sofía', 'Gómez', '5554448899', 'sofia@example.com'),
	('Andrés', 'Hernández', '5552220011', 'andres@example.com'),
	('María', 'López', '5557773344', 'maria@example.com'),
	('Luis', 'Torres', '5558885566', 'luis@example.com'),
	('Valentina', 'Sánchez', '5553336677', 'valentina@example.com'),
	('Andrea', 'Torres', '5556668899', 'andrea@example.com'),
	('Javier', 'Gómez', '5555550011', 'javier@example.com'),
	('Diana', 'Pérez', '5552222233', 'diana@example.com'),
	('Gustavo', 'Hernández', '1111111111', 'gustavo@gmail.com'),
	('Sofía', 'Rojas', '2222222222', 'sofia@gmail.com'),
	('Andrés', 'Gómez', '3333333333', 'andres@gmail.com'),
	('María', 'Pérez', '4444444444', 'maria@gmail.com'),
	('Laura', 'Díaz', '5555555555', 'laura@gmail.com'),
	('Javier', 'García', '6666666666', 'javier@gmail.com'),
	('Paula', 'Hernández', '7777777777', 'paula@gmail.com'),
	('Roberto', 'Torres', '8888888888', 'roberto@gmail.com'),
	('Valentina', 'Rojas', '9999999999', 'valentina@gmail.com'),
	('Elena', 'Gómez', '0000000000', 'elena@gmail.com'),
	('Miguel', 'Pérez', '1111111122', 'miguel@gmail.com'),
	('Ana', 'Díaz', '2222222233', 'ana@gmail.com'),
	('Sara', 'García', '3333333344', 'sara@gmail.com'),
	('Diego', 'Hernández', '4444444455', 'diego@gmail.com'),
	('Isabel', 'Rojas', '5555555566', 'isabel@gmail.com'),
	('Javier', 'Martínez', '6666666677', 'javier@example.com'),
	('Luis', 'Fernández', '7777777788', 'luis@example.com'),
	('Paula', 'López', '8888888899', 'paula@example.com'),
	('Roberto', 'Gómez', '9999999900', 'roberto@example.com'),
	('Valentina', 'Rojas', '0000000011', 'valentina@example.com');

-- Insertar datos de muestra en la tabla VEHICULO
INSERT INTO VEHICULO (ID_CONDUCTOR, PLACA_VEHICULO, MARCA_VEHICULO, MODELO_VEHICULO, COLOR_VEHICULO)
VALUES
    (1, 'ABC123', 'Nissan', 'Sentra', 'Rojo'),
    (2, 'XYZ789', 'Toyota', 'Corolla', 'Azul'),
    (3, 'DEF456', 'Honda', 'Civic', 'Negro'),
	(4, 'JKL321', 'Ford', 'Fiesta', 'Verde'),
	(5, 'MNO987', 'Chevrolet', 'Cruze', 'Plateado'),
	(6, 'PQR654', 'Hyundai', 'Elantra', 'Gris'),
	(7, 'STU123', 'Kia', 'Sportage', 'Blanco'),
	(8, 'VWX789', 'Toyota', 'Camry', 'Dorado'),
	(9, 'YZA456', 'Honda', 'Accord', 'Negro'),
	(10, 'BCD987', 'Volkswagen', 'Jetta', 'Azul'),
	(11, 'EFG654', 'Nissan', 'Altima', 'Rojo'),
	(12, 'HIJ321', 'Mazda', 'CX-5', 'Plateado'),
	(13, 'KLM987', 'Subaru', 'Outback', 'Blanco'),
	(14, 'NOP654', 'Audi', 'A4', 'Gris'),
	(15, 'QRS321', 'Mercedes-Benz', 'C-Class', 'Negro'),
	(16, 'TUV987', 'BMW', '3 Series', 'Azul'),
	(17, 'WXY654', 'Lexus', 'ES', 'Rojo'),
	(18, 'YZA321', 'Ford', 'Mustang', 'Amarillo'),
	(19, 'BCD987', 'Chevrolet', 'Malibu', 'Verde'),
	(20, 'EFG654', 'Kia', 'Optima', 'Plateado'),
	(21, 'ABC555', 'Toyota', 'Rav4', 'Gris'),
	(22, 'XYZ444', 'Honda', 'Fit', 'Negro'),
	(23, 'DEF333', 'Ford', 'Escape', 'Azul'),
	(24, 'JKL222', 'Chevrolet', 'Equinox', 'Plateado'),
	(25, 'MNO111', 'Kia', 'Soul', 'Rojo'),
	(26, 'PQR999', 'Nissan', 'Rogue', 'Blanco'),
	(27, 'STU888', 'Mazda', 'CX-9', 'Negro'),
	(28, 'VWX777', 'Audi', 'Q5', 'Gris'),
	(29, 'YZA666', 'Mercedes-Benz', 'GLC', 'Azul'),
	(30, 'BCD444', 'BMW', 'X3', 'Dorado'),
	(31, 'XYZ123', 'Kia', 'Sorento', 'Blanco'),
	(32, 'MNO789', 'Hyundai', 'Tucson', 'Dorado'),
	(33, 'PQR456', 'Toyota', 'Highlander', 'Plateado'),
	(34, 'STU123', 'Nissan', 'Rogue', 'Rojo'),
	(35, 'VWX789', 'Ford', 'Escape', 'Verde'),
	(36, 'YZA456', 'Chevrolet', 'Equinox', 'Azul'),
	(37, 'BCD987', 'Honda', 'CR-V', 'Negro'),
	(38, 'EFG654', 'Mazda', 'CX-9', 'Gris'),
	(39, 'HIJ321', 'Subaru', 'Forester', 'Blanco'),
	(40, 'KLM987', 'Audi', 'Q5', 'Plateado'),
	(41, 'NOP654', 'Mercedes-Benz', 'GLC', 'Gris'),
	(42, 'QRS321', 'BMW', 'X3', 'Azul'),
	(43, 'TUV987', 'Lexus', 'RX', 'Rojo'),
	(44, 'WXY654', 'Tesla', 'Model Y', 'Blanco'),
	(45, 'YZA321', 'Volkswagen', 'Tiguan', 'Negro'),
	(46, 'BCD987', 'Ford', 'Explorer', 'Azul'),
	(47, 'EFG654', 'Toyota', '4Runner', 'Verde'),
	(48, 'HIJ321', 'Chevrolet', 'Traverse', 'Plateado'),
	(49, 'KLM987', 'Honda', 'Pilot', 'Negro'),
	(50, 'NOP654', 'Kia', 'Telluride', 'Blanco');

--Tabla PEDIDO:
INSERT INTO PEDIDO (ID_USUARIO, ID_CONDUCTOR, ID_SERVICIO, NUMERO_PEDIDO, PRECIO_PEDIDO, DISTANCIA_PEDIDO, FECHA_PEDIDO) 
VALUES 
	(1, 1, 2, 'P001', 30.00, 10.5, '2022-10-15'),
	(2, 3, 1, 'P002', 15.00, 5.2, '2022-09-20'),
	(3, 2, 3, 'P003', 18.00, 7.8, '2022-08-05'),
	(4, 4, 3, 'P004', 22.00, 8.7, '2022-11-10'),
	(5, 5, 2, 'P005', 25.00, 11.8, '2022-11-15'),
	(6, 6, 1, 'P006', 18.00, 7.2, '2022-11-20'),
	(7, 7, 3, 'P007', 20.00, 9.5, '2022-11-25'),
	(8, 8, 2, 'P008', 23.00, 10.1, '2022-11-30'),
	(9, 9, 1, 'P009', 16.00, 6.5, '2022-12-05'),
	(10, 10, 3, 'P010', 28.00, 13.4, '2022-12-10'),
	(11, 11, 2, 'P011', 27.00, 12.9, '2022-12-15'),
	(12, 12, 1, 'P012', 19.00, 7.8, '2022-12-20'),
	(13, 13, 3, 'P013', 32.00, 15.7, '2022-12-25'),
	(14, 14, 2, 'P014', 29.00, 14.2, '2022-12-30'),
	(15, 15, 1, 'P015', 21.00, 9.1, '2022-01-05'),
	(16, 16, 3, 'P016', 35.00, 17.3, '2022-01-10'),
	(17, 17, 2, 'P017', 26.00, 11.5, '2022-01-15'),
	(18, 18, 1, 'P018', 17.00, 6.9, '2022-01-20'),
	(19, 19, 3, 'P019', 30.00, 14.9, '2022-01-25'),
	(20, 20, 2, 'P020', 24.00, 10.7, '2022-01-30'),
	(21, 21, 1, 'P021', 19.00, 8.5, '2022-02-05'),
	(22, 22, 3, 'P022', 33.00, 16.4, '2022-02-10'),
	(23, 23, 2, 'P023', 25.00, 11.1, '2022-02-15'),
	(24, 24, 1, 'P024', 18.00, 7.7, '2022-02-20'),
	(25, 25, 3, 'P025', 37.00, 18.9, '2022-02-25'),
	(26, 26, 2, 'P026', 28.00, 13.0, '2022-03-05'),
	(27, 27, 1, 'P027', 20.00, 9.8, '2022-03-10'),
	(28, 28, 3, 'P028', 39.00, 19.7, '2022-03-15'),
	(29, 29, 2, 'P029', 31.00, 14.5, '2022-03-20'),
	(30, 30, 1, 'P030', 22.00, 10.3, '2022-03-25'),
	(31, 21, 2, 'P021', 30.00, 10.5, '2022-02-05'),
	(32, 22, 1, 'P022', 15.00, 5.2, '2022-02-10'),
	(33, 23, 3, 'P023', 18.00, 7.8, '2022-02-15'),
	(34, 24, 2, 'P024', 22.00, 8.7, '2022-02-20'),
	(35, 25, 1, 'P025', 25.00, 11.8, '2022-02-25'),
	(36, 26, 3, 'P026', 18.00, 7.2, '2022-03-05'),
	(37, 27, 2, 'P027', 20.00, 9.5, '2022-03-10'),
	(38, 28, 1, 'P028', 23.00, 10.1, '2022-03-15'),
	(39, 29, 3, 'P029', 16.00, 6.5, '2022-03-20'),
	(40, 30, 2, 'P030', 28.00, 13.4, '2022-03-25'),
	(41, 31, 1, 'P031', 27.00, 12.9, '2022-04-05'),
	(42, 32, 3, 'P032', 19.00, 7.8, '2022-04-10'),
	(43, 33, 2, 'P033', 32.00, 15.7, '2022-04-15'),
	(44, 34, 1, 'P034', 29.00, 14.2, '2022-04-20'),
	(45, 35, 3, 'P035', 21.00, 9.1, '2022-04-25'),
	(46, 36, 2, 'P036', 35.00, 17.3, '2022-05-05'),
	(47, 37, 1, 'P037', 26.00, 11.5, '2022-05-10'),
	(48, 38, 3, 'P038', 17.00, 6.9, '2022-05-15'),
	(49, 39, 2, 'P039', 30.00, 14.9, '2022-05-20'),
	(50, 40, 1, 'P040', 24.00, 10.7, '2022-05-25');

--Tabla TIENE:
INSERT INTO TIENE (ID_DIRECCION, ID_PEDIDO, NUMERO_ESCALAS) 
VALUES 
	(1, 1, 0),
	(2, 2, 1),
	(3, 3, 2),
	(4, 4, 1),
	(5, 5, 0),
	(6, 6, 2),
	(7, 7, 1),
	(8, 8, 0),
	(9, 9, 1),
	(10, 10, 0),
	(11, 11, 2),
	(12, 12, 0),
	(13, 13, 1),
	(14, 14, 0),
	(15, 15, 2),
	(16, 16, 0),
	(17, 17, 1),
	(18, 18, 0),
	(19, 19, 2),
	(20, 20, 0),
	(21, 21, 1),
	(22, 22, 0),
	(23, 23, 2),
	(24, 24, 0),
	(25, 25, 1),
	(26, 26, 0),
	(27, 27, 2),
	(28, 28, 0),
	(29, 29, 1),
	(30, 30, 0),
	(31, 21, 1),
	(32, 22, 0),
	(33, 23, 2),
	(34, 24, 0),
	(35, 25, 1),
	(36, 26, 0),
	(37, 27, 2),
	(38, 28, 0),
	(39, 29, 1),
	(40, 30, 0),
	(41, 31, 2),
	(42, 32, 0),
	(43, 33, 1),
	(44, 34, 0),
	(45, 35, 2),
	(46, 36, 0),
	(47, 37, 1),
	(48, 38, 0),
	(49, 39, 2),
	(50, 40, 0);




