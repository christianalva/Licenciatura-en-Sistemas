program ej8;
type
    docente=record
        dni:integer;
        nombre:string;
        apellido:string;
        email:string;
        end;
    
    proyecPresent=record
        codigo:integer;
        titulo:string;
        cantAlum:integer;
        nombreEsc:string;
        localidad:string;
        end;
        
procedure Leer(var docente:docente; var proyecto:proyecPresent; var anio:integer);
begin
    write('Ingrese el nombre de la escuela: ');
    readln(proyecto.nombreEsc);
    write('Ingrese la localidad a la que pertenece: ');
    readln(proyecto.localidad);
    write('Ingrese el año: ');
    readln(anio);
    write('Ingrese el codigo unico del proyecto: ');
    readln(proyecto.codigo);
    write('Ingrese el titulo del proyecto: ');
    readln(proyecto.titulo);
    writeln('DOCENTE CORDINADOR:  ');
    write('Ingrese el DNI: ');
    readln(docente.dni);
    write('Ingrese el nombre: ');
    readln(docente.nombre);
    write('Ingrese el apellido: ');
    readln(docente.apellido);
    write('Ingrese el EMAIL: ');
    readln(docente.email);
    write('Ingrese la cantidad de alumnos que participan del proyecto: ');
    readln(proyecto.cantAlum);
    
end;

//cantidad de escuelas por cada localidad.
procedure escuelasXlocalidad(var proyecto:proyecPresent; var localidadAux:string; var cantXlocalidad:integer );
begin 

    if(proyecto.localidad=localidadAux) then begin
        cantXlocalidad:=cantXlocalidad+1;
        writeln('La cantidad de escuelas en la localidad: ', localidadAux, ' es de: ', cantXlocalidad);
    end;
end;

//Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
procedure mayorCantAlum(var proyecto:proyecPresent; var max, max2:integer; var nombreMax, nombreMax2:string);
begin 
    if(proyecto.cantAlum>max) then begin
        max2:=max;
        nombreMax2:=nombreMax;
        max:=proyecto.cantAlum;
        nombreMax:=proyecto.nombreEsc;
    end
    else if(proyecto.cantAlum>max2) then begin
        max2:=proyecto.cantAlum;
        nombreMax2:=proyecto.nombreEsc;
    end;

end;


//Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
procedure LocalidadDaireaux(var proyecto:proyecPresent);
var 
    digito, cantpar,cantimpar:integer;
    
begin 
    digito:=0;
    cantpar:=0;
    cantimpar:=0;
    if(proyecto.localidad='Daireaux') or (proyecto.localidad='daireaux') then begin
        while(proyecto.codigo>0) do begin
            digito:=(proyecto.codigo mod 10);
            
            if((digito mod 2)=0) then begin
             cantpar:=cantpar+1;
            end
            else 
                cantimpar:=cantimpar+1;
            
            proyecto.codigo:=proyecto.codigo div 10;
        end;
        if(cantpar=cantpar) then begin
            writeln('Los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares');
        end;
    end;

end;

var 
    proyecto:proyecPresent;
    doc:docente;
    anio,cant2018, cantXlocalidad, max, max2:integer;
    localidadAux, nombreMax, nombreMax2:string;
begin 
    anio:=0;
    cant2018:=0;
    cantXlocalidad:=0;
    max:=0;
    max2:=0;
    nombreMax2:='';
    nombreMax:='';  
    
    Leer(doc, proyecto, anio);
    localidadAux:=proyecto.localidad;
    
    while(proyecto.codigo<>-1) do begin 
        //Cantidad total de escuelas que participan en la convocatoria 2018 
        if(anio=2018) then begin
         cant2018:=cant2018+1;
        end;
        
        while(proyecto.codigo<>-1) and (proyecto.localidad=localidadAux)do begin
            escuelasXlocalidad(proyecto, localidadAux, cantXlocalidad);
            mayorCantAlum(proyecto, max, max2, nombreMax, nombreMax2);
            LocalidadDaireaux(proyecto);
            
            leer(doc,proyecto, anio);
            
        end;
        cantXlocalidad:=0;
        localidadAux:=proyecto.localidad;
        escuelasXlocalidad(proyecto, localidadAux, cantXlocalidad);
        mayorCantAlum(proyecto, max, max2, nombreMax, nombreMax2);
        LocalidadDaireaux(proyecto);
        
        anio:=0;
        localidadAux:='';
        
        
        if(proyecto.codigo<>-1) then begin
            leer(doc, proyecto, anio);
            localidadAux:=proyecto.localidad;
        end;
        
    end;
    writeln('La cantidad de escuelas que pantisipan de la convocatoria 2018 es de: ', cant2018);
    writeln('Los nombres de las dos escuelas con mayor cantidad de alumnos par5ticipantes son: ', nombreMax, ' y ', nombreMax2);
end.