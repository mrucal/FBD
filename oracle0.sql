
select TABLE_NAME FROM USER_TABLES; 

insert into plantilla (dni,nombre,estadocivil,fechaalta) values ('12345678','Pepe','soltero',sysdate);

insert into plantilla (dni,nombre,estadocivil,fechaalta) values ('87654321','Juan','casado',SYSDATE);

insert into plantilla (dni,nombre,estadocivil,fechaalta) values ('23456789','Jose','viudo',sysdate);

select * from plantilla;

insert into serjefe values ('01234567','12345678');

insert into serjefe values ('87654321','12345678');

insert into serjefe values('87654321','23456789');

insert into serjefe values('87654321','87654321');

insert into serjefe values('23456789','12345678');

select * from serjefe;

insert into plantilla(dni,fechaalta) values ('11223344',SYSDATE);

select dni,nombre from plantilla;

update plantilla set estadocivil='divorciado' where nombre='Juan';

select * from plantilla;

update plantilla set nombre='Luis' where dni='12345678';

select fechaalta from plantilla;

select to_char(fechaalta,'dd-mm-yy') from plantilla;

select to_char(fechaalta,'day-dd-mm-yyyy') from plantilla;

delete from plantilla where dni='11223344';

delete from serjefe;

select * from proveedor;

insert into proveedor values('S1','Jose Fernandez',2,'Madrid');

insert into proveedor values('S2','Manuel Vidal',1,'Londres');

insert into proveedor values('S3','Luisa Gomez',3,'Lisboa');

insert into proveedor values('S4','Pedro Sanchez',4,'Paris');

insert into proveedor values('S5','Maria Reyes',5,'Roma');

select * from pieza;

insert into pieza values('P1','Tuerca','Gris','2,5','Madrid');

insert into pieza values('P2','Tornillo','Rojo','1.25','Paris');

insert into pieza values('P3','Arandela','Blanco',3,'Londres');

insert into pieza values('P4','Clavo','Gris','5,5','Lisboa');

insert into pieza values('P5','Alcayata','Blanco',10,'Roma');

select * from proyecto;

insert into proyecto values('J1','Proyecto 1','Londres');

insert into proyecto values('J2','Proyecto 2','Londres');

insert into proyecto values('J3','Proyecto 3','Paris');

insert into proyecto values('J4','Proyecto 4','Roma');

select * from ventas;

alter table ventas add(fecha date);

insert into ventas select * from opc.ventas;

select * from opc.ventas;

describe ventas;

commit;