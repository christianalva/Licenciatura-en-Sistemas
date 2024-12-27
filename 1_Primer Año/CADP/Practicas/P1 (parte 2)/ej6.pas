program ej6;
var 
   precio, precioMenor1, precioMenor2: real;
   codigo, codMenor1, codMenor2, i, mas16: integer;
begin
    precioMenor2:=999999;
    precioMenor1:=999999;
    codMenor2:=0;
    codMenor1:=0;
    mas16:= 0;

    for i:=1 to 200 do begin
        write('ingrese el codigo del producto: ');
        readln(codigo);
        write('Ingrese el precio del producto: ');
        readln(precio);
        
        if(precio<precioMenor1) then
        begin
            precioMenor2:=precioMenor1;
            precioMenor1:=precio;
            codMenor2:=codMenor1;
            codMenor1:=codigo;
        end
        else if(precio<precioMenor2) then
        begin
            precioMenor2:= precio;
            codMenor2:=codigo;
        end;
        
        if(((codigo MOD 2) = 0) and (precio > 16)) then
        begin
            mas16:= mas16+1;
        end;
        precio:=0;
        codigo:=0;
    end;
    
    writeln('Los codigos de los dos productos mas baratos son: ', codMenor2, ' y ', codMenor1);
    writeln('La cantidad de productos de mas de 16 pesos con codigo par es de: ', mas16);

end.