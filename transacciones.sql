DROP DATABASE unidad2;

CREATE DATABASE unidad2;
\c unidad2;

--\echo :AUTOCOMMIT
--\set AUTOCOMMIT off

--1°
--psql -U alexis unidad2 < unidad2.sql

--2°
BEGIN TRANSACTION;
INSERT INTO compra (cliente_id,fecha,id) VALUES (1,'2021-07-28',42);
INSERT INTO detalle_compra (producto_id,compra_id,cantidad) VALUES (9,42,4);
UPDATE producto SET stock = stock - 5 WHERE id = 9;
ROLLBACK;
SELECT * FROM producto WHERE descripcion = 'producto9';

--3°
BEGIN TRANSACTION;
INSERT INTO compra(id, cliente_id, fecha) VALUES (43, 2,'2021-07-28');
INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES (1,43,3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES(2,43,3);
INSERT INTO detalle_compra(producto_id, compra_id, cantidad) VALUES(8,43,3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;
UPDATE producto SET stock = stock - 3 WHERE id = 2;
UPDATE producto SET stock = stock - 3 WHERE id = 8;
ROLLBACK;
SELECT * FROM producto WHERE descripcion = 'producto1' OR descripcion = 'producto2' OR descripcion = 'producto8';

--4°
\set AUTOCOMMIT off
BEGIN TRANSACTION;
INSERT INTO cliente(id, nombre, email) VALUES (11, 'usuario11', 'usuario11@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
SELECT * FROM cliente;
\set AUTOCOMMIT
