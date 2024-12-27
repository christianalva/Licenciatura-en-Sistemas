program ej11;
type
    egresados=record
        numAlum:integer;
        apellido:string;
        promedio:real
    end;
    lista=^nodo;
    nodo=record
        dato:egresados;
        sig:lista;
    end;
    

procedure imprimir(l:lista);
begin 
    while(l<>nil) do begin 
        writeln;
        writeln('Numero de alumno: ', l^.dato.numAlum);
        writeln('Apellido: ', l^.dato.apellido);
        writeln('Promedio: ', l^.dato.promedio);
        l:=l^.sig;
    end;
end;
    
procedure leerAlums(var l:lista);
var
    num, d:integer;
    aux:lista;
begin 
    l:=nil;
    num:=1;
    d:=1;
    
    while(num<>0) do begin 
        new(aux);
        writeln;
        writeln('Alumno ', d);
        write('Ingrese el numero de alumno: ');
        readln(num);
        if(num<>0) then begin
            aux^.dato.numAlum:=num;
            write('Ingrese el apellido: ');
            readln(aux^.dato.apellido);
            write('Ingrese el promedio: ');
            readln(aux^.dato.promedio);
            
            aux^.sig:=l;
            l:=aux;
            d:=d+1;
        end;
    end;
end;
    
//odeno la lista de manera desendente(mayor a menor, para tener los mas grnades al proncipio)
procedure ordenarLista(l:lista);
var 
    act, ant,nuevoNodo ,listaOrdenada:lista;
    cont:integer;
begin 
    cont:=0;
    act:=l;
    nuevoNodo:=nil;
    listaOrdenada:=nil;
    ant:=nil;   //lista vacia
    
    
    while(act<>nil) do begin
        nuevoNodo:=act^.sig;        //guardo el sigiente nodo de la lista
        act^.sig:=listaOrdenada;    //conecto al nodo actual con el comienzo de la lista ordenada
        
        if (listaOrdenada=nil) or (act^.dato.promedio > listaOrdenada^.dato.promedio) then begin 
            listaOrdenada:=act      //Esto asegura que los nodos con promedios más altos estén al principio de la lista ordenada.
        end
        else begin 
            ant:=listaOrdenada;
            
            while(ant^.sig<>nil) and (act^.dato.promedio < ant^.sig^.dato.promedio) do begin        //dentro de este while busco la posicion adecuada en la lista ordenada
                ant:=ant^.sig;
            end;
            
            act^.sig:=ant^.sig;
            ant^.sig:=act;
        end;
        act:=nuevoNodo;
    end;
    
    l:=listaOrdenada;
    writeln;
    writeln('Los alumnos que recibiran el galardon seran: ');
    repeat
        writeln('Numero de alumno: ', l^.dato.numAlum);
        writeln('Apellido: ',l^.dato.apellido);
        writeln('Promedio: ',l^.dato.promedio:0:2);
    
        cont:=cont+1;
        l:=l^.sig;
        writeln;
    until (cont=10) or (l=nil)
    
end;


var 
    L:lista;
begin 
    leerAlums(L);
    ordenarLista(L);
end.

