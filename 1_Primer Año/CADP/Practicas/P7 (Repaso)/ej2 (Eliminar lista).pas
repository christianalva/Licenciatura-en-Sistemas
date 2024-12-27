program ej2;
type
    
    clientes=record
        codCliente:integer;
        dni:integer;
        apellido:string;
        nombre:string;
        codPoliza:integer;
        montoBasico:real;
    end;
    lista=^nodo;
    nodo=record
        dato:clientes;
        sig:lista;
    end;
        
    poliza=record
        montoAd:real;
    end;
    vector=array[1..6] of poliza;
    
procedure imprimir(l:lista);
begin   
    while(l<>nil) do begin 
        writeln;
        writeln('Codigo de cliente: ', l^.dato.codCliente);
        writeln('DNI del cliente: ', l^.dato.dni);
        writeln('Apellido del cliente: ', l^.dato.apellido);
        writeln('Nombre del cliente: ', l^.dato.nombre);
        writeln('Codigo de poliza contratada (1..6): ', l^.dato.codPoliza);
        writeln('Monto basico que abona mensualmente: ', l^.dato.montoBasico:2:2);
        
        l:=l^.sig;
    end;
end;
    

procedure leerInfo(var l:lista);
var 
    aux:lista;
    cod:integer;
begin 
    l:=nil;
    cod:=0;
    while(cod<>1122) do begin 
        new(aux);
        writeln;
        write('Ingrese el codigo de cliente: ');
        readln(cod);
        aux^.dato.codCliente:=cod;
        write('Ingrese el DNI del cliente: ');
        readln(aux^.dato.dni);
        write('Ingrese el apellido del cliente: ');
        readln(aux^.dato.apellido);
        write('Ingrese el nombre del cliente: ');
        readln(aux^.dato.nombre);
        write('Ingrese el codigo de poliza contratada (1..6): ');
        readln(aux^.dato.codPoliza);
        write('Ingrese el monto basico que abona mensualmente: ');
        readln(aux^.dato.montoBasico);
        
        aux^.sig:=l;
        l:=aux;
    end;

end;

//A
procedure informar(l:lista; var v:vector);
var 
    i:integer;
    montoTotal:real;
begin
    montoTotal:=0;
    
    
    v[1].montoAd:=30;
    v[2].montoAd:=10;
    v[3].montoAd:=40;
    v[4].montoAd:=60;
    v[5].montoAd:=20;
    v[6].montoAd:=90;
    
    
    while(l<>nil) do begin 
        writeln;
        writeln('El cliente de dni: ', l^.dato.dni);
        writeln('Apellido: ', l^.dato.apellido);
        writeln('Nombre: ', l^.dato.nombre);
        writeln('Paga un monto completo mensual de: ');
        for i:=1 to 6 do begin 
            if(l^.dato.codPoliza=i) then begin
                montoTotal:=(l^.dato.montoBasico+v[i].montoAd);
                writeln('$', montoTotal:2:2, ' pesos.');
            end;
        end;
        l:=l^.sig;
    end;
end;

procedure digitosNueve(l:lista);
var 
    num, cant:integer;
begin 
    num:=0; 
    cant:=0;
    
    while(l<>nil) do begin
        num:=l^.dato.dni;
        while(num<>0) do begin
            if((num mod 10)=9) then begin
                cant:=cant+1
            end;
            num:=num div 10;
        end;
        if(cant>=2) then begin
            writeln;
            writeln('El cliente de nombre: ', l^.dato.nombre, ' y apellido: ', l^.dato.apellido, ' posee al menos dos digitos 9 en su DNI');
        end;
        cant:=0;
        l:=l^.sig;
    end;
end;

procedure eliminarCliente(l:lista);
var     
    ant, act:lista;
    clienteE:integer;
begin 
    ant:=nil;
    act:=l;
    
    writeln;
    write('Ingrese el codigo de cliente a eliminar: ');
    readln(clienteE);
    while(act<>nil) do begin 
        if(act^.dato.codCliente=clienteE) then begin
            if(act=l) then begin          // si el nodo a eliminar es el primero, actualizo la cabeza de la lista 
                l:=l^.sig
            end
            else begin 
                ant^.sig:=act^.sig;      // Si el DNI a eliminar está en un nodo intermedio o al final, ajusta los punteros para omitir el nodo.
            end;
            dispose(act);
            act:=ant;
        end
        else begin 
            ant:=act;
            act:=act^.sig;
        end;
    end;
    
    imprimir(l);
    
end;



var 
    L:lista;
    v:vector;
begin 
    
    leerInfo(L);
    informar(L, v);
    digitosNueve(L);
    eliminarCliente(L);
end.