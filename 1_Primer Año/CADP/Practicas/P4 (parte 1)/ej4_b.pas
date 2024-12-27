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
procedure intercambio(var v:vector);
var
    x,y,i, aux:integer;
begin 
    aux:=0;
   
    write('Ingrese la primer posicion a intercambiar: ');
    readln(x);
    write('Ingrese la segunda posicion del vector a intercambiar: ');
    readln(y);
    
    repeat
        while (x<1) or (x>100) do begin 
            write('El valor de X esta fuera del rango, por favor ingrese otro: ');
            readln(x);
        end;
    
        while (y<1) or (y>100) do begin 
            write('El valor de Y esta fuera del rango, por favor ingrese otro: ');
            readln(y);
        end;
    until (x>=1) and (x<=100) and (y>=1) and (y<=100);
    
    //intercambio los valores, guardo el valor de x en aux para no perderlo
    aux:=v[x];
    v[x]:=v[y];
    v[y]:=aux;
    
    
end;
 

var 
    v:vector;
    i:integer;

begin 

    cargarVector(v);
    intercambio(v);
    
    for i:=1 to 100 do begin 
        writeln(v[i], ' Posicion [', i, ']');
    end
  

end.