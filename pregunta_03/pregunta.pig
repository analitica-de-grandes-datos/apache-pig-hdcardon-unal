/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.tsv'
    AS (
            word:int,
            date:chararray,
            amount:int
    );

amount_ordered_data = ORDER data BY amount ASC;

amount_data = FOREACH amount_ordered_data GENERATE amount;
amount_limit_5 = LIMIT amount_data 5;

STORE amount_limit_5 INTO 'output/' using PigStorage(',');