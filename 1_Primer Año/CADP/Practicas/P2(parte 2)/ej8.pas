program ej7_a;

procedure descomponerNum(num:integer; var cantDigitos, sumaDigitos:integer);
var 
    digito:integer;
begin

    digito:=0;    
    while(num<>0) do begin
    
        digito:= num mod 10;
        
        if((digito mod 2)= 0) then 
            sumaDigitos:= sumaDigitos+digito
        else
            cantDigitos:= cantDigitos+1;

        num:= num div 10;
    
    end;

end;


var 
    num, cantDigitos, sumaDigitos, numAnt:integer;
begin
    cantDigitos:= 0;
    sumaDigitos:=0;

    write('Ingrese un numero entero: ');
    readln(num);
    numAnt:= num;
    while(num<>123456) do begin
        
        descomponerNum(num, cantDigitos, sumaDigitos);

        writeln('La cantidad de digitos IMPARES que posee el numero ', numAnt, ' es de: ', cantDigitos);
        writeln('La suma de los digitos PARES del numero ', numAnt, ' es de: ', sumaDigitos);
        
        numAnt:=0;
        cantDigitos:= 0;
        sumaDigitos:=0;
        
        write('Ingrese un numero entero: ');
        readln(num);
        numAnt:= num;
    end;
end.