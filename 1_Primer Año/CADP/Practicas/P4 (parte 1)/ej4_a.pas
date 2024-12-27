program ej4;
type

    vector=array[1..100] of integer;

procedure cargarVector(var v:vector);
var 
    i:integer;
begin 
    for i:=1 to 100 do begin 
        v[i]:=i;
    end;
end;

//posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
//o el valor -1 en caso de no encontrarse.
procedure buscarPosicion(var v:vector);
var 
    i, valor:integer;
begin 
    i:=1;
    write('Ingrese el valor a buscar dentro del vector');
    readln(valor);
    while(valor<>v[i]) and (i<=100) do begin 
        
        i:=i+1;
        
    end;
    
    if(valor<=100) then
        writeln('El la posicion dentro del vector del numero: ', valor, ' es la posicion: [', i, ']')
    else
        writeln('-1');

end;

var 
    v:vector;
    

begin 

    cargarVector(v);
    buscarPosicion(v);

end.