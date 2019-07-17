/* Ejercicio 3.42 */

select codpro,sum(cantidad) from ventas group by codpro having sum(cantidad) > ( select SUM(cantidad) from ventas where codpro='S1');

select codpro,sum(cantidad) from ventas group by codpro;

/* Ejercicio 3.43*/
select codpro,sum(cantidad) from ventas group by codpro having sum(cantidad) >= (select max(sum(cantidad)) from ventas group by codpro);

/* Ejercicio 3.46 */
select distinct proveedor.codpro from proveedor where not exists
(select pieza.codpie from pieza where not exists 
(select ventas.codpro from ventas where ventas.codpro='S1' and ventas.codpro=proveedor.codpro)); /*regular en CR*/

select distinct proveedor.codpro from proveedor where not exists
(select ventas.codpie from ventas where ventas.codpro='S1' and  not exists 
(select v.* from ventas v where   v.codpro=proveedor.codpro and v.codpie=ventas.codpie));/*bien en CR*/

(select v.codpro from ventas v) minus
select codpro from((
select v1.codpro, v2.codpie from ventas v1,ventas v2 where v2.codpro='S1') minus
(select v3.codpro, v3.codpie from ventas v3)); /* en AR*/

/* Ejercicio 3.58 */
update proveedor set status=1 where codpro=(
select v1.codpro from ventas v1 where v1.codpie='P1' and not exists ( select codpro from ventas where ventas.codpie<>'P1')); /* mal */


update proveedor set status=1 where codpro=(
(select v1.codpro from ventas v1) minus ( select codpro from ventas where ventas.codpie<>'P1')); /* bien en AR */

/* Ejercicio 3.53 */

(select distinct ventas.codpro from ventas,pieza where pieza.color='Rojo' and ventas.codpie=pieza.codpie);

/*Ejercicio 3.54 */
select ventas.codpro from ventas minus
select codpro from ((select ventas.codpro,pieza.codpie from ventas,pieza) minus 
(select v1.codpro,p1.codpie from ventas v1,pieza p1 where color='Rojo')); /* mio mal*/

(select codpro from proveedor) minus
select codpro from ( (select proveedor.codpro,pieza.codpie from proveedor,ventas,pieza where pieza.color='Rojo' and ventas.codpie=pieza.codpie) 
minus (select codpro,codpie from ventas)); /* bien */

/* Ejercicio 3.55 */
select codpro from proveedor minus (select codpro from ventas,pieza where color<>'Rojo' and ventas.codpie=pieza.codpie); /* bien */

select codpro from ventas,pieza where color='Rojo' and not exists (select codpro from ventas,pieza where color<>'Rojo'); /*mio creo que bien*/


/* Ejercicio 3.57 */
select ventas.codpro,ventas.codpie from ventas where ventas.codpro in ((select codpro from proveedor) minus
select codpro from ( (select proveedor.codpro,pieza.codpie from proveedor,ventas,pieza where pieza.color='Rojo' and ventas.codpie=pieza.codpie) 
minus (select codpro,codpie from ventas))) group by ventas.codpro,ventas.codpie having ventas.cantidad>10; /* mal */

(select codpro from ventas where cantidad>10) minus
select codpro from ( (select ventas.codpro,pieza.codpie from ventas,pieza where pieza.color='Rojo' and ventas.codpie=pieza.codpie and ventas.cantidad>10) 
minus (select codpro,codpie from ventas where cantidad>10));

