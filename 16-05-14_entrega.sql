(select distinct codpro from ventas) minus 
(select distinct codpro from 
((select distinct ventas.codpro,pieza.codpie from ventas,pieza) minus (select distinct codpro,codpie from ventas)));

(select distinct codpro from proveedor where not exists 
( select distinct * from pieza where not exists 
( select distinct * from ventas where pieza.codpie=ventas.codpie and ventas.codpro=proveedor.codpro)));

(select codpie from ventas) minus
(select codpie from (( select ventas.codpie,proyecto.codpj from ventas,proyecto where ciudad='Londres') 
minus (select codpie,codpj from ventas)));

(select pieza.codpie from pieza where not exists
(select proyecto.codpj from proyecto where ciudad='Londres' and not exists
(select ventas.codpie from ventas 
where pieza.codpie=ventas.codpie and proyecto.codpj=ventas.codpj)));

(select ventas.codpro from ventas,pieza where ventas.codpie=pieza.codpie) minus
(select codpro from 
((select ventas.codpro,proyecto.ciudad from ventas,pieza,proyecto where ventas.codpie=pieza.codpie) 
minus 
select ventas.codpro,pieza.ciudad from ventas,pieza where ventas.codpie=pieza.codpie));
/*
(select ventas.codpro from ventas,pieza where ventas.codpie=pieza.codpie and not exists
(select ventas.codpj,proyecto.ciudad from ventas,pieza,proyecto where ventas.codpie=pieza.codpie and not exists
(select ventas.codpro from ventas 
where proyecto.codpro=ventas.codpro and proyecto.codpj=ventas.codpj)));*/