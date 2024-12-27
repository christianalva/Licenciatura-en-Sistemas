program ejercicio2;
type
    
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    lista = ^nodo;
    nodo = record
        dato: persona;
        sig: lista;
    end;
    
procedure leerPersona(var p: persona);
begin
    write('Introduzca el dni: ');
    readln(p.dni);
    if (p.dni <> 0)then begin
        write('Introduzca el nombre: ');
        readln(p.nombre);
        write('Introduzca el apellido: ');
        readln(p.apellido);
    end;
end;


{Agrega un nodo a la lista}
procedure agregarAdelante(var l:lista; p:persona);//l necesita ser pasado por referencia porque el puntero se va moviendo
var
    aux: lista;
begin
    new(aux); //CREO EL NODO, AUX ME VA A GUARDAR LA DIRECCION DE MEMORIA EN DONDE SE ALOJA UN NODO EN MEMORIA DINAMICA
    aux^.dato:= p;// cargo el dato
    aux^.sig:= l;//realizo el enlace
    l:= aux;//actualizo el primero 
end;


{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:persona;
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
        leerPersona(p);
    end;
end;


procedure imprimirInformacion(var l:lista);
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, ', Nombre: ',l^.dato.nombre, ', Apellido: ', l^.dato.apellido);
        l:= l^.sig;//
    end;
end;


{Programa principal}
var
    l:lista;
begin
    l:=nil;//necesito siempre inicializar la lista en nill
    generarLista(l);    
    imprimirInformacion(l);
end.