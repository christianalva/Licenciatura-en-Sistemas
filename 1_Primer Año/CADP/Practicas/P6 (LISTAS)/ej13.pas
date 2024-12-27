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
    
    cantUsuariosxRol=record
        roles:string;
        aux:integer;
    end;
    
    vector=array[1..4] of cantUsuariosxRol;

procedure imprimir(l:lista);
begin 
    while(l<>nil) do begin
        writeln;
        writeln('Correo electronico: ', l^.dato.email);
        writeln('Rol: ', l^.dato.rol);
        writeln('Revista de la que participa: ', l^.dato.revista);
        writeln('Dias desde el ultimo acceso: ', l^.dato.cantDias);
        l:=l^.sig;
    end;
end;

procedure leerDatos(var l:lista);
var     
    aux:lista;
    d:integer;
begin 
    d:=1;
    l:=nil;
    
    while(d<cantUsuarios) do begin
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

//A)
procedure ordenarAcendente(l:lista);
var 
    act, ant, nuevoNodo, listaOrdenada:lista;
    
begin
    act:=l;
    ant:=nil;
    nuevoNodo:=nil;
    listaOrdenada:=nil;
    
    while(act<>nil) do begin 
        nuevoNodo:=act^.sig;
        act^.sig:=listaOrdenada;
        if(listaOrdenada=nil) or (act^.dato.cantDias < listaOrdenada^.dato.cantDias) then begin 
            listaOrdenada:=act
        end
        else begin 
            ant:=listaOrdenada;
            while(ant^.sig<>nil) and (act^.dato.cantDias > ant^.sig^.dato.cantDias) do begin 
                ant:=ant^.sig;
            end;
            act^.sig:=ant^.sig;
            ant^.sig:=act;
        end;
        act:=nuevoNodo;
    end;
    l:=listaOrdenada;
    writeln;
    writeln('Listado en orden ascendente (por cant de dias desde ultimo acceso): ');
    imprimir(l);
end;

//B)
procedure Roles(l:lista; var v:vector);
var 
    i:integer;
begin   
    
    v[1].roles:='Editor';
    v[2].roles:='Autor';
    v[3].roles:='Revisor';
    v[4].roles:='Lector';
    
    for i:=1 to 4 do begin 
        v[i].aux:=0;
    end;
    
    while(l<>nil) do begin 
        for i:=1 to 4 do begin
            if(l^.dato.rol=v[i].roles) then 
                v[i].aux:=v[i].aux+1;
        end;
        l:=l^.sig;    
    end;
    
    writeln;
    writeln('Cantidad de usuartios por cada rol: ');
    for i:=1 to 4 do begin 
        writeln('El rol de: ', v[i].roles, ' posee: ', v[i].aux, ' usuarios.');
    end;
end;


procedure email(l:lista);
var
    max, max2:integer;
    email1, email2:string;
begin
    max:=0;
    max2:=0;
    email1:='';
    email2:='';
    
    while(l<>nil) do begin 
        if(l^.dato.cantDias > max) then begin
            max2:=max;
            email2:=email1;
            max:=l^.dato.cantDias;
            email1:=l^.dato.email
        end
        else if(l^.dato.cantDias > max2) then begin 
            max2:=l^.dato.cantDias;
            email2:=l^.dato.email;
        end;
        
        l:=l^.sig;
    end;
    
    writeln;
    writeln('Los emails de los dos usuarios que hace mas tiempo que no ingresan al portal son: ');
    writeln('1_ ', email1);
    writeln('2_ ', email2);
    
end;


var 
    L:lista;
    v:vector;
begin
    
    leerDatos(L);
    ordenarAcendente(L);
    Roles(L, v);
    email(L);
end.