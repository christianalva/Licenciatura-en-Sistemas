program ej7;
type
    centroInvestigacion=record
        nombre:string;
        universidad:string;
        cantInvestigadores:integer;
        cantBecarios:integer;
        end;

procedure LeerInfo(var centro:centroInvestigacion);
begin
    write('Ingresar su nombre abreviado (ej. LIDI, LIFIA, LINTI): ');
    readln(centro.nombre);
    write('Ingresar la unversidad a la que pertenece: ');
    readln(centro.universidad);
    write('Ingresar la cantidad de investigadores: ');
    readln(centro.cantInvestigadores);
    write('Ingresar la cantridad de becarios: ');
    readln(centro.cantBecarios);


end;

procedure Info(centro:centroInvestigacion; var maxInves, min, min2:integer; var uniMaxInves, centroMin, centroMin2:string);
begin
    
    //Universidad con mayor cantidad de investigadores en sus centros.
    if(centro.cantInvestigadores>maxInves) then begin
        maxInves:=centro.cantInvestigadores;
        uniMaxInves:=centro.universidad
    end;
        
        
    //Los dos centros con menor cantidad de becarios.
    if(centro.cantBecarios<min) then begin
        min2:=min;
           centroMin2:=centroMin;
        min:=centro.cantBecarios;
        centroMin:=centro.nombre;
    end
    else if(centro.cantBecarios<min2) then begin
        min2:=centro.cantBecarios;
           centroMin2:=centro.nombre;
    end;

end;


var
    centro:centroInvestigacion;
    maxInves, min, min2, centrosInvestigacion:integer;
    uniMaxInves, centroMin, centroMin2, universidadActual:string;
begin 
    maxInves:=0;
    centrosInvestigacion:=0;
    min:=9999;
    min2:=9999;
    centroMin2:='';
    centroMin:='';
    
    LeerInfo(centro);
    universidadActual:=centro.Universidad;
    while(centro.cantInvestigadores<>0) do begin
    
        while(universidadActual=centro.universidad) and (centro.cantInvestigadores<>0) do begin
            
            //Cantidad total de centros para cada universidad.
            centrosInvestigacion:= centrosInvestigacion+1;
            Info(centro, maxInves, min, min2, uniMaxInves, centroMin, centroMin2);
            LeerInfo(centro);
            if (universidadActual<>centro.universidad) or (centro.cantInvestigadores=0) then begin
                writeln('Esta universidad tiene ',centrosInvestigacion,' centros de investigacion');
                break;
            end;
            LeerInfo(centro);
        end;
        universidadActual:=centro.universidad;
        centrosInvestigacion:=0;
    end;
    
    writeln('La universidad con mayor cantidad de investigadores en sus centros es: ', uniMaxInves);
    writeln('Los dos centros con menor cantidad de becarios son: ', centroMin, ' y ', centroMin2);
end.