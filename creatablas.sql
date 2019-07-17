drop table ventas;
drop table proyecto;
drop table pieza;
drop table proveedor;

create table proveedor(
codpro char(3) constraint codpro_no_nulo not null
constraint codpro_clave_primaria primary key,
nompro varchar2(30) constraint nompro_no_nulo not null,
status number constraint status_entre_1_y_10 check(status>=1 and status<=10),
ciudad varchar2(15));

create table pieza (
codpie char(3) constraint codpie_clave_primaria primary key,
nompie varchar2(10) constraint nompie_no_nulo not null,
color varchar2(10),
peso number(5,2) constraint peso_entre_0_y_100 check(peso>0 and peso<=100),
ciudad varchar2(15));

create table proyecto(
codpj char(3) constraint codpj_clave_primaria primary key,
nompj varchar2(20) constraint nompj_no_nulo not null,
ciudad varchar2(15));

create table ventas (
codpro constraint codpro_clave_externa_proveedor references proveedor(codpro),
codpie constraint codpie_clave_externa_pieza references pieza(codpie),
codpj constraint codpj_clave_externa_proyecto references proyecto(codpj),
cantidad number(4),
constraint clave_primaria primary key (codpro,codpie,codpj));