/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  cristian
 * Created: 4/10/2016
 */
alter table marketplace.usuario add column ESTADO varchar(1);
alter table marketplace.usuario modify column TELEFONO varchar(10);

/** se agrega campo imagen a archivo*/
alter table marketplace.archivo add column IMG LONGBLOB;

/** se quita campo ruta*/
alter table marketplace.archivo drop column ruta;
