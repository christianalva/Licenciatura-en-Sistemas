program ej3;
type

    infoEscuelas=record
        cue:integer;
        establecimiento:string;
        cantDocentes:integer;
        cantAlumnos:integer;
        localidad:string;
        
    end;

procedure LeerInfo(var info:infoEscuelas);
begin
    write('Introduzca su codigo unico de establecimiento (CUE): ');
    readln(info.cue);
    write('Ingrese el nombre de su establecimiento: ');
    readln(info.establecimiento);
    write('Ingrese la cantidad de doentes: ');
    readln(info.cantDocentes);
    write('Ingrese la cantidad de alumnos: ');
    readln(info.cantAlumnos);
    write('Ingrese la localidad del establecimiento educativo: ');
    readln(info.localidad);
  
end;

procedure relacionDA(var info:infoEscuelas; var mejorRelacion, mejorRelacion2:real; var mejorRelacionNombre, mejorRelacionNombre2:string; var cantLaPlata, cue1, cue2:integer);
var 
    relacionDocenteAlmno:real;
begin
    relacionDocenteAlmno:=(info.cantAlumnos/info.cantDocentes);
    
    if(relacionDocenteAlmno>23.435) then begin
        
        if(relacionDocenteAlmno>mejorRelacion) then begin
            mejorRelacion2:=mejorRelacion;
            mejorRelacionNombre2:=mejorRelacionNombre;
            cue2:=cue1;
            mejorRelacion:=relacionDocenteAlmno;
            mejorRelacionNombre:=info.establecimiento;
            cue1:=info.cue;
            
        end
        else if(relacionDocenteAlmno>mejorRelacion2) then begin
            mejorRelacion2:=relacionDocenteAlmno;
            mejorRelacionNombre2:=info.establecimiento;
            cue2:=info.cue;
        end;
        
    
        if((info.localidad='La Plata') or (info.localidad='la plata')) then begin
            cantLaPlata:=cantLaPlata+1;
        end;   
    end;

end;

var 
    infoE:infoEscuelas;
    cantLaPlata, i, cue1, cue2:integer;
    mejorRelacion, mejorRelacion2:real;
    mejorRelacionNombre, mejorRelacionNombre2:string;

begin 
    cantLaPlata:=0;
    mejorRelacion:=0;
    mejorRelacion2:=0;
    
    for i:=1 to 1 do begin
        LeerInfo(infoE);
        relacionDA(infoE, mejorRelacion, mejorRelacion2, mejorRelacionNombre, mejorRelacionNombre2, cantLaPlata, cue1, cue2);
    end;
    
    writeln('La cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO es de: ', cantLaPlata);
    writeln('CUE y nombre de la primer escuela con mejor relacion: CUE: ',cue1, ' y nombre: ', mejorRelacionNombre );
    writeln('CUE y nombre de la segunda escuela con mejor relacion: CUE: ',cue2, ' y nombre: ', mejorRelacionNombre2 );
end.