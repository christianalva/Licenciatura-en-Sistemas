{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}

program Ej5;
var 
    num, primerNum, numMax:REAL;
    aux:INTEGER;
    
begin
    write('Ingrese un numero REAL');
    read(num);
    numMax:= num*2;
    primerNum:=num;
    aux:= 0;
    while((num<numMax) and (aux<10)) do begin
        write('Ingrese otro numero REAL');
        read(num);
        aux:=aux+1;
        
    end;
    if ((aux = 10) and (num<numMax)) then 
    begin
        writeln('No se ah ingresado el doble de ', primerNum);
    end;
end.
