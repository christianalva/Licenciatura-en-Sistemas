program ej13;
const
    cantUsuarios=4;//3600
type
    
    usuarios=record
        email:string;
        rol:string;
        revista:string;
        cantDias:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:usuarios;
        sig:lista;
    end;


procedure leerDatos(var l:lista);
var     
    aux:lista;
    d, i:integer;
begin 
    d:=1;
    l:=nil;
    
    for i:=1 to cantUsuarios do begin 
        new(aux);
        writeln;
        writeln('Usuario: ', d);
        write('Ingrese su correo electronico: ');
        readln(aux^.dato.email);
        write('Ingrese su rol: ');
        readln(aux^.dato.rol);
        write('Ingrese la revista de la que participa: ');
        readln(aux^.dato.revista);
        write('Ingrese la canidad de dias desde el ultimo acceso: ');
        readln(aux^.dato.cantDias);
        
        
        d:=d+1;
        aux^.sig:=l;
        l:=aux;
    end;
end;




var 
    L:lista;
begin
    
    leerDatos(L);

end.
