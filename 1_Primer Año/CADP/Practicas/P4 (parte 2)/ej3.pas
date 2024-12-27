program ej3;
const 
    dimF=4;//200
type
    viajes= record
        dia:1..31;
        montoDin:real;
        distanciaReco:real;
        end;
    vector=array[1..dimF] of viajes;
    dias=array[1..31] of integer; 

//A)
procedure leerViajes(var v:vector; var d:dias; var dimL:integer; var montoTotal:real);
var 
    i:integer;
begin
    i:=1;
    writeln('VIAJE ', i);
    write('Ingrese el dia del mes (1 a 31): ');
    readln(v[i].dia);
    write('Ingrese el monto de dinero transportado: ');
    readln(v[i].montoDin);
    write('Ingrese la distancia recorrida en KM: ');
    readln(v[i].distanciaReco);
    
    while (v[i].distanciaReco<>0) and (i<dimF) do begin 
        d[v[i].dia]:=d[v[i].dia]+1;
        montoTotal:=montoTotal+v[i].montoDin;
        i:=i+1;
        dimL:=dimL+1;
        
        
        writeln('VIAJE ', i);
        write('Ingrese el dia del mes (1 a 31): ');
        readln(v[i].dia);
        write('Ingrese el monto de dinero transportado: ');
        readln(v[i].montoDin);
        write('Ingrese la distancia recorrida en KM: ');
        readln(v[i].distanciaReco);
        if(v[i].distanciaReco=0) then
            dimL:=dimL-1;
    end;
end;

//B)
procedure informar(var v:vector; var d:dias; var dimL:integer; var montoTotal:real);
var
    diaMin,i, x:integer;
    montoProm, menosDim, distancia:real;

begin
    diaMin:=0;
    distancia:=0;
    menosDim:=9999;
    montoProm:=0;
    
    for i:=1 to dimL do begin 
        if(v[i].montoDin<menosDim) then begin
            menosDim:=v[i].montoDin;
            diaMin:=v[i].dia;
            distancia:=v[i].distanciaReco;
        end;
    end;
    
    montoProm:=(montoTotal/dimL);
    writeln();
    writeln('El monto promedio de los viajes realizados es de: ', montoProm:2:2);
    writeln();
    writeln('El dia: ', diaMin, ' se realizo el viaje que menos dinero transporto, y la distancia fue de: ', distancia:2:2, 'KM');
    writeln();
    
    for x:=1 to 31 do begin
        writeln('el dia ', x, ' se realizaron: ', d[x], ' viajes');
    end
end;

//C)
procedure eliminar(var v:vector; dimL:integer);
var 
    i, k:integer;
begin   
    writeln;
    writeln;
    for i:=1 to dimL do begin
        writeln('Dia: ',v[i].dia,' Dinero: ',v[i].montoDin:2:2,' Distancia ',v[i].distanciaReco:2:2);
        if (v[i].distanciaReco = 100) then begin
            for k:=i to dimL-1 do begin
                v[i].distanciaReco:=v[i+1].distanciaReco;
                v[i].montoDin:=v[i+1].montoDin;
                v[i].dia:=v[i+1].dia;
            end;
            dimL:=dimL-1;
        end;
    end;
    writeln;
    writeln('Elimino los viajes que tengan mas de 100KM');
    for i:=1 to dimL do
        writeln('Dia: ',v[i].dia,' Dinero: ',v[i].montoDin:0:2,' Distancia ',v[i].distanciaReco:0:2);
end;


var
    d:dias;
    v:vector;
    dimL:integer;
    montoTotal:real;
begin
    dimL:=1;
    montoTotal:=0;
    
    leerViajes(v, d, dimL, montoTotal);
    informar( v, d,  dimL, montoTotal);
    eliminar(v, dimL);
end.