/* Ejercicio 3.20 */
select codpj from proyecto where ciudad in (select ciudad from pieza);

/* Ejercicio 3.21 */
select codpj from ventas where codpie not in (select pieza.codpie from ventas,pieza,proveedor 
where pieza.codpie=ventas.codpie and proveedor.codpro=ventas.codpro and proveedor.ciudad='Londres' and
pieza.color='Rojo');

/* Ejemplo 3.17 */
select codpie from pieza
where peso > any ( select peso from pieza where nompie='Tornillo');

/* Ejemplo 3.22 */
/*select codpie from pieza
where peso >*/
(select distinct codpro from ventas) minus 
(select distinct codpro from 
((select distinct ventas.codpro,pieza.codpie from ventas,pieza) minus 
(select distinct codpro,codpie from ventas)));

(select distinct codpro from proveedor where not exists 
( select distinct * from pieza where not exists 
( select distinct * from ventas where pieza.codpie=ventas.codpie and ventas.codpro=proveedor.codpro)));

/* Ejercicio 3.24 */
(select codpie from ventas) minus
(select codpie from (( select ventas.codpie,proyecto.codpj from ventas,proyecto where ciudad='Londres') 
minus (select codpie,codpj from ventas)));

(select pieza.codpie from pieza where not exists
(select proyecto.codpj from proyecto where ciudad='Londres' and not exists
(select ventas.codpie from ventas 
where pieza.codpie=ventas.codpie and proyecto.codpj=ventas.codpj)));