//4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de  escritorio.
//a)
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo texto';
    writeln(pc^);// Imprime un nuevo texto
end.



