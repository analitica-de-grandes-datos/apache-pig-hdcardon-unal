/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

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

count = FOREACH data GENERATE column1, SIZE(column2) AS words, SIZE(column3) AS characters;
count_ordered = ORDER count BY column1,words,characters;

STORE count_ordered INTO 'output/' using PigStorage(',');