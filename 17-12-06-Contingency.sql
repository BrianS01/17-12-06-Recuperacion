/* 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */

drop database if exists contingency;
create database contingency;
use contingency;

create table consultor
(
	idConsultor int,
    labor varchar(45),
    primary key(idConsultor)
);


create table trabajo
(
	idTrabajo int,
    trabajo varchar(45),
    primary key(idTrabajo)
);


create table empleado
(
	idEmpleado int,
    nombre varchar(45),
	salario int,
    idTrabajo int,
    primary key(idEmpleado),
    foreign key(idTrabajo) references trabajo(idTrabajo)
);


create table grupo
(
	idGrupo int,
    idLider int,
	idEmpleado int,
    primary key(idGrupo),
    foreign key(idLider) references empleado(idEmpleado),
    foreign key(idEmpleado) references empleado(idEmpleado)
);

select version();

insert into consultor(idConsultor,labor) values (23,'2016');

insert into trabajo(idTrabajo,trabajo) values (11,'Administrador');
insert into trabajo(idTrabajo,trabajo) values (22,'Programador');
insert into trabajo(idTrabajo,trabajo) values (33,'Programador Experto Java');