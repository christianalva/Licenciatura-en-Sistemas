program ProgramaNumAleatorio;

var 
  ale, i, a, b, f: integer;
begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     
     write('Ingrese el valor de A: ');
     readln(a);
     write('Ingrese el valor de B: ');
     readln(b);
     
     write('Ingrese el valor de F: ');
     readln(f);
    
     ale :=  a + random(b - a + 1); // numero entre a y b
     i:=1;
     
     while (ale <> f) do begin
      ale :=  a + random(b - a + 1); // numero entre a y b
      if (ale <> f) then 
        writeln (i, '- El numero aleatorio generado es: ', ale);
      i:= i+1;
     end;

end.