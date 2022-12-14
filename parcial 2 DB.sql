--Presentado por Edward Ovalle

--1.	?Cu?ntos empleados son?
SELECT COUNT(fk_Cc_PERSONA) AS 'Cantidad de empleados' from CONTRATACION


--2.	?Cu?ntos empleados por sede?
SELECT n_SEDE,COUNT(fk_Cc_PERSONA) AS 'Cantidad de empleados por sede' 
from CONTRATACION inner join SEDE
ON
CONTRATACION.fk_ID_SEDE = SEDE.id_SEDE
GROUP BY n_SEDE


--3.	?Cu?ntos empleados por estrato?
SELECT est.n_ESTRATO AS 'Estrato' ,COUNT(con.fk_Cc_PERSONA) AS 'Cantidad de empleados por sede' 
from CONTRATACION AS con inner join 
PERSONA as per
ON
con.fk_Cc_PERSONA = per.cc
inner join
ESTRATO as est
ON
est.id_Estrato = per.fk_ID_Estrato
GROUP BY  est.n_ESTRATO ORDER BY est.n_ESTRATO

 
--4.	?Cu?l es el empleado m?s nuevo?
SELECT per.nombres as 'Empleados m?s recientes' FROM CONTRATACION as cont
INNER JOIN
PERSONA as per
ON 
per.cc = cont.fk_Cc_PERSONA
where
cont.fk_FECHA_CONTRATACION=(SELECT fech.id_fechadate_CONTRATACION  as 'fecha mas reciente de contratacion' FROM 
CONTRATACION as contr
inner join 
FECHA_CONTRATACION as fech
ON
contr.fk_FECHA_CONTRATACION = fech.id_fechadate_CONTRATACION
where
fech.fechadate_CONTRATACION = (SELECT MAX(fech.fechadate_CONTRATACION) FROM FECHA_CONTRATACION as fech)
GROUP BY fech.id_fechadate_CONTRATACION)
GROUP BY per.nombres
 

--5.	?Cu?l es el empleado m?s antiguo?
SELECT DISTINCT(per.nombres) FROM
PERSONA as per
where per.cc=(
SELECT cont.fk_Cc_PERSONA FROM CONTRATACION as cont
where
cont.fk_FECHA_CONTRATACION=(SELECT fech.id_fechadate_CONTRATACION  as 'fecha mas antigua de contratacion' FROM 
CONTRATACION as contr
inner join 
FECHA_CONTRATACION as fech
ON
contr.fk_FECHA_CONTRATACION = fech.id_fechadate_CONTRATACION
where
fech.fechadate_CONTRATACION = (SELECT MIN(fech.fechadate_CONTRATACION) FROM FECHA_CONTRATACION as fech)
GROUP BY fech.id_fechadate_CONTRATACION)
GROUP BY cont.fk_Cc_PERSONA)

 
--6.	Consultar el nombre, sede y cargo del empleado con CC igual 10662101
SELECT DISTINCT(per.nombres), con.fk_Cc_PERSONA, sed.n_SEDE, car.n_CARGO  FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
INNER JOIN 
SEDE as sed
ON 
sed.id_SEDE = con.fk_ID_SEDE
INNER JOIN 
CARGO AS car
ON
car.ID_CARGO= con.fk_ID_CARGO
where
con.fk_Cc_PERSONA = 10662101


--7.	Un empleado fue despedido de la compa??a y por Habes Data autorizaron eliminar todos sus datos de la base de datos con CC Igual 
--10188530
 DELETE C FROM CONTRATACION C
 INNER JOIN
 PERSONA P
 ON
 C.fk_Cc_PERSONA = P.cc
 WHERE
 fk_Cc_PERSONA= 10188530

--8.	Consultar todos los empleados cuyo ingreso en la compa??a est?n entre los a?os 2000 y 2005
SELECT per.nombres as 'empleados que ingresaron entre el 2000 y el 2005' FROM 
CONTRATACION as con
inner join 
FECHA_CONTRATACION as fech
ON 
con.fk_FECHA_CONTRATACION = fech.id_fechadate_CONTRATACION
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
where
year(fech.fechadate_CONTRATACION) BETWEEN 2000 AND 2005
 

