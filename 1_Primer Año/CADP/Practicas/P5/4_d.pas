//4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de  escritorio.
//d)


program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
    
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun);
    pun^:= 'Otro texto';
end;

var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);//un texto 
    cambiarTexto(pc);
    writeln(pc^);// un texto
end.



