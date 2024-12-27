program parcial2;
const 
    dimF=2;
type

    viajes=record
        codViaje:integer;
        numCoche:1000..2500;
        mesViaje:1..12;
        cantPasajes:integer;
        dniChofer:integer;
        capMax:real;
    end;
    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end;
    coches=record
        numero:integer;
        cantViajes:integer;
        cantPasajeros:integer;
    end;
    vector=array[1000..2500] of coches;
    
    
procedure inicializarVector(var ve:vector);
var
    i:integer;
begin 
    for i:=1000 to 2500 do begin 
        ve[i].numero:=i;
        ve[i].cantViajes:=0;
        ve[i].cantPasajeros:=0;
    end;
end;
    
procedure leerDatos(var v:viajes);
begin 
    writeln;
    write('Ingrese el codigo de viaje: ');
    readln(v.codViaje);
    write('Ingrese el numero de coche: ');
    readln(v.numCoche);
    write('Ingrese el mes de viaje: ');
    readln(v.mesViaje);
    write('Ingrese la cantidad de pasajes: ');
    readln(v.cantPasajes);
    write('Ingrese el DNI del chofer: ');
    readln(v.dniChofer);
    write('Ingrese la capacidad maxima: ');
    readln(v.capMax);
end;

procedure insertarAdelante(var l:lista; v:viajes);
var
    nuevo:lista;
begin 
    new(nuevo);
    nuevo^.dato:=v;
    nuevo^.sig:=l;
    l:=nuevo;
end;


procedure armarLista(var l:lista; v:viajes);
var
    i:integer;
begin 
    for i:=1 to dimF do begin 
        leerDatos(v);
        insertarAdelante(l, v);
    end;
    
end;

procedure cocheConMasViajes(l:lista; var ve:vector);
var
    i, max, numCoche, j:integer;
begin 
    max:=0;
    numCoche:=0;
    
    while(l<>nil) do begin 
        
        for i:= 1000 to 2500 do begin 
            if(l^.dato.numCoche=ve[i].numero) then begin 
                ve[i].cantViajes:=ve[i].cantViajes+1; 
                ve[i].cantPasajeros:=ve[i].cantPasajeros+l^.dato.cantPasajes;
            end;
        end;
        
        l:=l^.sig;
    end;
    
    for j:=1000 to 2500 do begin 
        if(ve[j].cantViajes>max) then begin
            max:=ve[j].cantViajes;
            numCoche:=ve[j].numero;
        end;
    end;
    
    writeln;
    writeln('El coche con mas vijes realizados es el: ', numCoche, ' con un total de: ', max, ' viajes.');
    
end;

//insertarOrdenado
procedure listaNueva(var l2:lista; v:viajes);
var
    nue, ant, act:lista;
begin 
    new(nue);
    nue^.dato:=v;
    act:=l2;
    ant:=l2;
    while(act<>nil) and (v.codViaje > l2^.dato.codViaje) do begin 
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then 
        l2:=nue
    else
        ant^.sig:=nue;
    nue^.sig:=nue;
end;

procedure procesarDato(l:lista);
var
    dni:integer;
begin 
    dni:=0;
    while(l<>nil) do begin 
        dni:=l^.dato.dniChofer;
        if(l^.dato.mesViaje=2) and ((dni mod 10) = 0) and (l^.dato.cantPasajes<l^.dato.capMax)  then begin 
            listaNueva(l, l^.dato);
        end;
        
        l:=l^.sig;
    end;
end;

procedure promedioPasajeros(v:vector);
var
    i:integer;
    promedio:real;
begin   
    for i:=1000 to 2500 do begin 
        promedio:=0;
        if(v[i].cantPasajeros>0) then begin
            promedio:=v[i].cantPasajeros/v[i].cantViajes;
            writeln;
            writeln('El promedio de pasajeros del auto del auto ', i , ' es de: ', promedio);
        end;
    end;
end;

var 
    l:lista;
    v:viajes;
    ve:vector;
begin 
    inicializarVector(ve);
    armarLista(l, v);
    //A)
    cocheConMasViajes(l, ve);
    //B)
    procesarDato(l);
    //C)
    promedioPasajeros(ve);
    
end.