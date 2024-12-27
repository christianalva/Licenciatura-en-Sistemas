//4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de  escritorio.
//b)

program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes');//51 bytes
    writeln(pc^);// imprime un nuevo nombre
    dispose(pc);
   
end.

