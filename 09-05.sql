select * from pieza where peso>2;

select * from pieza where color LIKE '_ojo';

select codpro,nompro,ciudad FROM proveedor where ciudad like 'L%';

select cantidad/12,cantidad from ventas where(cantidad/12)>10;

select distinct ciudad from proveedor;

select ciudad from proveedor;

select codpro,nompro from proveedor where status is not null;

(select ciudad from proveedor where status>2) minus (select ciudad from pieza where codpie='P1');

/* Ejercicio 3.7 */
(select ciudad from proveedor where status>2) intersect (select ciudad from pieza where codpie<>'P1');

/* Ejercicio 3.8 */
(select distinct codpj from ventas where codpro ='S1')
MINUS
(select distinct codpj from ventas where codpro !='S1'); 

/**/
select codpro,codpie,codpj from proveedor,proyecto,pieza where
proveedor.ciudad=proyecto.ciudad and pieza.ciudad=proveedor.ciudad;

select ventas.codpro,ventas.codpie,ventas.codpj from proveedor,proyecto,pieza,ventas where
proveedor.ciudad=proyecto.ciudad and pieza.ciudad=proveedor.ciudad and ventas.codpro=proveedor.codpro and ventas.codpie=pieza.codpie and ventas.codpj=proyecto.codpj;

select proveedor.nompro,ventas.cantidad from proveedor,ventas 
where proveedor.codpro=ventas.codpro and ventas.cantidad>800;

select ventas.codpro,ventas.codpie,ventas.codpj from proveedor,ventas 
where proveedor.codpro=ventas.codpro and proveedor.ciudad like 'Madrid';

select distinct pieza.codpie,pieza.ciudad from proveedor,proyecto,ventas,pieza 
where ventas.codpj=proyecto.codpj and proveedor.ciudad=proyecto.ciudad;

/* PIEZAS CON MAXIMO PESO: TODOS - MENOS QUE ALGUIEN */

(select codpie from pieza) minus
(select p1.codpie from pieza p1,pieza p2 where p1.peso<p2.peso);

/* Proveedores que no son de la misma ciudad*/
select s1.nompro,s1.ciudad,s2.nompro,s2.ciudad from proveedor s1, proveedor s2 where s1.ciudad<>s2.ciudad;