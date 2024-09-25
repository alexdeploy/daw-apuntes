/*3.	Añade un campo 'observaciones'  sobre la  tabla  PICOS (decide tú el  tipo y tamaño del mismo).*/
ALTER TABLE picos ADD (observaciones VARCHAR(100));

/*4.	Modifica el campo código de la tabla asociacion para que pueda contener números hasta el 99999*/
alter table asociacion modify codigo varchar(5);


/*5.	Añade un campo 'foto' sobre la tabla ALPINISTAS (decide tú el tipo y tamaño del mismo).*/

ALTER TABLE alpinistas ADD (foto BLOB);

/*6.	Modifica la columna fecha_ingreso de la tabla 'alpinistas' para que por defecto tenga la fecha del sistema*/

alter table alpinistas modify fecha_ingreso default sysdate; --(sólo ORACLE)

-- En MySQL el tipo DATE no se puede actualizar automáticamente, sólo lo hace el tipo TIMESTAMP a CURRENT_TIMESTAMP. Por tanto,
-- si queremos especificar una fecha por defecto, cambiaremos primero el tipo del campo de DATE a TIMESTAMP. Si ahora hacéis un desc de alpinistas
-- veréis que al definir este nuevo tipo, ya incorpora por defecto la fecha del sistema.

alter table alpinistas modify fecha_ingreso timestamp;

/*7.	El valor del campo 'coordenadas' no debe repetirse nunca, a pesar de no ser clave primaria. 
Introduce la correspondiente restricción sobre PICOS.*/
alter table picos add unique (coordenadas);
--ALTER  TABLE  picos  ADD CONSTRAINT pic_coo_uk UNIQUE (coordenadas);



/*8.	Si se borra un ALPINISTA de la base de datos...¿...qué debería  hacerse con sus  correspondientes  entradas  
en la tabla TELEFONOS? Indica la sentencia DDL necesaria para aplicar esta restricción.
Se debe modificar  la  restricción  de  la  tabla  TELEFONOS  para  que  el borrado sea  ON DELETE 
CASCADE.*/

/*Primero borramos la clave ajena*/
ALTER TABLE telefonos DROP CONSTRAINT nif_telefono_fk;

/*Volvemos a crearla pero con la directiva de borrado*/
ALTER  TABLE  telefonos  ADD  CONSTRAINT  nif_telefono_fk  FOREIGN  KEY  (nif)  REFERENCES alpinistas(nif) ON DELETE CASCADE;

/*9. Y si se borra una ASOCIACIÓN de la base de datos?*/

ALTER TABLE alpinistas DROP CONSTRAINT codigo_asociacion_fk;
ALTER TABLE alpinistas ADD CONSTRAINT codigo_asociacion_fk FOREIGN KEY (codigo) REFERENCES asociaciones(codigo) ON DELETE SET NULL;

/*10. Desactivar la clave primaria de la tabla alpinistas*/
alter table alpinistas disable primary key;

/*Nos da error porque hay una clave ajena que depende de ella*/
alter table alpinistas disable primary key cascade;


/*11. Volver a activar la clave primaria desactivada en la pregunta anterior*/
alter table alpinistas enable primary key cascade;
--No permite activar en cascada--
--Activamos la clave primaria--
alter table alpinistas enable primary key;
--Activamos la cave ajena de telefonos--
alter table telefonos enable constraint NIF_TELEFONO_FK;




