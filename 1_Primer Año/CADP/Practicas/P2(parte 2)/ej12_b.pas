program ej12_b;

procedure procesarInfo(var cantHectareas, tipoZona, precioPorTn:integer; var rendimiento:real);
begin

    case tipoZona of
    1: rendimiento:=((6*precioPorTn)*cantHectareas);

    2: rendimiento:=((2.6*precioPorTn)*cantHectareas);
    
    3: rendimiento:=((2.4*precioPorTn)*cantHectareas);
    
    else
        writeln('Tipo de zona incorrecto');
        end;

end;

procedure tresDeFebrero(var localidad:string; var rendimiento:real; var camps3Febrero:integer);
begin 
    
    if((localidad='Tres de Febrero') and (rendimiento>10000)) then begin
        camps3Febrero:=camps3Febrero+1;
    end;

end;

procedure campoMayorYMenorRend(var localidad, localidadMayorRemd, localidadMenorRemd:string;var rendimiento, mayorRend, menorRend:real );
begin
        
        if(rendimiento>mayorRend) then begin
            mayorRend:=rendimiento;
            localidadMayorRemd:=localidad;
        end;
        if(rendimiento<menorRend) then begin
            menorRend:=rendimiento;
            localidadMenorRemd:= localidad;
        end;
    
end;

var 
    localidad, localidadMayorRemd, localidadMenorRemd: string;
    precioPorTn, cantHectareas, tipoZona, camps3Febrero, rendPromedio, cantTotal:integer;
    rendimiento, mayorRend, menorRend, renTotal: real;
    
begin
    menorRend:=99999999;
    mayorRend:=0;
    precioPorTn:=320;
    tipoZona:=0;
    cantHectareas:=0;
    localidad:='';
    localidadMenorRemd:='';
    localidadMayorRemd:='';
    camps3Febrero:=0;
    rendimiento:=0;
    renTotal:=0;
    cantTotal:=0;

    repeat
        
        write('Ingresar Localidad: ');
        readln(Localidad);
        write('Ingresar cantidad de hectareas (ha): ');
        readln(cantHectareas);
        write('Ingresar tipo de zona: ');
        readln(tipoZona);
        
        procesarInfo( cantHectareas, tipoZona, precioPorTn, rendimiento);
        tresDeFebrero(localidad, rendimiento, camps3Febrero);
        campoMayorYMenorRend(localidad, localidadMayorRemd, localidadMenorRemd, rendimiento, mayorRend, menorRend);
        
        cantTotal:=cantTotal+1;
        renTotal:=renTotal+rendimiento;
    until ((cantHectareas=900) and (localidad='Saladillo'));
    
    writeln('La cantidad de campos en Tres de Febrero con rendimiento superior a 10000 es: ',camps3Febrero);
	writeln('La localidad del campo con mayor rendimiento es :',localidadMayorRemd);
	writeln('La localidad del campo con menor rendimiento es: ',localidadMenorRemd);
    writeln('El rendimiento economico promedio es: ',renTotal/cantTotal:2:2);
    
end.