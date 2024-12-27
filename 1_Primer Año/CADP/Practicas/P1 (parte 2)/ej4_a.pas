program ej4_a;
var 
    num, min1, min2, i: integer;
begin
    min1:= 9999;
    min2:= 9999;
    

    repeat
        num:=0;
        write('Ingrese otro numero entero: ');
        readln(num);
        
        if((num<min1) or (num<min2)) then
        begin
            if(num<min1) then begin
                min2:=min1;
                min1:=num;
            end
            else if(num<min2) then begin
                min2:=num;
            end;
            
        end;
    until(num=0);
    writeln('Los dos numeros minimos leidos son los: ', min2, ' y ', min1);
end.