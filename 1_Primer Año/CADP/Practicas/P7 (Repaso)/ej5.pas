program ej5;
type
    
    infoCamion=record
        patente:string;
        anioFabricacion:integer;
        pesoMax:real;
    end;
    infoViajes=record
        camion:infoCamion;
        codViaje:integer;
        codCamion:integer;
        distancia:real;
        ciudadDestino:string;
        anioViaje:integer;
        dniChofer:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:infoViajes;
        sig:lista;
    end;
    

procedure leerDatos(var l:lista);
var
    aux:lista;
    codViaje, cant:integer;
begin
    cant:=1;
    codViaje:=0;
    l:=nil;
    aux:=l;
    
    
    while(codViaje<>-1) and (cant<100) do begin 
        new(aux);
        writeln;
        writeln('INFORMACION CAMION');
        writeln;
        write('Ingrese la patente del camion: ');
        readln(aux^.dato.camion.patente);
        write('Ingrese el anio de fabicacion del camion: ');
        readln(aux^.dato.camion.anioFabricacion);
        write('Ingrese el peso maximo en toneladas que puede transportar: ');
        readln(aux^.dato.camion.pesoMax);
        writeln;
        writeln('DATOS DE VIAJE');
        writeln;
        write('Ingrese el codigo de viaje: ');
        readln(codViaje);
        if(codViaje<>-1) then begin
            aux^.dato.codViaje:=codViaje;
            write('Ingrese el codigo del camion (1-100): ');
            readln(aux^.dato.codCamion);
            write('Ingrese la distancia recorrida en kilometros: ');
            readln(aux^.dato.distancia);
            write('Ingrese ciudad de destino: ');
            readln(aux^.dato.ciudadDestino);
            write('Ingrese el anio del viaje: ');
            readln(aux^.dato.anioViaje);
            write('Ingrese el DNI del chofer: ');
            readln(aux^.dato.dniChofer);
        end
        else begin 
            dispose(aux);
        end;
    
        cant:=cant+1;
        aux^.sig:=l;
        l:=aux;
    end;
end;


procedure masKm(l:lista);
var
    max, min:real;
    patenteMax, patenteMin:string;
begin 
    max:=0;
    min:=9999;
    patenteMax:='';
    patenteMin:='';
    
    while(l<>nil) do begin
        if(l^.dato.distancia>max) then begin 
            max:=l^.dato.distancia;
            patenteMax:=l^.dato.camion.patente;
        end;
        if(l^.dato.distancia<min) then begin
            min:=l^.dato.distancia;
            patenteMin:=l^.dato.camion.patente;
        end;

        l:=l^.sig;
    end;
    writeln;
    writeln('La patente del camion que menos KM pose es: ', patenteMin, ' con un total de: ', min:2:2, 'KM');
    writeln('La patente del camion que mas KM posee es: ', patenteMax, ' con un total de: ', max:2:2, 'KM');
end;

procedure capacidadMayor(l:lista);
var 
    cantViajes, antiguedad:integer;
begin 
    
    while(l<>nil) do begin 
        cantViajes:=0;
        antiguedad:=0;
        
        antiguedad:=(l^.dato.anioViaje-l^.dato.camion.anioFabricacion);
        if(l^.dato.camion.pesoMax>30.5) and (antiguedad > 5)then begin
            cantViajes:=cantViajes+1;
        end;
        
        l:=l^.sig;
    end;
    writeln;
    writeln('La cantidad de viajes realizados por camiones de capacidad mayor a 30.5 toneladas y con una antiguedad mayor a 5 anios es de: ', cantViajes);
end;


procedure digitosImpares(l:lista);
var 
    dni,cantDig, cantImpar:integer;
begin 
    

    while(l<>nil) do begin 
        dni:=l^.dato.dniChofer;
        cantImpar:=0;
        cantDig:=0;
        while(dni<>0) do begin 
            if(((dni mod 10 ) mod 2) <> 0) then begin
                cantImpar:=cantImpar+1;
            end;
            cantDig:=cantDig+1;
            dni:= dni div 10;
        end;
        if (cantDig>0) and (cantImpar>0) and (cantDig=cantImpar) then begin 
            writeln;
            writeln('El codigo de viaje: ', l^.dato.codViaje, ' posee un chofer con DNI con todos los digitos impares.');
        end;
        l:=l^.sig;
    end;        
end;


var
    l:lista;
begin 
    leerDatos(l);
    masKm(l);
    capacidadMayor(l);
    digitosImpares(l);
end.