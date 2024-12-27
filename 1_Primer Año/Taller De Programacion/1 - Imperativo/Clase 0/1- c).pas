program ProgramaNumAleatorio;

var 
  ale, i: integer;
begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     
     
     for i:=0 to 20 do begin
      ale := random (100); {devuelve un valor aleatorio en el intervalo 0 a 99}
      writeln (i, '- El numero aleatorio generado es: ', ale);
     end;

	 writeln ('Presione cualquier tecla para finalizar');
     readln;
end.