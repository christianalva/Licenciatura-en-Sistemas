program ej7;
var 
   nombre, nombrePrimerPuesto, nombreSegundoPuesto, nombreAnteulti, nombreUltimo: string;
   tiempo, tiempoMenor1, tiempoMenor2, tiempoMayor1, tiempoMayor2: real;
   i: integer;
begin
    tiempoMenor2:=999999;
    tiempoMenor1:=999999;
    tiempoMayor2:=0;
    tiempoMayor1:=0;
    nombrePrimerPuesto:='';
    nombreSegundoPuesto:='';
    nombreAnteulti:='';
    nombreUltimo:='';

    for i:=1 to 100 do begin
        write('Ingrese el nombre del piloto del auto numero ', i, ': ');
        readln(nombre);
        write('Ingrese el tiempo que le tomo finalizar la carrera: ');
        readln(tiempo);
        
        //dos primeros
        if(tiempo<tiempoMenor1) then
        begin
            tiempoMenor2:=tiempoMenor1;
            tiempoMenor1:=tiempo;
            nombreSegundoPuesto:=nombrePrimerPuesto;
            nombrePrimerPuesto:=nombre;
        end
        else if(tiempo<tiempoMenor2) then
        begin
            tiempoMenor2:= tiempo;
            nombreSegundoPuesto:=nombre;
        end;
        
        //dos ultimos
        if(tiempo>tiempoMayor1) then
        begin
            tiempoMayor2:=tiempoMayor1;
            tiempoMayor1:=tiempo;
            nombreAnteulti:=nombreUltimo;
            nombreUltimo:=nombre;
        end
        else if(tiempo>tiempoMayor2) then
        begin
            tiempoMayor2:= tiempo;
            nombreAnteulti:=nombre;
        end;
        
    end;
    
    writeln('Los dos pilotos que finalizaron en los dos primeros puestos son: 1-', nombrePrimerPuesto, ' y 2-', nombreSegundoPuesto);
    writeln('Los dos pilotos que finalizaron en los dos últimos puestos son: 99-', nombreAnteulti, ' y 100-', nombreUltimo);

end.