recuento_web2py
===============

Aplicación web para procesamiento de datos electorales

 * [DEMO Recuento 2007](http://www.web2py.com.ar/recuento2007)
 * [DEMO Recuento 2013 PASO](http://www.web2py.com.ar/recuento2013paso)
 * [DEMO Recuento 2015 PASO](http://www.web2py.com.ar/recuento2015paso) ***nuevo!***

Instalación:
------------

 1. Descargar y descomprimir el framework [web2py](http://www.web2py.com.ar/)
 2. Descargar esta aplicacion de [zip](https://github.com/reingart/recuento_web2py/archive/master.zip)
 3. Descomprimir el zip dentro de la carpeta applications de web2py
 3. Crear una base de datos postgresql
 4. Importar los datos (ver carpeta private)
 5. Probar!

Datos de prueba PASO 2015:
--------------------------

Se está trabajando en procesar los datos de las [P.A.S.O. 2015](http://www.resultados.gob.ar/)
-elección primarias para presidente, senadores, diputados nacionales y provinciales en las 24 provincias-, 
publicados por la [Dirección Nacional Electoral](http://elecciones.gob.ar/articulo_sub_sub.php?secc=2&sub_secc=9&sub_sub_secc=69)

Para más información ver carpeta private: 
 * [Info sobre el Dataset](private/2015-primarias/README.md)
 * [Script SQL de carga de datos públicos](private/2015-primarias/carga.sql) -para PostgreSQL-
 * [Script SQL de migración a la aplicación](private/2015-primarias/migracion.sql) -para PostgreSQL-

Datos de prueba PASO 2013:
--------------------------

Se procesaron los datos de las [P.A.S.O. 2013](http://www.resultados.gob.ar/)
-elección primarias para senadores y diputados nacionales en las 24 provincias-, 
publicados en el [Portal de Datos Públicos](http://www.datospublicos.gov.ar/)

Para más información ver carpeta private: 
 * [Info sobre el Dataset](private/2013-primarias/README.md)
 * [Script SQL de carga de datos públicos](private/2013-primarias/carga.sql) -para PostgreSQL-
 * [Script SQL de migración a la aplicación](private/2013-primarias/migracion.sql) -para PostgreSQL-

Datos de prueba 2007:
---------------------

En el [Hackaton Program.AR](http://datospublicos.gob.ar/hackatonprogramar/) 
se procesaron los set de datos electorales del futuro portal de 
[Datos Públicos](http://www.datospublicos.gov.ar/), en particular de la elección
nacional de 2007 (presidente, senadores y diputados).

Ver la carpeta private:
 * [electoral-2003-2011-completo.csv](private/2003-2011/electoral-2003-2011-completo.csv): set de datos completo utilizado
 * [migracion_elecciones_nacionales_2007.sql](private/2003-2011/migracion_elecciones_nacionales_2007.sql): script para procesamiento / normalización
 * [dump_recuento_2007.sql](private/2003-2011/dump_recuento_2007.sql): volcado de la base de datos ya procesada (PostgreSQL)

Sobre la aplicación:
--------------------

Esta aplicación esta basada en una demo desarrollada para un recuento definitivo provincial realizado en 2011.

Se generalizaron los esquemas de datos y consultas para que pueda ser utilizada para cualquier otro tipo de
escrutinio (nacional, provincial o municipal) y/o elecciones menores.

Se ha simplificado su estructura con fines educativos y experimentales, por lo que no contempla en principio
cuestiones de seguridad ni rendimiento.

Si bien contempla la funcionalidad de previsualización de telegramas, estos no están cargados y el nivel de
detalle de datos solo llega hasta provincia/departamento/circuito/mesa.

Para más información ver [ABOUT](ABOUT)
