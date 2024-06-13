--Lenguaje SQL (DDL y DCL)

--DDL

--CREATE: Crea objetos de bd nuevos

CREATE TABLE empleados (
    id INT PRIMARY KEY,  -- Identificador único para cada empleado
    nombre VARCHAR(50) NOT NULL,        -- Nombre del empleado
    apellido VARCHAR(50) NOT NULL,      -- Apellido del empleado
    puesto VARCHAR(50) NOT NULL,        -- Puesto del empleado
    salario DECIMAL(10, 2) NOT NULL,    -- Salario del empleado
    fecha_contratacion DATE NOT NULL,   -- Fecha de contratación del empleado
    departamento VARCHAR(50) NOT NULL   -- Departamento al que pertenece el empleado

);


-- Insertar datos en la tabla empleados con el campo id especificado
INSERT INTO empleados (id, nombre, apellido, puesto, salario, fecha_contratacion, departamento) VALUES
(1, 'Alan', 'Pérez', 'Gerente', 5000.00, '2020-01-15', 'Administración'),
(2, 'María', 'Gómez', 'Asistente', 3000.00, '2021-05-20', 'Recursos Humanos'),
(3, 'Martha', 'Rodríguez', 'Desarrollador', 4500.00, '2019-11-01', 'TI'),
(4, 'Ana', 'Martínez', 'Analista', 4000.00, '2018-07-30', 'Finanzas'),
(5, 'Luis', 'Fernández', 'Soporte', 3500.00, '2022-03-10', 'TI'),
(6, 'Sofía', 'López', 'Diseñadora', 3800.00, '2021-09-15', 'Marketing'),
(7, 'Jorge', 'Hernández', 'Vendedor', 3200.00, '2019-12-05', 'Ventas'),
(8, 'Pedro', 'Ramírez', 'Consultora', 4200.00, '2020-06-25', 'Consultoría'),
(9, 'Andrés', 'Torres', 'Investigador', 4500.00, '2018-10-15', 'Investigación'),
(10, 'Elena', 'Flores', 'Administrativa', 3100.00, '2021-04-01', 'Administración');

select *from empleados

--ALTER:  Modifica la estructura de objetos de bd

ALTER TABLE empleados 
ADD Email VARCHAR(100);

--Actualizar los registros existentes con email (correos electrónicos)

UPDATE empleados SET Email = 'alan.perez@gmail.com' WHERE id = 1;

select *from empleados

--DROP: Elimina objetos de la bd

DROP TABLE empleados;


--TRUNCATE: Elimina todos los registros de una tabla de manera rápida y eficiente

TRUNCATE TABLE empleados;


--RENAME: Cambia el nombre de un objeto de la bd

EXEC sp_rename 'empleados', 'trabajador';
EXEC sp_rename 'trabajador', 'empleados';

select *from empleados

--DCL 

--GRANT: Otorga permisos a usuarios o roles.

-- Crear el usuario User1

CREATE LOGIN Usuario1 WITH PASSWORD = '54321';
CREATE USER Usuario1 FOR LOGIN Usuario1;


GRANT SELECT ON empleados TO Usuario1;

--REVOKE: Revoca permisos previamente otorgados.

REVOKE SELECT ON empleados FROM Usuario1;

--DENY: Niega permisos a usuarios o roles, teniendo prioridad sobre GRANT.

DENY SELECT ON empleados TO Usuario1;


--Lenguaje SQL (DML y SELECT)

--DML

--INSERT: Inserta nuevas filas en una tabla

--UDPATE: Aactualiza los datos existentes de una tabla


UPDATE empleados SET Email = 'alan123@gmail.com' WHERE id = 1;

--DELETE: Elimina filas de una tabla

DELETE FROM empleados WHERE id = 1;

select *from empleados

--SELECT

	---SELECT BÁSICO:
		--SELECT con condiciones (WHERE)
		--SELECT CON ALIAS DE COLUMNA
		--SELECT CON JOIN 
		-- SELECT CON FUNCIONES DE AGREGACIÓN
		--SELECT CON GROUP BY - ORDER BY
		--SELECT CON SUBCONSULTAS

--AGRUPACIONES Y JOINS


	--AGRUPACIONES (GROUP BY) 
		--COUNT
		--SUM
		--AVG
		--MAX
		--MIN

/* Calcular el total de salarios pagados en cada departamento*/

SELECT departamento, SUM(salario) AS total_salarios
FROM empleados
GROUP BY departamento;

/*Calcular el número de empleados en cada departamento*/

SELECT departamento, COUNT(*) AS numero_empleados
from empleados
GROUP BY departamento;

/*Calcular el salario promedio de los empleados en cada departamento*/

SELECT departamento, AVG(salario) AS salario_promedio
from empleados
GROUP BY departamento;



/*Calcular el salario más alto en cada departamento*/

SELECT departamento, MAX(salario) AS salario_MAX
from empleados
GROUP BY departamento;

/*Calcular el salario más bajo en cada departamento*/

SELECT departamento, MIN (salario) AS salario_MAX
from empleados
GROUP BY departamento;


/*Calcular el numero de empleados contratados por año*/

SELECT YEAR(fecha_contratacion) AS AÑO, COUNT(*) as TOTAL_EMPLEADOS
FROM empleados
group by YEAR(fecha_contratacion);

/*Calcular el Número de empleados por puesto */

SELECT puesto, COUNT(*) AS numero_empleados
from empleados
GROUP BY puesto;

--EJERCICIOS PRACTICA

/*Otener el salario promedio, mínimo y máximo por departamento*/

SELECT departamento, 
       AVG(salario) AS salario_promedio, 
       MIN(salario) AS salario_minimo, 
       MAX(salario) AS salario_maximo
FROM empleados
GROUP BY departamento;


/*Obtener el salario total y promedio de empleados contratados después de una 
fecha especificada (1 de enero de 2020) */


SELECT SUM(salario) AS salario_total,
	   AVG(salario) AS salario_promedio
FROM empleados
WHERE fecha_contratacion > '2020-01-01';

select *from empleados

--TAREA (Subir a GitHub)
/*1. Listar los departamentos donde el salario total es mayor a 8000*/



/*2. Obtener el nombre, apellido y salario del empleado con el salario más alto en cada departamento*/


/*3. Calcular el salario promedio por puesto dentro de cada departamento*/


/*4. Listar los empleados que tienen un salario superior al salario promedio de su departamento*/


/*5. Calcular la densidad de empleados(número de empleados) por departamento y el porcentaje que
representa cada departamento respecto al total de empleados*/


/*6. Asignar un ranking a los empleados basado en su salario dentro de cada departamento*/


/*7. Calcular la desviación estándar del salario por departamento.*/