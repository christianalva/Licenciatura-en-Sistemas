program ej5;
var 
   num, min, max, suma:integer;
begin
    
    max:= 0;
    min:= 9999;
    suma:=0;
    
    repeat
        num:=0;
        write('Ingrese un numero: ');
        read(num);
        
        if(num>max) then begin
            max:= num;
        end;
        if(num<min) then begin
            min:=num;
        end;
        
        suma := suma+num;
 
    until(num = 100);
    
    writeln('El numero maximo leido ah sido el: ', max);
    writeln('El numero minimo leido ah sido el: ', min);
    writeln('La suma total de los numeros introducidos es de: ', suma);
    
    
end.