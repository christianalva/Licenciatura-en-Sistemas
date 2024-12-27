program ej9;

procedure infoApellido(apellido: string; var apellidoMasChico, apellidoMasChico2: string; numInscripcion:integer; var numMasChico, numMasChico2: integer);
begin 
    
    if(numInscripcion<numMasChico) then begin
        numMasChico2:= numMasChico;
        apellidoMasChico2:=apellidoMasChico;
        numMasChico:=numInscripcion;
        apellidoMasChico:= apellido;
        
    end
    else if(numInscripcion<numMasChico2) then begin
        numMasChico2:=numInscripcion;
        apellidoMasChico2:=apellido;
    end;

end;


procedure infoNombre(nombre: string; var nombreMasGrande, nombreMasGrande2: string; numInscripcion:integer; var numMasGrande, numMasGrande2: integer);
begin 
    if(numInscripcion>numMasGrande) then begin
        numMasGrande2:= numMasGrande;
        nombreMasGrande2:=nombreMasGrande;
        numMasGrande:=numInscripcion;
        nombreMasGrande:= nombre;
        
    end
    else if(numInscripcion>numMasGrande2) then begin
        numMasGrande2:=numInscripcion;
        nombreMasGrande:=nombre;
    end;

end;


procedure porcentajePar(numInscripcion: integer; var inscripcionPar: integer);
begin
    
    if((numInscripcion mod 2) = 0) then
        inscripcionPar:= inscripcionPar+1;

end;

var 
    numInscripcion, numMasChico, numMasChico2, numMasGrande, numMasGrande2, inscripcionPar, tot:integer;
    apellido, apellidoMasChico, apellidoMasChico2, nombre, nombreMasGrande, nombreMasGrande2: string;
begin
    
    numMasChico2:= 9999;
    numMasChico:= 9999;
    numMasGrande:=0;
    numMasGrande2:=0;
    inscripcionPar:=0;
    tot:=0;
    
    repeat
        
        write('Ingrese su numero de inscripcion: ');
        readln(numInscripcion);
        write('Ingrese su apellido: ');
        readln(apellido);
        write('Ingrese su nombre: ');
        readln(nombre);
        tot:=tot+1;
        
        infoApellido(apellido, apellidoMasChico, apellidoMasChico2, numInscripcion, numMasChico, numMasChico2);
        infoNombre(nombre, nombreMasGrande, nombreMasGrande2, numInscripcion, numMasGrande,numMasGrande2);
        porcentajePar(numInscripcion, inscripcionPar);
        
    until numInscripcion=1200;
    
    writeln('Los apellidos de los dos alumnos con numero de inscripcion mas chico son: ', apellidoMasChico2, ' y ', apellidoMasChico);
    writeln('Los nombres de los dos alumnos con numero de inscripcion mas grande son: ', nombreMasGrande2, ' y ', nombreMasGrande);
    writeln('El porcentaje de alumnos con numero de inscripcion par es de: ', inscripcionPar/tot*100:2:2, '%');

end.