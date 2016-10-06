
/*Roles*/
insert into marketplace.rol values (1,'Administrador');
insert into marketplace.rol values (2,'Cliente');
insert into marketplace.rol values (3,'Proveedor');
/*
Usuario root
*/
INSERT INTO `marketplace`.`usuario` (`ID_USUARIO`, `USUARIO`, `CONTRASENA`, `NOMBRE`,`EMPRESA`,`NUMERO_DOCUMENTO`,`TIPO_DOCUMENTO`,`DIRECCION`,`ROL`,`ESTADO`,`CORREO`,`TELEFONO`) VALUES ('1', 'root', 'root', null,null,null,null,null,1,null,null,null);

/*Ubicaciones*/
insert into marketplace.ubicacion values (2,'SantaMarta','Colombia');
insert into marketplace.ubicacion values (3,'Cali','Colombia');
insert into marketplace.ubicacion values (4,'Medellin','Colombia');
insert into marketplace.ubicacion values (5,'Barranquilla','Colombia');
insert into marketplace.ubicacion values (6,'Villavicencio','Colombia');
insert into marketplace.ubicacion values (7,'Bucaramanga','Colombia');
/**
/**
insert parque
*/
INSERT INTO marketplace.parque (`ID_PARQUE`,`PARQUE`,`ID_UBICACION`) VALUES (1,'Ocarros',6);
INSERT INTO marketplace.parque (`ID_PARQUE`,`PARQUE`,`ID_UBICACION`) VALUES (2,'ParqueChicamocha',7);
INSERT INTO marketplace.parque (`ID_PARQUE`,`PARQUE`,`ID_UBICACION`) VALUES (3,'Sierra_Nevada_Santa_Marta',2);
INSERT INTO marketplace.parque (`ID_PARQUE`,`PARQUE`,`ID_UBICACION`) VALUES (4,'CanioCristales',6);

/**
insert plan
*/
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (1,'PlanOcarros','2000000','Parque','2','1',7,NULL);
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (3,'Plan canio cristales','5000000','Plan Parque caÃ±o cristales','5','6',10,NULL);
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (5,'Plan1 Chicamocha','2000000','Plan parque del chicamocha','3','2',8,NULL);

insert into marketplace.rol values(1,'Administrador');
commit;
SELECT * FROM marketplace.hotel;
insert into marketplace.hotel values(1,'cra 72 # 2109','5','estelar');
commit;
SELECT * FROM marketplace.usuario;
update  marketplace.usuario u set u.contrasena ='cris' where u.id_usuario = 1;
insert into marketplace.usuario values(1,'cris','cris','1');
commit;