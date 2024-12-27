{

Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La  lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse. Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo 19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio). Al finalizar la lectura, informar:

a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 (en el ejemplo anterior se debería informar 0%).


}


program ej6;
var 
    legajo, cantAlumnos, promMayor, alumDestacados: INTEGER;
    promedio: REAL;
begin
    legajo:= 0;
    cantAlumnos:= 0;
    promMayor:=0;
    alumDestacados:=0;
    
    while(legajo<>-1) do begin
        write('Ingrese el numero de legajo: ');
        read(legajo);
        if(legajo<>-1) then
        begin
            write('Ingrese el promedio del legajo: ', legajo, ': ');
            read(promedio);
        
            {sumo la cantidad de alumnos}
            cantAlumnos:= cantAlumnos+1;
        
            {promedio superior a 6.5}
            if(promedio>6.5) then
            begin
                promMayor:= promMayor+1;
            end;
        
            {legajos menores a 2500}
            if(legajo<2500) then
            begin
                {alumnos con promedio mayor a 8.5}
                if(promedio>8.5) then
                begin
                    alumDestacados:=alumDestacados+1;
                end;
            end;
        end;
    end;
    
    writeln('La cantidad de alumnos es de: ', cantAlumnos);
    writeln('La cantidad de alumnos cuyo promedio supera 6.5 es de: ', promMayor);
    writeln('Alumnos con promedio mayor a 8.5, cuyo legajo sean menor al valor 2500 es de: ', alumDestacados*100/cantAlumnos:0:0, '%');
end.

