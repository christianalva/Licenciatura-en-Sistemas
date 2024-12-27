//4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de  escritorio.
//c)


program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena);
begin
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);// un texto
    cambiarTexto(pc);
    writeln(pc^);//otro texto
end.


