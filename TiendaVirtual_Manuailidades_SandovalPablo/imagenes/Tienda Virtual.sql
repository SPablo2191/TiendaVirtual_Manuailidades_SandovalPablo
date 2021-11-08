--Base de Datos para MI HUELLA MOSAICOS---------
create database TiendaVirtualMiHuella
--drop database TiendaVirtualMiHuella
-----------------------------------------------------------------
create table Usuario(
	nombre_usuario nvarchar(50) not null,
	nombre_apellido nvarchar(50) not null,
	DNI BIGINT not null,
	email nvarchar(100) not null,
	contraseña nvarchar(50) not null,
	num_celular BIGINT not null,
	direccion nvarchar(100) not null,
	sueldo float not null
)
------------------------------------------------------------------
create table tpo_usuario(
	id_usuario nvarchar(50) not null,
	descripcion varchar(70) not null
)
------------------------------------------------------------------
create table factura(
	id_factura int identity(1,1) not null,
	total float null,
	estado varchar(30) not null,
	descripcion nvarchar(50) not null
)
------------------------------------------------------------------
create table LFactura(
	id_lf int  identity(1,1) not null,
	nombre_prod nvarchar(100) null,
	precio_prod float null,
)
------------------------------------------------------------------
create table ModoDePago(
	 id_mp int not null,
	 descripcion nvarchar(50) not null
)
------------------------------------------------------------------
create table tpo_Envio(
	id_tpoEnvio int not null,
	descripcion nvarchar(50) not null
)
------------------------------------------------------------------
create table producto(
	id_producto int not null,
	nombre nvarchar(100) not null,
	precio float not null,
	cantidad int not null,
	imagen nvarchar(max) not null,
	descripcion nvarchar(100) not null,
)
------------------------------------------------------------------
create table tpo_Producto(
	id_tpoProd int not null,
	nombre nvarchar(100) not null,
	descripcion nvarchar(100) not null
)
------------------------------------------------------------------
------------------------------------------------------------------
--clave primaria
alter table Usuario add primary key clustered(nombre_usuario)
alter table tpo_usuario add  primary key clustered(id_usuario)
alter table factura add   primary key clustered(id_factura)
alter table LFactura add primary key clustered(id_lf)
alter table ModoDePago add primary key clustered(id_mp)
alter table tpo_Envio add primary key clustered(id_tpoEnvio)
alter table producto add primary key clustered(id_producto)
alter table tpo_Producto add primary key clustered(id_tpoProd)
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--clave foranea

------------------------------------------------------------------------------
alter table usuario
	add tpo_usuario nvarchar(50)
	constraint fkTPUUsuariocodigo
	foreign key(tpo_usuario)
	references tpo_usuario(id_usuario)
------------------------------------------------------------------------------
alter table factura
	add nombre_usuario nvarchar(50)
	constraint fkusuarioFacturacodigo
	foreign key(nombre_usuario)
	references Usuario(nombre_usuario)
------------------------------------------------------------------------------
alter table factura
	add modo_pago int
	constraint fkmpfacturacodigo
	foreign key(modo_pago)
	references ModoDePago(id_mp)
------------------------------------------------------------------------------
alter table factura
	add id_tpoenvio int
	constraint fkEnviofacturacodigo
	foreign key(id_tpoenvio)
	references tpo_Envio(id_tpoEnvio)
------------------------------------------------------------------------------
alter table LFactura
	add id_factura int
	constraint fkLFFACcodigo
	foreign key(id_factura)
	references factura(id_factura)
------------------------------------------------------------------------------
alter table LFactura
	add id_prod int
	constraint fkLFProdcodigo
	foreign key(id_prod)
	references producto(id_producto)
------------------------------------------------------------------------------
alter table producto
	add id_tpoProd int
	constraint fkTPProdcodigo
	foreign key(id_tpoProd)
	references tpo_Producto(id_tpoProd)
------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--cargas obligatorias
insert into tpo_usuario(id_usuario,descripcion) values('Administrador','Jefe')
insert into tpo_usuario(id_usuario,descripcion) values('Cliente','Usuario Comun')
insert into tpo_usuario(id_usuario,descripcion) values('Empleado','Usuario que puede vender productos en local')
------------------------------------------------------------------------------
insert into Usuario(nombre_usuario,nombre_apellido,DNI,email,contraseña,num_celular,direccion,sueldo,tpo_usuario) values('Sandokan21','Pablo Sandoval',43168585,'pablosandoval01@yahoo.com.ar','1234',3874092749,'España 1751',0.0,'Administrador')
-------------------------------------------------------------------------------
--insertar tipos de productos
insert into tpo_Producto(id_tpoProd,nombre,descripcion) values(1,'mesa','')
insert into tpo_Producto(id_tpoProd,nombre,descripcion) values(2,'bandejas','')
insert into tpo_Producto(id_tpoProd,nombre,descripcion) values(3,'cajas','')
insert into tpo_Producto(id_tpoProd,nombre,descripcion) values(4,'espejos','')
insert into tpo_Producto(id_tpoProd,nombre,descripcion) values(5,'ganchos','')

-------------------------------------------------------------------------------
--- insertar productos
insert into producto(id_producto,nombre,descripcion,precio,imagen,id_tpoProd,cantidad) values(1,'Mesa matera con Flores','Mesa de 50x50cm.Trabajo de Mosaiquismo realizado con azulejos',450,'MesaPequeñaFlores.jpg',1,50)
insert into producto(id_producto,nombre,descripcion,precio,imagen,id_tpoProd,cantidad) values(2,'Bandeja de Cafe','Bandeja de 22x30cm. Trabajo de Mosaiquismo realizado con venecitas',300,'BandejaCafe.jpg',2,50)
insert into producto(id_producto,nombre,descripcion,precio,imagen,id_tpoProd,cantidad) values(3,'Caja "LOVE"','Caja de madera con tapa de 15x20cm. Trabajo de Mosaiquismo realizado en venecitas',250,'Caja pequeña LOVE.jpg',3,50)
insert into producto(id_producto,nombre,descripcion,precio,imagen,id_tpoProd,cantidad) values(4,'Espejo con Notas musicales','Espejo de 50x60cm. Trabajo de Mosaiquismo realizado con venecitas,gemas y espejos',700,'Espejo con Notas musicales.jpg',4,50)
insert into producto(id_producto,nombre,descripcion,precio,imagen,id_tpoProd,cantidad) values(5,'Perchero con 3 ganchos','Perchero de 20x60cm. Trabajo de Mosaiquismo realizado con gemas y azulejos',450,'Gancho de bolsos con flores.jpg',5,50)
------------------------------------------
--insertar metodos de pago
insert into ModoDePago(id_mp,descripcion) values(1,'Pagar en Efectivo')
insert into ModoDePago(id_mp,descripcion) values(2,'Pagar en Credito')
insert into ModoDePago(id_mp,descripcion) values(3,'Pagar en Debito')
insert into ModoDePago(id_mp,descripcion) values(4,'Transferencias Bancarias')
-------------------------------
--insertar tipos de envio
insert into tpo_Envio(id_tpoEnvio,descripcion) values(1,'Envio a domicilio')
insert into tpo_Envio(id_tpoEnvio,descripcion) values(2,'Retirar pedido por el Local')

------------------------------------------
--procedure
CREATE PROCEDURE spGetProductList  
AS  
BEGIN  
SELECT nombre,descripcion,precio,imagen FROM producto 
END  
--------------------------------------------------------------
select * from Usuario