--9.	Obtener el nombre y edad de los empleados m?s j?venes y m?s antiguos y ordene el nombre de manera decreciente 
SELECT per.nombres, per.edad  as 'empleados del mas viejo al mas joven' FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
order by per.edad DESC
 

SELECT per.nombres , fech.fechadate_CONTRATACION as 'empleados del m?s antiguo al m?s viejo' FROM 
CONTRATACION as con
inner join 
FECHA_CONTRATACION as fech
ON 
con.fk_FECHA_CONTRATACION = fech.id_fechadate_CONTRATACION
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
order by fech.fechadate_CONTRATACION


--10.	Consultar todos los empleados que est?n entre 17 a?os y 25 a?os
SELECT per.nombres, per.[edad ] FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
where 
per.edad BETWEEN 17 AND 25
 

--11.	Queremos saber el promedio de edad de los empleados de la empresa
SELECT AVG(P.edad) AS 'EDAD PROMEDIO DE LOS EMPLEADOS'
FROM CONTRATACION C
INNER JOIN
PERSONA P
ON 
C.fk_Cc_PERSONA = P.cc


--12.	 necesitamos sumar todos los sueldos de los empleados
SELECT SUM(C.sueldo) AS 'SUELDO DE LOS EMPLEADOS'
FROM CONTRATACION C
INNER JOIN
PERSONA P
ON 
C.fk_Cc_PERSONA = P.cc
 

--13.	Queremos saber el nombre, sede, estrato, fecha de contrataci?n y el nombre del cargo del empleado que m?s gana en la empresa.  
SELECT per.nombres, per.primer_apellido, per.segundo_apellido, sed.n_SEDE,es.n_ESTRATO, 
car.n_CARGO FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
INNER JOIN 
SEDE as sed
ON 
sed.id_SEDE = con.fk_ID_SEDE
INNER JOIN 
CARGO AS car
ON
car.ID_CARGO= con.fk_ID_CARGO
INNER JOIN 
ESTRATO AS es
ON
per.fk_ID_Estrato = es.id_ESTRATO
where
con.fk_Cc_PERSONA=(select DISTINCT(con.fk_Cc_PERSONA) from CONTRATACION as con where
con.sueldo =(select MAX(con.sueldo) from CONTRATACION as con))
GROUP BY per.nombres, per.primer_apellido, per.segundo_apellido, sed.n_SEDE,es.n_ESTRATO, car.n_CARGO


--14.	 Queremos saber el nombre del m?dico m?s joven que haya en la sede SUR
SELECT TOP 1 per.cc, per.nombres, per.primer_apellido, per.segundo_apellido, MIN(per.edad) AS 'Edad del medio de la sede SUR 
m?s joven'  FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
WHERE
per.cc IN
(SELECT DISTINCT(per.cc) FROM 
CONTRATACION as con
INNER JOIN
PERSONA as per
ON 
per.cc = con.fk_Cc_PERSONA
INNER JOIN 
CARGO AS car
ON
car.ID_CARGO= con.fk_ID_CARGO
INNER JOIN 
SEDE as sed
ON 
sed.id_SEDE = con.fk_ID_SEDE
where
con.fk_ID_SEDE = (select sed.id_SEDE FROM SEDE as sed where sed.n_SEDE = 'SUR') AND
CON.fk_ID_CARGO = (select DISTINCT(car.id_CARGO) FROM CARGO as car where car.n_CARGO='MEDICO')
GROUP BY per.cc)GROUP BY per.cc,per.nombres,per.primer_apellido, per.segundo_apellido 
order by (MIN(per.edad))
 

--15.	 Genere una consulta que muestre:
select es.n_ESTRATO AS 'ESTRATO', count(DISTINCT(con.fk_Cc_PERSONA)) as 'EMPLEADOS' from ESTRATO as es
inner join 
PERSONA as per
ON
per.fk_ID_Estrato = es.id_ESTRATO
inner join 
CONTRATACION as con
ON 
per.cc = con.fk_Cc_PERSONA
group by es.n_ESTRATO 
 

--16.	Genere una consulta que muestre:
select sed.n_SEDE AS 'SEDE', count(DISTINCT(con.fk_Cc_PERSONA)) as 'EMPLEADOS' from 
CONTRATACION as con
INNER JOIN 
SEDE as sed
ON 
sed.id_SEDE = con.fk_ID_SEDE
group by sed.n_SEDE