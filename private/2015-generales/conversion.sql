BEGIN;

/* script SQL para convertir datos publicos de las PASO a Generales para las Elecciones Nacionales 2015 */

/* corregir partidos políticos sin nombre (listas oficializadas) */

UPDATE listas SET descripcion = partidos.descripcion FROM partidos WHERE partidos.id_partido=listas.id_partido AND TRIM(listas.descripcion)='';
UPDATE listas SET descripcion_corta = SUBSTR(partidos.descripcion, 1, 25) FROM partidos WHERE partidos.id_partido=listas.id_partido AND TRIM(listas.descripcion)='';

/* backup de las cargos/listas/ubicaciones */

CREATE TABLE carg_list_ubic_orig AS SELECT * FROM carg_list_ubic;

/* habilitar listas consolidadas por partido */
CREATE TABLE carg_list_ubic_nuev AS 
	SELECT DISTINCT clu.id_ubicacion, clu.id_cargo, l.id_partido AS id_lista 
	FROM carg_list_ubic clu INNER JOIN listas l ON clu.id_lista=l.id_lista;

/* (FALTA: calcular piso electoral de 1.5% votos por distrito) */

/* limpieza de votos y cargos/listas/ubicaciones de las PASO */

DELETE FROM planillas_det;
DELETE FROM carg_list_ubic;

/* regenerar cargos/listas/ubicaciones y detalle de planillas */

ALTER SEQUENCE carg_list_ubic_id_seq RESTART 1;
INSERT INTO carg_list_ubic (id_ubicacion, id_cargo, id_lista) SELECT * FROM carg_list_ubic_nuev;

ALTER SEQUENCE planillas_det_id_seq RESTART 1;
INSERT INTO planillas_det (id_planilla, id_cargo, id_lista)
  SELECT P.id_planilla, PD.id_cargo, PD.id_lista  
    FROM planillas P 
         INNER JOIN carg_list_ubic PD ON P.id_ubicacion = PD.id_ubicacion;

/* limpiar listas internas de los partidos politicos en las PASO */

DELETE FROM listas WHERE id_partido != id_lista and id_partido IS NOT NULL;

COMMIT;
