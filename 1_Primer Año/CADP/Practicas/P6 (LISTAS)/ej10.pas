program ej10;
type
    
    
    clientes=record
        dni:integer;
        num:integer;
    end;
    lista=^nodo;    
    nodo=record
        dato:clientes;
        sig:lista;
    end;
    

procedure imprimir(l:lista);
begin 
    writeln;
    while(l<>nil)do begin
        writeln;
        writeln('DNI: ', l^.dato.dni);
        writeln('Turno: ', l^.dato.num);
        l:=l^.sig;
    end;
end;


procedure RecibirCliente(var l:lista);
var
    n, numeros:integer;
    aux:lista;
begin 
    n:=1;
    numeros:=1000;
    l:=nil;
    
    writeln;
    new(aux);
    writeln('Cliente: ', n);
    write('Ingrese el DNI: ');
    readln(aux^.dato.dni);
    
    
    
    while(aux^.dato.dni<>0) do begin
        aux^.dato.num:=numeros;
        aux^.sig:=l;
        l:=aux;
        
        n:=n+1;
        numeros:=numeros+1;
        
        new(aux);
        writeln;
        writeln('Cliente: ', n);
        write('Ingrese el DNI: ');
        readln(aux^.dato.dni);
    end;
    writeln;
    writeln('La lista quedaria de la sigiente manera: ');
    imprimir(l);
end;


procedure AtenderCliente(l:lista);
var
    dni:integer;
    act, ant:lista;
    existe:boolean;
begin 
    existe:=false;
    act:=l;
    ant:=nil;
    
    
    writeln;
    writeln('Ingrese el DNi del cliente a atender: ');
    readln(dni);
    
    if(dni<>0) then begin 
        while(act<>nil) do begin 
            if(act^.dato.dni=dni) then begin
                if(ant = nil) then 
                    l:=act^.sig
                else
                    ant^.sig:=act^.sig;
                dispose(act);
                existe:=true;
            end
            else begin 
                ant:=act;
                act:=act^.sig;
            end;
        end;
        
        if(existe) then begin 
            writeln;
            writeln('La nueva lista de espera queda de la siginte manera: ');
            imprimir(l);
        end
        else
            writeln('El dni ingresado no existe.');
        
    end;
    
    
end;

    
var 
    L:lista;
begin 
    
    RecibirCliente(L);
    AtenderCliente(L);
end.