program ej4;
var 
    num, min1, min2, i: integer;
begin
    min1:= 0;
    min2:= 0;
    
    write('Ingrese un numero entero: ');
    readln(num);
    min1 := num;
    num:=0;
    write('Ingrese otro numero entero: ');
    readln(num);
    min2 := num;
    num:=0;
    for i:=2 to 999 do begin
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
            num:=0;
        end;
    end;
    writeln('Los dos numeros minimos leidos son los: ', min2, ' y ', min1);
end.