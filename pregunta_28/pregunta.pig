/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

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
            birth_date:chararray,
            colour:chararray,
            children:int
    );

year_tbl = FOREACH data GENERATE SUBSTRING(birth_date,0,4) AS long, SUBSTRING(birth_date,2,4) AS short;

STORE year_tbl INTO 'output/' using PigStorage(',');
