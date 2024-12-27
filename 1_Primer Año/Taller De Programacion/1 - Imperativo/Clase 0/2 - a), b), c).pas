program ProgramaNumAleatorio;
const 
  dF = 50;

type 
  Vector = array[1..dF] of integer;
  
procedure cargarVector(var v:Vector; var dL:integer; a, b:integer);
var 
  i, ale:integer;
begin 
  
  for i:=1 to dF do begin
    ale :=  a + random(b - a + 1); // numero entre a y b
    
    if (ale <> 0) then 
      v[i]:=ale
    else 
      break;
    dL:=dL+1;  
      
  end;

end;

procedure imprimirNormal(v:Vector; dL:integer);
var 
  i:integer;
begin
  
  for i:=1 to dL do begin 
    writeln (i, '- El numero aleatorio generado es: ', v[i])
  end;

end;

procedure imprimirInverso(v:Vector; dL:integer);
var 
  i:integer;
begin
  
  for i:=dL downto 1 do begin 
    writeln (i, '- El numero aleatorio generado es: ', v[i])
  end;

end;

  
  

var 
  a, b, dL :integer;
  v:Vector;
begin
     randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
     dL:=0;
     
     
     write('Ingrese el valor de MIN: ');
     readln(a);
     write('Ingrese el valor de MAX: ');
     readln(b);
     
     cargarVector(v, dL, a, b);
     imprimirNormal(v, dL);
     writeln();
     imprimirInverso(v, dL);
     
    
end.