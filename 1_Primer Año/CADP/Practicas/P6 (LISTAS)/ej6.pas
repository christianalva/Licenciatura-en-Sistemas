program ej6;
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

procedure leerDatos(var l:lista; var duracionPromedioTotal, costoPromedioTotal:real);
var
    i, cantSondas, duracionTotal:integer;
    aux:lista;
    costoConstTotal:real;
begin
    cantSondas:=0;
    duracionTotal:=0;
    i:=1;
    writeln;
    costoConstTotal:=0;
    l:=nil;
    
    repeat
        writeln('ZONDA ', i);
        new(aux);
        write('Ingrese el Nombre de la sonda: ');
        readln(aux^.dato.nombre);
        write('Ingrese la duracion estimada de la mision en meses: ');
        readln(aux^.dato.duracionMision);
        duracionTotal:=(duracionTotal+aux^.dato.duracionMision);
        write('Ingrese el costo de construccion: ');
        readln(aux^.dato.costoConst);
        costoConstTotal:=(costoConstTotal+aux^.dato.costoConst);
        write('Ingrese el costo de costo de mantenimiento: ');
        readln(aux^.dato.costoMantenimiento);
        write('Introduzca el rango del espectro electromagnético: ');
        readln(aux^.dato.espec);
        
        i:=i+1;
        aux^.sig:=l;
        l:=aux;
        cantSondas:=cantSondas+1;
    until aux^.dato.nombre='GAIA';
    
    duracionPromedioTotal:=(duracionTotal/cantSondas);
    costoPromedioTotal:=(costoConstTotal/cantSondas);
end;

procedure ImprimierVector(var v:vectorE);
var 
    i:integer;
begin
    
    writeln('Cantidad de sondas que realizan estudios en cada rango del espectro electromagnético. ');
    for i:=1 to rEspectro do begin 
        writeln(v[i].cant,' realizan estudios en ' , v[i].tipo);
    end;
end;


procedure recorrerLista(l:lista; var v:vectorE; duracionPromedioTotal, costoPromedioTotal:real);
var 
    max, costoTotal:real;
    i, superaDuracion:integer;
    nombreMax:string;
begin
    max:=0;
    nombreMax:='';
    costoTotal:=0;
    superaDuracion:=0;
    
    writeln;
    while l<>nil do begin 
        costoTotal:=(l^.dato.costoMantenimiento+l^.dato.costoConst);
        
        //A)
        if(costoTotal>max) then begin 
            max:=costoTotal;
            nombreMax:=l^.dato.nombre;
        end;
        
        //B)
        for i:=1 to rEspectro do begin
            if(v[i].tipo=l^.dato.espec) then
                v[i].cant:=v[i].cant+1;
        end;
        
        //C
        if(l^.dato.duracionMision>duracionPromedioTotal) then   
            superaDuracion:=superaDuracion+1;
        
        //D
        if(l^.dato.costoConst>costoPromedioTotal) then
            writeln('La sonda de nombre: ', l^.dato.nombre, ' supera el costo de construccion promedio con un costo total de: ', l^.dato.costoConst:2:2 );
        
        l:=l^.sig;
        costoTotal:=0;
    end;
    
    writeln;
    writeln('El nombre de la sonda mas costosa es: ', nombreMax);
    writeln;
    ImprimierVector(v);
    writeln;
    writeln('la cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas es de: ', superaDuracion);
end;





var 
    L:lista;
    v:vectorE;
    duracionPromedioTotal, costoPromedioTotal:real;
begin 
    duracionPromedioTotal:=0;
    costoPromedioTotal:=0;
    
    
    cargarEspec(v);
    leerDatos(L, duracionPromedioTotal, costoPromedioTotal);
    recorrerLista(L, v, duracionPromedioTotal, costoPromedioTotal);
end.