program ej7_a;

procedure descomponerNum(num:integer; var cantDigitos, sumaDigitos:integer);
var 
    digito:integer;
begin

    digito:=0;    
    while(num<>0) do begin
    
        digito:= num mod 10;
        cantDigitos:= cantDigitos+1;
        sumaDigitos:= sumaDigitos+digito;
        
        num:= num div 10;
    
    end;

end;


var 
    num, cantDigitos, sumaDigitos, numAnt:integer;
begin
    cantDigitos:= 0;
    sumaDigitos:=0;


    repeat
        numAnt:=0;
        cantDigitos:= 0;
        sumaDigitos:=0;
        write('Ingrese un numero entero: ');
        readln(num);
        numAnt:= num;
    
        descomponerNum(num, cantDigitos, sumaDigitos);

        writeln('La cantidad de digitos que posee el numero ', numAnt, ' es de: ', cantDigitos);
        writeln('La suma de todos los digitos del numero ', numAnt, ' es de: ', sumaDigitos);
        
    until sumaDigitos = 10
end.