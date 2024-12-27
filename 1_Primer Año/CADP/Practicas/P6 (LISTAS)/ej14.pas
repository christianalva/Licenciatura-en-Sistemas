program ej14;
type

    
    contadorTransportes=record
        medioT:string;//
        contador:integer;
    end;
    vector=array[1..5] of contadorTransportes;
    antAlumnos=record
        codAlumno:integer;
        dia:integer;
        mes:integer;
        facultad:string;
        viajesXdia:integer;
        contadorV:vector;
    end;
    vector1=array[1..1300] of antAlumnos;
    viajes=record
        codAlumno:integer;
        dia:integer;
        mes:integer;
        facultad:string;
        transporte:string;
    end;
    contarMedios=record
        medio:string;
        contador:integer;
    end;
    vector2=array[1..5] of contarMedios;
    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end;
    
    
procedure imprimir(l:lista);
begin
    while(l<>nil) do begin 
        writeln;
        writeln('Cod Alumno: ', l^.dato.codAlumno);
        writeln('Dia: ', l^.dato.dia, ' del mes: ', l^.dato.mes);
        writeln('Facultad: ', l^.dato.facultad);
        writeln('Medio de transporte: ', l^.dato.transporte);
        
        l:=l^.sig;
    end;
end;
    
    
procedure leerDatos(var l:lista; var cont:vector; var v:vector1; var dimA:integer);
var 
    aux:lista;
    cod, z, i, j:integer;
    esta:boolean;
begin
    cod:=0;
    dimA:=0;
    z:=1;
    writeln;
    l:=nil;
    esta:=false;
    
    for i:=1 to 1300 do begin 
        v[i].codAlumno:=0;
        v[i].dia:=0;
        v[i].mes:=0;
        v[i].facultad:='';
        v[i].viajesXdia:=0;
        for j:=1 to 5 do begin
            v[i].contadorV[j].medioT:='';
            v[i].contadorV[j].contador:=0;
        end;
    end;
    
    while(cod<>-1) do begin 
        writeln;
        writeln('Alumno: ', z);
        write('Ingrese el codigo de alumno (entre 1 y 1300): ');
        readln(cod);
        
        if(cod<>-1) then begin
            new(aux);
            aux^.dato.codAlumno:=cod;
            write('Ingrese el dia: ');
            readln(aux^.dato.dia);
            write('Ingrese el mes: ');
            readln(aux^.dato.mes);
            write('Ingrese la facultad a la que pertenece: ');
            readln(aux^.dato.facultad);
            write('Que medio de transporte utilizo? ');
            readln(aux^.dato.transporte);
           
            for i:=1 to dimA do begin 
                for j:=1 to 5 do begin 
                    if (v[i].codAlumno=aux^.dato.codAlumno) and (v[i].dia=aux^.dato.dia) and (v[i].mes=aux^.dato.mes) and (v[i].facultad=aux^.dato.facultad) then begin
                        esta:=true;
                        v[i].viajesXdia:=v[i].viajesXdia+1;
                        v[i].contadorV[j].contador:=v[i].contadorV[j].contador+1;
                        
                    end;
                end;
            end;
            
            if(not esta) then begin 
                dimA:=dimA+1;
                v[dimA].codAlumno:=aux^.dato.codAlumno;
                v[dimA].dia:=aux^.dato.dia;
                v[dimA].mes:=aux^.dato.mes;
                v[dimA].facultad:=aux^.dato.facultad;
                v[dimA].viajesXdia:=v[dimA].viajesXdia+1;
                for i:=1 to 5 do begin
                    if(v[dimA].contadorV[i].medioT='') then begin 
                        v[dimA].contadorV[i].medioT:=aux^.dato.transporte;
                        v[dimA].contadorV[i].contador:=1;
                    end;
                end;
            end;
            
            aux^.sig:=l;
            l:=aux;
            z:=z+1;
        end;
    end;
    writeln('Los alumnos son los sigientes: ');
    imprimir(l);
end;
    
procedure recorrerVector(l:lista; var v:vector2; var v1:vector1);   
var 
    i, j, z,max1 ,max2, mas6Viajes, mas80Gasto, gastoTotal:integer;
    nombreMax1, nombreMax2, medio1, medio2:string;
begin
    max1:=0;
    max2:=0;
    nombreMax2:='';
    nombreMax1:='';
    mas6Viajes:=0;
    mas80Gasto:=0;
    
    v[1].medio:='Bicicleta';
    v[2].medio:='Tren roca';
    v[3].medio:='Tren universitario';
    v[4].medio:='Colectivo interurbano';
    v[5].medio:='Colectivo Urbano';
    
    for i:=1 to 5 do begin 
        v[i].contador:=0;
    end;
    
    for i:=1 to 1300 do begin
        gastoTotal:=0;
        //A)
        if(v1[i].viajesXdia>6) then 
            mas6Viajes:=mas6Viajes+1;
            
        for j:=1 to 5 do begin
            if(v1[i].contadorV[j].medioT='Bicicleta') then begin
                gastoTotal:=gastoTotal+0;
                v[1].contador:=v[1].contador+1;
            end;
            if(v1[i].contadorV[j].medioT='Tren roca') then begin
                gastoTotal:=gastoTotal+20;
                v[2].contador:=v[2].contador+1;
            end;
            if(v1[i].contadorV[j].medioT='Tren universitario') then begin
                gastoTotal:=gastoTotal+30;
                v[3].contador:=v[3].contador+1;
            end;
            if(v1[i].contadorV[j].medioT='Colectivo interurbano') then begin
                gastoTotal:=gastoTotal+40;
                v[4].contador:=v[4].contador+1;
            end;
            if(v1[i].contadorV[j].medioT='Colectivo Urbano') then begin
                gastoTotal:=gastoTotal+60;
                v[5].contador:=v[5].contador+1;
            end;
        end;
        
        if(gastoTotal>80) then begin
            mas80Gasto:=mas80Gasto+1;
        end;
    end;
    writeln;
    writeln('la cantidad de alumnos que realizan mas de 6 viajes por dia es de: ', mas6Viajes);
    writeln;
    writeln('La cantidad de alumnos que gastan mas de $80 por dia es de: ', mas80Gasto);
    
    
    for z:=1 to 5 do begin
        if(v[z].contador>max1) then begin
            max2:=max1;
            max1:=v[z].contador;
            nombreMax2:=nombreMax1;
            nombreMax1:=v[z].medio;
        end
        else if(v[z].contador>max2) then begin
            max2:=v[z].contador;
            nombreMax2:=v[z].medio;
        end;
    end;
    writeln;
    writeln('los dos medios de transporte mas utilizados son: ');
    writeln('1- ', nombreMax1);
    writeln('2- ', nombreMax2);
    
end;


procedure combinacion(var v:vector1);
var
    i, j, x, cant:integer;
begin 
    cant:=0;
    for i:=1 to 1300 do begin 
        for j:=1 to 5 do begin 
            if(v[i].contadorV[j].medioT='Bicicleta') then begin
                for x:=1 to 5 do begin 
                    if(v[i].contadorV[x].medioT<>'Bicicleta') then begin
                        cant:=cant+1;
                    end;
                end;
            end;
        end;
    end;
    
    writeln;
    writeln('La cantidad de alumnos que combinan Bicicleta y algun otro medio de transporte es de: ', cant);
end;
 
    
    
var 
    L:lista;
    v:vector;
    v1:vector1;
    v2:vector2;
    dimA:integer;
begin
    dimA:=0;
    leerDatos(L, v, v1, dimA);
    recorrerVector(L, v2,v1);
    combinacion(v1);
    
end.