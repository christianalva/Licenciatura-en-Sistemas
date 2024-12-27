{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program Ej4;
var 
    num:REAL;
    numMax: REAL;
begin
    write('Ingrese un numero REAL');
    read(num);
    numMax:= num*2;
    while(num<numMax) do begin
        write('Ingrese otro numero REAL');
        read(num);
    end
end.

