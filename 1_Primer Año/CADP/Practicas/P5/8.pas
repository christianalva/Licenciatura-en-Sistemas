//8) Analice el siguiente programa:
program memoria;
type
    datos = array [1..20] of integer;
    punt = ^datos;
procedure procesarDatos(v : datos; var v2 : datos);
var
    i, j : integer;
begin
    for i := 1 to 20 do
        v2[21 - i] := v[i];// 0 bytes
end;

var
    vect : datos;//40 bytes
    pvect : punt;//4 bytes
    i : integer;
begin // hasta esta linea el programa consume 44 bytes
    for i:= 1 to 20 do
        vect[i] := i;// en esta linea el programa sigue consumiedo 44 bytes
    
    new(pvect);
    // en esta linea el programa sigue consumiedo 44 bytes
    for i:= 20 downto 1 do
        pvect^[i] := 0;// en esta linea el programa sigue consumiedo 44 bytes
    
    procesarDatos(pvect^, vect);
    
    writeln('fin');
end.
