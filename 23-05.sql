/* Ejercicio 3.26 */
select count(*) from ventas where cantidad > 1000;

/* Ejercicio 3.28 */
select p1.codpie from pieza p1 where p1.peso = (select max(peso) from pieza);

/* Ejercicio 3.30 */
select distinct V1.codpro from ventas V1 where (select count(*) from ventas V2 where v1.codpro=v2.codpro)>=3;

/* Ejercicio 3.28 con GROUP BY*/
select codpie,MAX(peso) from pieza group by codpie;

/* Ejemplo 3.30 */
select codpro,count(*),max(cantidad) from ventas group by (codpro);

/* Ejercicio 3.31 */
select pieza.nompie,pieza.codpie,avg(cantidad) from ventas,pieza where pieza.codpie=ventas.codpie group by (pieza.nompie,pieza.codpie);

/* Ejercicio 3.32 */
select avg(cantidad) from ventas where codpie='P1' group by (codpro);

/* Ejercicio 3.33 */
select codpie,codpj,sum(cantidad) from ventas group by (codpj,codpie);

/* Ejemplo 3.21 */
select codpro,avg(cantidad) from ventas group by (codpro) having count(*)>3;

/* Ejemplo 3.22  En guion esta mal*/
select codpro,avg(cantidad) from ventas where codpie='P1' group by (codpro) having count(codpro)>=2 and count(codpro)<=10;

/* Ejercicio 3.35 */
select proveedor.nompro from proveedor,ventas where proveedor.codpro=ventas.codpro group by (proveedor.nompro) having sum(cantidad)>1000;

/* Ejemplo 3.24 */
select codpro, sum(cantidad) from ventas group by codpro having sum(cantidad) = (select max(sum(v1.cantidad)) from ventas v1 group by v1.codpro);

/* Ejercicio 3.45 */
select codpro from ventas group by codpro having count(*)>=10;

/* Ejemplo 3.25 */
select to_char(fecha,'DD-MM-YYYY') from ventas;

/* Ejemplo 3.26 */
select * from ventas where fecha between to_date('01/01/2002','DD/MM/YYYY') and to_date('31/12/2004','DD/MM/YYYY');

/* */
select codpro,codpie,cantidad,to_char(fecha,'"Dia" day/dd/mm/yy') from ventas;

/* Ejemplo 3.27 en AR */
(select distinct codpie from ventas) 
minus 
(select codpie from ventas where to_char(fecha,'yyyy')>'2001');

/* Ejemplo 3.27 en CR */
select p.codpie from pieza p where not exists (select * from ventas v where to_char(fecha,'yyyy')>'2001' and v.codpie=p.codpie);

/* Ejemplo 3.28 */
select to_char(fecha,'yyyy'),sum(cantidad) from ventas group by to_char(fecha,'yyyy');

/* Ejemplo 3.29 */ 
select * from all_users;

describe all_users;

describe dictionary;

select * from dictionary where table_name like '%INDEX%';

/* Ejercicio 3.39
user_indexes*/

/* Ejercicio 3.25 en CR */
select codpro from proveedor where not exists
((select ciudad from proyecto where not exists
(select * from ventas,pieza where proveedor.codpro = ventas.codpro and ventas.codpie=pieza.codpie and proyecto.CIUDAD = pieza.CIUDAD)))