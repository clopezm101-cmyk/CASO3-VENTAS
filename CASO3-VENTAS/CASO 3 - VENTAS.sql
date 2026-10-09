CREATE DATABASE ventas;
USE ventas;

Create Table estado(
clave_estado VARCHAR(5) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
cargoEnvio DECIMAL(10,2) NOT NULL
);

CREATE TABLE cliente(
num_cliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
estatus VARCHAR(25) NOT NULL,
clave_estado VARCHAR(5),
FOREIGN KEY (clave_estado) references estado(clave_estado)
);

CREATE TABLE orden(
num_orden INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE producto(
num_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
color VARCHAR(100),
precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE detalleOrden(
num_orden INT NOT NULL,
num_producto INT NOT NULL,
cantidad INT NOT NULL,
PRIMARY KEY (num_orden, num_producto),
FOREIGN KEY (num_orden) references orden(num_orden),
FOREIGN KEY (num_producto) references producto(num_producto)
);

CREATE TABLE cuenta_credito(
num_cuenta INT AUTO_INCREMENT PRIMARY KEY,
num_cliente INT NOT NULL,
saldo DECIMAL(10,2),
FOREIGN KEY (num_cliente) references cliente(num_cliente)
);

CREATE TABLE tipo_Movimiento(
clave_tipo VARCHAR(8) PRIMARY KEY,
descripcion VARCHAR(100)
);

CREATE TABLE movimiento(
num_movimiento INT AUTO_INCREMENT PRIMARY KEY,
num_cuenta INT NOT NULL,
importe DECIMAL(10,2),
clave_tipo VARCHAR(8) NOT NULL,
FOREIGN KEY (num_cuenta) references cuenta_credito(num_cuenta),
FOREIGN KEY (clave_tipo) references tipo_movimiento(clave_tipo)
);
