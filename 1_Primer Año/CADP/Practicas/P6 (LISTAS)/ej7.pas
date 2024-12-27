program ej7;
const
    rEspectro=7;
type
    
    espectro=record
        tipo:string;
        cant:integer;
    end;
    sondas=record
        nombre:string;
        duracionMision:integer;
        costoConst:real;
        costoMantenimiento:real;
        espec:string;
    end;
    
    lista=^nodo;
    
    nodo=record
        dato:sondas;
        sig:lista;
    end;
    
    vectorE=array[1..rEspectro] of espectro;

procedure cargarEspec(var v:vectorE);
var 
    i:integer;
begin
    v[1].tipo:='Radio';
    v[2].tipo:='Micoondas';
    v[3].tipo:='Infrarojo';
    v[4].tipo:='Luz visible';
    v[5].tipo:='Ultra violeta';
    v[6].tipo:='Rayos X';
    v[7].tipo:='Rayos gamma';
    
    //inicializo el vectorE para que no contenga basura
    for i:=1 to rEspectro do begin 
        v[i].cant:=0;
    end
    
end;

procedure leerDatos(var l:lista);
var
    i, cantSondas:integer;
    aux:lista;
    
begin
    cantSondas:=0;
    i:=1;
    writeln;
    l:=nil;
    
    repeat
        writeln('ZONDA ', i);
        new(aux);
        write('Ingrese el Nombre de la sonda: ');
        readln(aux^.dato.nombre);
        write('Ingrese la duracion estimada de la mision en meses: ');
        readln(aux^.dato.duracionMision);
        write('Ingrese el costo de construccion: ');
        readln(aux^.dato.costoConst);
        write('Ingrese el costo de costo de mantenimiento: ');
        readln(aux^.dato.costoMantenimiento);
        write('Introduzca el rango del espectro electromagnético: ');
        readln(aux^.dato.espec);
        
        i:=i+1;
        aux^.sig:=l;
        l:=aux;
        cantSondas:=cantSondas+1;
        
    until aux^.dato.nombre='GAIA';

end;



procedure verificarCumplimiento(l:lista; var L1, L2:lista);
var 
    cumple, noCumple:lista;
begin
    cumple:=nil;
    noCumple:=nil;
    L1:=nil;
    L2:=nil;
    writeln;
    
    
    while(l<>nil) do begin 
        
        //A
        if(l^.dato.costoMantenimiento<l^.dato.costoConst) and (l^.dato.espec<>'Radio') then begin 
            writeln('La sonda de nombre: ', l^.dato.nombre, ' cumple con los criterios del programa H2020');
            //B
            new(cumple);
            cumple^.dato.nombre:=l^.dato.nombre;
            cumple^.dato.duracionMision:=l^.dato.duracionMision;
            cumple^.dato.costoConst:=l^.dato.costoConst;
            cumple^.dato.costoMantenimiento:=l^.dato.costoMantenimiento;
            cumple^.dato.espec:=l^.dato.espec;
            
            cumple^.sig:=L1;
            L1:=cumple;
        end
        else begin
            writeln('La sonda de nombre: ', l^.dato.nombre, ' NO cumple con los criterios del programa H2020');
            //B
            new(noCumple);
            noCumple^.dato.nombre:=l^.dato.nombre;
            noCumple^.dato.duracionMision:=l^.dato.duracionMision;
            noCumple^.dato.costoConst:=l^.dato.costoConst;
            noCumple^.dato.costoMantenimiento:=l^.dato.costoMantenimiento;
            noCumple^.dato.espec:=l^.dato.espec;
            
            noCumple^.sig:=L2;
            L2:=noCumple;
        end;
        
        
        l:=l^.sig;
    end;
end;

procedure noFinanciados(L2:lista);
var 
    costoTotal:real;
    cantSondas:integer;
begin 
    costoTotal:=0;
    cantSondas:=0;
    
    while(L2<>nil) do begin
        costoTotal:=(costoTotal+(L2^.dato.costoConst+L2^.dato.costoMantenimiento));
        cantSondas:=cantSondas+1;
        l2:=L2^.sig;
    end;
    
    writeln;
    writeln('La cantidad de sondas no financiadas es de: ', cantSondas, ' con un costo total de: ', costoTotal:2:2);
end;


var 
    L, L1, L2:lista;
    v:vectorE;

begin 
    cargarEspec(v);
    leerDatos(L);
    verificarCumplimiento(L, L1, L2);
    noFinanciados(L2);
end.