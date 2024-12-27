program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

procedure leer(var alu : alumno; var contador:integer);
begin
    writeln('Ingrese el código del alumno');
    read(alu.codigo);
    
    if (alu.codigo <> 0) then begin
        write('Ingrese el nombre del alumno: '); read(alu.nombre);
        write('Ingrese el promedio del alumno: '); read(alu.promedio);
        contador:=contador+1;
    end;
end;
    

var
    a : alumno;
    contador:integer;
    alumnoMejorProm:string;
    mejorProm:real;
    
begin
    a.codigo:=1;
    mejorProm:=0;
    
    while(a.codigo<>0) do begin
        leer(a, contador);
        if((a.promedio)>mejorProm) then begin
            mejorProm:= a.promedio;
            alumnoMejorProm:=a.nombre;
        end;
        
    end;
    writeln('La cantidad de alumnos leidos fue de: ', contador);
    writeln('El nombre del alumno con mejor promedio es: ', alumnoMejorProm);
end.