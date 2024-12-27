program ej7;
Type
    Nombre = String[50];
    Puntero = ^Nombre;
    ArrPunteros = array[1..2500] of Puntero;
    
procedure recervarMemoria(var a:ArrPunteros);
var 
    i:integer;
begin 
    for i:=0 to 2500 do begin
        new(a[i]);// reservoel lugar en la memoria dinamica
    end;
end;
    
procedure leerCiudades(var a:ArrPunteros);
var 
    i:integer;
begin
    for i:=1 to 2500 do begin 
        write('Introduzca una ciudad a guardar en la posicion: ', i);
        readln(a[i]^);
    end;
end;
    
Var
    Punteros: ArrPunteros;
begin
    writeln(sizeof(Punteros));//b.1) tamanio de la variable punteros al comenzar el programa
    recervarMemoria(punteros);//b.2) modulo para reservar memoria estatica
    leerCiudades(punteros);//b.3) modulo para leer los nombres y almacenarlos en el puntero

end.