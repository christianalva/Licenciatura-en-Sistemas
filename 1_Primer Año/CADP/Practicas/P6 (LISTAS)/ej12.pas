program ej12;
const
    dimV=5;
type
    desarrolladora=record
        versionA:string;
        tamPantalla:real;
        cantRam:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:desarrolladora;
        sig:lista;
    end;
    
    versiones=record
        nombre:string;
        aux:integer;
    end;
    vector=array[1..dimV] of versiones;


procedure leerInfo(var l:lista);
var 
    d:integer;
    aux:lista;
    version:string;
begin 
    d:=1;
    l:=nil;
    version:='';
    while(version<>'zzz') do begin 
        new(aux);
        writeln;
        writeln('Dispocitivo: ', d);
        write('Ingrese la version de android del dispocitivo: ');
        readln(version);
        if(version<>'zzz') then begin 
            aux^.dato.versionA:=version;
            write('Ingrese tamanio de la pantalla: ');
            readln(aux^.dato.tamPantalla);
            write('Ingrese la cantidad de memoria Ram: ');
            readln(aux^.dato.cantRam);
            
            d:=d+1;
            aux^.sig:=l;
            l:=aux;
        end;
    end;
end;

//A)
procedure versionesDeAndroid(var v:vector; l:lista);
var 
    i, j:integer; 
begin 
    
    v[1].nombre:='KitKat';
    v[2].nombre:='Lollipop';
    v[3].nombre:='Marshmallow';
    v[4].nombre:='Nougat';
    v[5].nombre:='Oreo';
    
    for i:=1 to dimV do begin 
        v[i].aux:=0;
    end;
    while(l<>nil) do begin 
        for j:=1 to dimV do begin
            if(l^.dato.versionA=v[j].nombre) then
                v[j].aux:=v[j].aux+1;
        end;
        l:=l^.sig;
    end;
    
    writeln;
    writeln('Cantidad de dispocitivos para cada version de android: ');
    for i:=1 to dimV do begin 
        writeln('Version: ', v[i].nombre, ' cantidad de dispocitivos con esa version de android: ', v[i].aux)
    end
    
end;

//B
procedure gbY5Pulgadas(l:lista);
var
    cant:integer;
begin 
    cant:=0;
    
    while(l<>nil)do begin 
        if(l^.dato.cantRam>3) and (l^.dato.tamPantalla>=5) then 
            cant:=cant+1;
        l:=l^.sig;
    end;
    writeln;
    writeln('La cantidad de dispositivos con mas de 3GB de ram y pantallas de a lo sumo 5 pulgadas es de: ', cant);
end;

//C
procedure promPantalla(l:lista);
var
    totalPulgadas, promedio:real;
    cantDispocitivos:integer;
begin 
    totalPulgadas:=0;
    cantDispocitivos:=0;
    promedio:=0;
        
    while(l<>nil) do begin 
        totalPulgadas:=totalPulgadas+l^.dato.tamPantalla;
        cantDispocitivos:=cantDispocitivos+1;
        l:=l^.sig;
    end;
    promedio:=(totalPulgadas/cantDispocitivos);
    
    writeln;
    writeln('El tamanio promedio de las pantallas de todos los dispositivos es de: ', promedio:2:2);
    
end;

var 
    L:lista;
    v:vector;
begin 
    leerInfo(L);
    versionesDeAndroid(v,L);
    gbY5Pulgadas(L);
    promPantalla(L);
end.