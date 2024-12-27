//dada la siguiente declaracion y los procesos a y b indique para cada uno de ellos si elimina de forma correcta el primer elemento


type
  numeros = array[1..100] of ^real
  vector = record 
    elem:numeros;
    diml:integer;
  end;
  
  
procedure eliminar1()