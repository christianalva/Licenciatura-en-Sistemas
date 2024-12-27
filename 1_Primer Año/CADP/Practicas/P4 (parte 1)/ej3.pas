program ej3;
const
    cantVector=10;
type
    vectorEnteros=array[1..cantVector] of integer;
    
    
procedure cargarVector(var v:vectorEnteros; var dimL:integer);    
var
    num:integer;
begin 
    write('Ingresar un numero: ');
    readln(num);
    while(num<>0) and (dimL<cantVector) do begin
        
        v[dimL] := num;
        dimL:=dimL+1;
        
        write('Ingresar otro numero: ');
        readln(num);
    end;
end;

// Realizar un módulo que imprima el vector desde la primera posición hasta la última
procedure imprimirVectorA(var v:vectorEnteros; var dimL:integer);
var 
    i:integer;
begin
    writeln('');
    writeln('Imprimo el vector desde la primera posicion hasta la ultima: ');
    for i:=1 to dimL do begin
        
        writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
    end;

end;

// Realizar un módulo que imprima el vector desde la última posición hasta la primera.
procedure imprimirVectorB(var v:vectorEnteros; var dimL:integer);
var 
    i, x:integer;
begin
    x:=1;
    writeln('');
    writeln('Imprimo el vector desde la ultima posicion hasta la primera: ');
    for i:=dimL downto x do begin
        
        writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
        
    
    end;

end;

//Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la mitad más uno hacia la última posición.
procedure imprimirVectorC(var v:vectorEnteros; var dimL:integer);
var 
    i, x:integer;
begin
    x:=1;
    writeln('');
    writeln('Imprimo el vector desde la mitad hasta el primer numero y luego desde la mitasd mas 1 hasta la ultima: ');
    for i:=(dimL div 2) downto x do begin
        writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
    end;
    
    for i:=((dimL div 2)+1) to dimL do begin
        writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
    end;
end;

//Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
//posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
//que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
procedure imprimirVectorD(var v:vectorEnteros; var dimL:integer);
var 
    i, y, x:integer;
begin
    writeln('');
    writeln('Imprimo el vector desde la posicion que yo le pase: ');
    write('Ingrese el valor de la variabler X: ');
    readln(x);
    write('Ingrese el valor de la variable Y: ');
    readln(y);
    
    
    if(x<y) then begin 
        for i:=x to y do begin
            writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
        end;
    end
    else 
        for i:=x downto y do begin
            writeln('El numero: ', v[i], ' pertenece a la posicion [', i, ']');
        end;
end;



var 
    vector:vectorEnteros;
    dimLogica, dimFisica:integer;

begin 
    dimFisica:=0;
    dimLogica:=0;
    
    cargarVector(vector, dimLogica);
    imprimirVectorA(vector, dimLogica);
    imprimirVectorB(vector, dimLogica);
    imprimirVectorC(vector, dimLogica);
    imprimirVectorD(vector, dimLogica);
end.
