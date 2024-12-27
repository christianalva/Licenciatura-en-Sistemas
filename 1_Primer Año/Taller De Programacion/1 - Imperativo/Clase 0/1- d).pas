program ProgramaNumAleatorio;

var 
  ale, i, a, b, n: integer;
begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     write('Cuantos numeros desea imprimir: ');
     readln(n);
     
     write('Ingrese el valor de A: ');
     readln(a);
     write('Ingrese el valor de B: ');
     readln(b);
     
    
     for i:=0 to n do begin
      ale :=  a + random(b - a + 1); // numero entre a y b
      writeln (i, '- El numero aleatorio generado es: ', ale);
     end;

end.