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

//intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde se intercambiaron los valores de las posiciones x e y
procedure suma(var v:vector; var sumaTotal:integer);
var
    x:integer;
begin 
    for x:=1 to 100 do begin
        sumaTotal:=sumaTotal+v[x];
    end;
end;
 

var 
    v:vector;
    i, sumaTotal:integer;

begin 

    cargarVector(v);
    suma(v, sumaTotal);
    
    for i:=1 to 100 do begin 
        writeln(v[i], ' Posicion [', i, ']');
    end;
    writeln('La suma de todos esos elementos del vector es de: ', sumaTotal);

end.