/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv'
    AS (
            column1:CHARARRAY,
            column2:BAG{},
            column3:MAP[]
    );

flatten_data = FOREACH data GENERATE FLATTEN(column2), FLATTEN(column3);
tuplas = FOREACH flatten_data GENERATE ($0,$1) AS tupla;

grouped= GROUP tuplas BY tupla;
counter = FOREACH grouped GENERATE group, COUNT(tuplas);

STORE counter INTO 'output/' using PigStorage(',');
