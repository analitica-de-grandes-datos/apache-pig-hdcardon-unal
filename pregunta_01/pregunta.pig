/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv' 
        AS (word:chararray, 
        date:chararray, 
        amount:int);

data_grouped = GROUP data BY word;
word_count = FOREACH data_grouped GENERATE group, COUNT(data);

STORE word_count INTO 'output/' using PigStorage(',');