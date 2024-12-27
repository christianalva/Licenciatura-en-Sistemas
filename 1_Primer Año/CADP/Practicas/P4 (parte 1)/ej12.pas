program ej12;
const
    dimF=5;//53
type
    galaxias=record
        nombre:string;
        tipo:integer;
        masa:real;
        distancia:real;
        end;
    vector=array[1..dimF] of galaxias;
    tipos=array[1..4] of integer;

procedure leerDatos(var g:galaxias);
begin 
    writeln();
    write('Ingrese el nombre: ');
    readln(g.nombre);
    write('Ingrese su tipo (1. eliptica, 2. espiral, 3. lenticular, 4.irregular): ');
    readln(g.tipo);
    write('Ingrese su masa (medida en kg): ');
    readln(g.masa);
    write('Ingrese la distancia en pársecs (pc) medida desde la Tierra: ');
    readln(g.distancia);
end;

procedure guardarDatos(var g:galaxias; var v:vector; x:integer);
begin
    v[x]:=g;
end;

procedure galaxiasPorTipo(var t:tipos; var g:galaxias);
begin 
    t[g.tipo]:= t[g.tipo]+1;
end;

procedure galaxiasMaxYMin(var v:vector; var max1,max2,min1,min2:real; var nombreMax1, nombreMax2, nombreMin1,nombreMin2:string);
var 
    i:integer;
begin
    for i:=1 to dimF do begin 
        // moximo 
        if(v[i].masa > max1)then begin
            max2:=max1;
            nombreMax2:=nombreMax1;
            max1:=v[i].masa;
            nombreMax1:=v[i].nombre;
        end
        else if(v[i].masa > max2) then begin 
            max2:=v[i].masa;
            nombreMax2:=v[i].nombre;
        end;
        
        
        //minimo
        if(v[i].masa < min1)then begin 
            min2:=min1;
            nombreMin2:=nombreMin1;
            min1:=v[i].masa;
            nombreMin1:=v[i].nombre;
        end
        else if(v[i].masa < min2)then begin 
            min2:=v[i].masa;
            nombreMin2:=v[i].nombre;
        end;
    end;

end;


var
    g:galaxias;
    v:vector;
    t:tipos;
    x, cantGalaxiasNoirregulares:integer;
    masa3GalaxPric, masaTotal, promMasas, max1, max2, min1, min2:real;
    nombreMax1, nombreMax2, nombreMin1, nombreMin2:string;
begin 
    masa3GalaxPric:=0;
    masaTotal:=0;
    cantGalaxiasNoirregulares:=0;
    max1:=0;
    max2:=0;
    min1:=9999;
    min2:=9999;
    nombreMin1:='';
    nombreMin2:='';
    nombreMax1:='';
    nombreMax2:='';
    
    for x:=1 to dimF do begin
        leerDatos(g);
        guardarDatos(g, v, x);
        galaxiasPorTipo(t, g);
        
        if(v[x].nombre='via lactea') or (v[x].nombre='andromeda') or (v[x].nombre='triangulo') then begin
            masa3GalaxPric:=masa3GalaxPric+v[x].masa;
        end;
        
        if(v[x].tipo<>4) and (v[x].distancia<1000) then  begin
            cantGalaxiasNoirregulares:=cantGalaxiasNoirregulares+1;
        end;
        masaTotal:=masaTotal+v[x].masa;
    end; 
    
    galaxiasMaxYMin( v, max1 , max2, min1, min2, nombreMax1, nombreMax2, nombreMin1,nombreMin2);
    
    
    writeln();
    for x:= 1 to 4 do begin 
        writeln('la cantidad de galacias de tipo ', x, ' es de: ', t[x]);
    end;
    writeln();
    promMasas:=(masa3GalaxPric/masaTotal)/100;
    
    writeln('La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) es de: ', masa3GalaxPric:2:2);
    writeln(' y esto reperecenta a un: ', promMasas:2:2 , '% de la masa total');
    
    writeln();
    writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es de: ', cantGalaxiasNoirregulares);
    
    writeln();
    writeln('El nombre de las dos galaxias con mayor masa son: ');
    writeln('1- ', nombreMax1);
    writeln('2- ', nombreMax2);
    writeln('El nombre de las dos galaxias con menor masa son: ');
    writeln('1- ', nombreMin1);
    writeln('2- ', nombreMin2);

end.