
/*
Usuarios
*/
INSERT INTO `marketplace`.`usuario` (`ID_USUARIO`, `USUARIO`, `CONTRASENA`, `ROL`) VALUES ('1', 'cristian', 'cristian', '1');

/**
/**
insert parque
*/
INSERT INTO marketplace.parque (`id_parque`,`CIUDAD`,`PAIS`,`PARQUE`,`IMG`) VALUES (7,'Villavicencio','Colombia','Ocarros','ocarros.jpg');
INSERT INTO marketplace.parque (`id_parque`,`CIUDAD`,`PAIS`,`PARQUE`,`IMG`) VALUES (8,'Bucaramanga','Colombia','Parque del Chicamocha','Chicamocha.jpg');
INSERT INTO marketplace.parque (`id_parque`,`CIUDAD`,`PAIS`,`PARQUE`,`IMG`) VALUES (9,'Santa Marta','Colombia','Sierra Nevada de Santa Marta','SierraNevada.jpg');
INSERT INTO marketplace.parque (`id_parque`,`CIUDAD`,`PAIS`,`PARQUE`,`IMG`) VALUES (10,'Sierra','Colombia','Canio Cristales','Cristales.jpg');

/**
insert plan
*/
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (1,'PlanOcarros','2000000','Parque','2','1',7,NULL);
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (3,'Plan canio cristales','5000000','Plan Parque caÃ±o cristales','5','6',10,NULL);
INSERT INTO marketplace.plan (`ID_PLAN`,`NOMBRE_PLAN`,`COSTO`,`DESCRIPCION`,`DIAS`,`NOCHES`,`ID_PARQUE`,`ID_ARCHIVO`) VALUES (5,'Plan1 Chicamocha','2000000','Plan parque del chicamocha','3','2',8,NULL);

SELECT * FROM marketplace.rol;
insert into marketplace.rol values(1,'Administrador');
commit;
SELECT * FROM marketplace.hotel;
insert into marketplace.hotel values(1,'cra 72 # 2109','5','estelar');
commit;
SELECT * FROM marketplace.usuario;
update  marketplace.usuario u set u.contrasena ='cris' where u.id_usuario = 1;
insert into marketplace.usuario values(1,'cris','cris','1');
commit;