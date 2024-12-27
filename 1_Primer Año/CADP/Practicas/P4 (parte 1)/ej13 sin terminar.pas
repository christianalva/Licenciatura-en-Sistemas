{El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:

a) el año con mayor temperatura promedio a nivel mundial.

b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ejercicio13;
const
    dimF=2;
    dimA=50;
type
    dato=array [1..dimF] of record
        anno:integer;
        lugar:string;
        promedioTemp:real;
    end;
    fechas=array [1..dimA] of record
        year,aux:integer;
        promAnual:real;
    end;
    
procedure vectorFechas(var annos:fechas);
var
    i,anno1:integer;
begin
    anno1:=1973;
    for i:=1 to dimA do begin
        annos[i].promAnual:=0;
        annos[i].aux:=0;
        annos[i].year:=anno1;
        anno1:=anno1+1;
    end;
end;

procedure cargarVector(var lugares:dato; var dimL:integer);
var
    i:integer;
begin
    writeln('Introduzca los datos de los registros');
    writeln;
    for i:=1 to dimF do begin
        write('Año: ');
        readln(lugares[i].anno);
        write('Lugar: ');
        readln(lugares[i].lugar);
        write('Temperatura promedio: ');
        readln(lugares[i].promedioTemp);
        writeln;
        if (i=dimF) then
            writeln('Fin de la carga de datos')
        else
            writeln('Siguiente registro');
        dimL:=dimL+1;
    end;
    writeln;
    writeln('La base de datos tiene ',dimL,' elementos');
end;

procedure temperaturas(var lugares:dato; var dimL:integer);
var
    i,j,anno1,year1:integer;
    annos:fechas;
    prom,maxTemp:real;
    nom1:string;
begin
    vectorFechas(annos);
    prom:=0;
    maxTemp:=0;
    for i := 1 to dimL do begin
        for j:=1 to dimA do begin
            if (annos[j].year=lugares[i].anno) then begin
                annos[j].aux:=annos[j].aux+1;
                annos[j].promAnual:=(annos[j].promAnual+lugares[i].promedioTemp)/annos[j].aux;
            end;
            if ([j].promAnual>prom) or (prom=0) then begin
                anno1:=lugares[i].anno;
                prom:=annos[j].promAnual;
            end;
        end;
    end;
    writeln;
    writeln('El año ',anno1,' tiene el registro de mayor temperatura promedio con ',prom:0:2,'°C');
    for i:=1 to dimL do begin
        if (lugares[i].promedioTemp>maxTemp) or (maxTemp=0) then begin
            maxTemp:=lugares[i].promedioTemp;
            nom1:=lugares[i].lugar;
            year1:=lugares[i].anno;
        end;
    end;
    writeln;
    writeln('La mayor temperatura registrada en los ultimos 50 años es de ',maxTemp:0:2,'°C en ',nom1,' durante el ',year1);
end;
var
    lugares:dato;
    dimL:integer;
begin
    cargarVector(lugares,dimL);
    temperaturas(lugares,dimL);
end.