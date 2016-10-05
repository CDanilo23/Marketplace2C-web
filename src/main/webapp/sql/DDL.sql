/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  pc
 * Created: 4/10/2016
 */
alter table marketplace.usuario add column ESTADO char(2);
alter table marketplace.usuario modify column telefono varchar(10);
