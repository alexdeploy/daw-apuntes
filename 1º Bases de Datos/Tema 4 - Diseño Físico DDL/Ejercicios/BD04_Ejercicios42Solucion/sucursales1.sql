-- 
-- Claves Ajenas articulos
-- 
ALTER TABLE articulos
  ADD CONSTRAINT art_idg_fk FOREIGN KEY (id_gru) REFERENCES grupos (id_gru) ON DELETE CASCADE; 
--en MySQL añadir ON UPDATE CASCADE;
  
-- 
-- Claves Ajenas facturas
-- Oracle:
ALTER TABLE facturas
  ADD CONSTRAINT fac_idv_fk FOREIGN KEY (id_ven) REFERENCES vendedores (id_ven) ON DELETE CASCADE;
ALTER TABLE facturas
  ADD CONSTRAINT fac_idc_fk FOREIGN KEY (id_cli) REFERENCES clientes (id_cli) ON DELETE CASCADE;

  --MySQL: 
ALTER TABLE facturas
  ADD CONSTRAINT fac_idv_fk FOREIGN KEY (id_ven) REFERENCES vendedores (id_ven) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fac_idc_fk FOREIGN KEY (id_cli) REFERENCES clientes (id_cli) ON DELETE CASCADE ON UPDATE CASCADE;

-- 
-- Claves Ajenas lineas_factura
-- MySQL:
ALTER TABLE lineas_factura
  ADD CONSTRAINT linf_ids_fk FOREIGN KEY (id_suc) REFERENCES sucursales (id_suc) ON UPDATE CASCADE,
  ADD CONSTRAINT linf_idf_fk FOREIGN KEY (id_fac) REFERENCES facturas (id_fac) ON UPDATE CASCADE,
  ADD CONSTRAINT linf_ida_fk FOREIGN KEY (id_art) REFERENCES articulos (id_art);

--Oracle:

ALTER TABLE lineas_factura
  ADD CONSTRAINT linf_ids_fk FOREIGN KEY (id_suc) REFERENCES sucursales (id_suc);
ALTER TABLE lineas_factura
  ADD CONSTRAINT linf_idf_fk FOREIGN KEY (id_fac) REFERENCES facturas (id_fac);
ALTER TABLE lineas_factura
  ADD CONSTRAINT linf_ida_fk FOREIGN KEY (id_art) REFERENCES articulos (id_art);