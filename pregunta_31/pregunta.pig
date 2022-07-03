/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.csv' USING PigStorage(',')
    AS (
            id:int,
            name:chararray,
            lastname:chararray,
            birth_date:datetime,
            colour:chararray,
            children:int
    );

date_tbl = FOREACH data GENERATE ToString(birth_date, 'yyyy') AS date;

date_grouped = GROUP date_tbl BY date;

persons_by_date = FOREACH date_grouped GENERATE group, COUNT(date_tbl);

STORE persons_by_date INTO 'output/' using PigStorage(',');