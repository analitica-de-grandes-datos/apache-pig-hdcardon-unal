/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD './data.tsv'
    AS (
            column1:int,
            column2:chararray,
            column3:chararray
    );


characters = FOREACH data GENERATE REPLACE(column2,'[\\{\\}]','') AS character;

words = FOREACH characters GENERATE FLATTEN(TOKENIZE(character)) AS word;

grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);

STORE wordcount INTO 'output/' using PigStorage(',');