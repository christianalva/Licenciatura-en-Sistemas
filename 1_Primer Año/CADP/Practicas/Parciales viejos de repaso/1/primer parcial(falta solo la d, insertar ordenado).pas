program parcial;    
const
    dimF=2;
    dimV=5;
type
    infoSeciones=record
        titulo:string;
        artista:string;
        genero:integer;
        anioEstreno:integer;
        cantReproduciones:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:infoSeciones;
        sig:lista;
    end;
    
    generosMusicales=record
        codGenero:integer;
        cantSesiones:integer;
        cant:integer;
    end;
    vector=array[1..dimV] of generosMusicales;

procedure inicializarVector(var v:vector);
var
    i:integer;
begin 
    for i:=1 to dimV do begin 
        v[i].codGenero:=i;
        v[i].cantSesiones:=0;
        v[i].cant:=0;
    end;
end;

procedure leerDatos(var i:infoSeciones);
begin 
    writeln();
    write('Ingresar el titulo de la sesion: ');
    readln(i.titulo);
    write('Ingrese el nombre del artista: ');
    readln(i.artista);
    write('Ingrese el genero: ');
    readln(i.genero);
    write('Ingrese el anio de estreno: ');
    readln(i.anioEstreno);
    write('Ingrese la cantidad de reproduciones: ');
    readln(i.cantReproduciones);
end;


procedure insertarAdelante(var l:lista; i:infoSeciones);
var
    nuevo:lista;
begin 
    new(nuevo);
    nuevo^.dato:=i;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure cargarDatos(var l:lista; i:infoSeciones);
var
    z:integer;    
begin 
    l:=nil;
    for z:=1 to dimF do begin 
        leerDatos(i);
        insertarAdelante(l, i);
    end;
end;


procedure menorCantReproduciones(l:lista; var v:vector);
var
    min1, min2, i:integer;
    codMin1, codMin2:integer;
begin 
    min1:=9999;
    min2:=9999;
    codMin1:=0;
    codMin2:=0;
    
    while (l<>nil) do begin 
        
        for i:=1 to dimV do begin 
            if(l^.dato.genero=v[i].codGenero) then begin
                v[i].cantSesiones:=v[i].cantSesiones+1;
                v[i].cant:=v[i].cant+l^.dato.cantReproduciones;
            end;
        end;
        
        
        l:=l^.sig;
    end;
    
    for i:=1 to dimV do begin 
        if(v[i].cant<min1) then begin
            min2:=min1;
            codMin2:=codMin1;
            min1:=v[i].cant;
            codMin1:=v[i].codGenero;
        end
        else if(v[i].cant<min2) then begin 
            min2:=v[i].cant;
            codMin2:=v[i].codGenero;
        end;
    end;
    writeln;
    writeln('Los dos codigos musicales con menor cantidad de rteproduciones en spotify son: ');
    writeln('1- ', codMin1);
    writeln('2- ', codMin2);
end;

procedure listaOrdenadaPoranio(var l2:lista; i:infoSeciones);
var
    nuevo, anterior, actual:lista;
begin 
    new(nuevo);
    nuevo^.dato:=i;
    actual:=l2;
    anterior:=l2;
    while(actual<>nil) and (i.anioEstreno > actual^.dato.anioEstreno) do begin 
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual=anterior) then    // al inicio o list vacia
        l2:=nuevo
    else 
        anterior^.sig:=nuevo;   //al medio o al final
    nuevo^.sig:=actual;
end;

procedure listaOrdenada(l:lista; v:vector);
var 
    dig, num, suma:integer; 
begin 
    while(l<>nil) do begin 
        num:=0;
        dig:=0;
        suma:=0;
        if(l^.dato.genero=1) or (l^.dato.genero=3) then begin 
            num:=v[l^.dato.genero].cant;    //cantidad de reproduciones totales del genero
            while(num<>0) do begin 
                dig:=num mod 10;
                suma:=suma+dig;
                num:=num div 10;
            end;
            if((suma mod 5) = 0) then begin 
                listaOrdenadaPoranio(l, l^.dato);
            end;
        end;
    end;
end;

//no entiendo muy bien como ordenaria por anio
procedure cantSesionesRealizadas(l:lista);
var
    anioActual, totalSesiones, totalReproduciones:integer;
begin 
    totalSesiones:=0;
    totalReproduciones:=0;
    
    while (l<>nil) do begin 
        anioActual:=l^.dato.anioEstreno
        l:l^.sig;
    end;

end;


var
    l, l2:lista;
    i:infoSeciones;
    v:vector;
begin 
    inicializarVector(v);
    cargarDatos(l, i);
    //A)
    menorCantReproduciones(l, v);
    //B) generar una lista ordenada por anio que contenga las sesiones de genero 1 y 3 cuya suma de los digitos de la cantidad de reproducines sea multiplo de 5
    listaOrdenada(l, v);
    //C realizar un modulo que reciba la lista generada en el punto anterior e informe para cada anio la cantidad de sesiones realizadas junto al total de reprouciones de spotify de esas seciones 
    cantSesionesRealizadas(l2);
end.