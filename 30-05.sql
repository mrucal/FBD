/* Ejemplo 4.1 */
CREATE VIEW VentasParis AS
SELECT codpro,codpie,codpj,cantidad,fecha FROM ventas WHERE (codpro,codpie,codpj) IN
(SELECT codpro,codpie,codpj FROM proveedor,pieza,proyecto 
WHERE proveedor.ciudad='Paris' and pieza.ciudad='Paris' and proyecto.ciudad='Paris');

/* */
select * from all_views;

select * from ventasparis;
/* */

/* Ejemplo 4.2 */
CREATE VIEW PiezasLondres AS
SELECT codpie, nompie, color, peso FROM Pieza
WHERE pieza.ciudad='Londres';

insert into piezaslondres values('P9','Pieza 9','Rojo',90);
select * from pieza;
select * from piezaslondres;
update pieza set ciudad='Londres' where codpie='pq';

drop view piezaslondres;

/* Vista con los proveedores de Londres */
CREATE VIEW ProveedoresLondres AS
SELECT codpro, nompro, status, ciudad FROM Proveedor
WHERE proveedor.ciudad='Londres' ;

insert into proveedoreslondres values('S9','Jose Suarez',3,'Granada');

CREATE or replace VIEW ProveedoresLondres AS
SELECT codpro, nompro, status, ciudad FROM Proveedor
WHERE proveedor.ciudad='Londres' with check option;

insert into proveedoreslondres values('S8','Jose Suarez',3,'Granada');

select * from proveedor;
select * from proveedoresLondres;

CREATE or replace VIEW ProveedoresLondres AS
SELECT nompro, ciudad FROM Proveedor
WHERE proveedor.ciudad='Londres' with check option;

insert into proveedoreslondres values('Jose X Suarez','Granada');

CREATE VIEW vista AS
select p.codpro,p.nompro,pj.codpj from ventas v ,proveedor p ,pieza pi ,proyecto pj
where p.codpro=v.codpro and pi.codpie=v.codpie and pj.codpj=v.codpj and pi.color='Gris';

select * from vista;

insert into vista values ('S10','Jose Suarez','J10');

/* ---------------------------------- */

create index indice_proveedores on proveedor(nompro);

select * from user_indexes where index_name like 'INDICE_PROVEEDORES';

CREATE CLUSTER cluster_codpro(codpro char(3));

CREATE TABLE proveedor2(
codpro char(3) primary key,
nompro varchar2(30) not null,
status number check(status>=1 and status<=10),
ciudad varchar2(15))
CLUSTER cluster_codpro(codpro);

CREATE TABLE ventas2(
codpro char(3) references proveedor2(codpro),
codpie references pieza(codpie),
codpj references proyecto(codpj),
cantidad number(4),
fecha date,
primary key (codpro,codpie,codpj))
CLUSTER cluster_codpro(codpro);

create index indice_cluster on cluster cluster_codpro;

insert into proveedor2 select * from proveedor;
insert into ventas2 select * from ventas;
select * from ventas2;

select * from dictionary where table_name like '%CLUSTER%';
select * from user_clusters;

drop cluster cluster_codpro
including tables
cascade constraints;

drop index indice_cluster;