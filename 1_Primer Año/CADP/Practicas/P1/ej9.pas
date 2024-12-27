{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program Ej8;
var 
    opc: char;
    num, numAnterior, aux: integer;
begin
    numAnterior := 0;
    num:= 0;
    aux:=0;
    
    writeln('Ingrese la operacion a realizar (+ o -)');
    read(opc);
    
    if(opc = '+') then
    begin
        writeln('Ingrese un numero');
        read(num);
        while(num<>0) do begin
            numAnterior := numAnterior + num;
            num:= 0;
            
            writeln('Ingrese un nuevo numero');
            read(num);
        end;
        writeln('El resultado de la operacion es de: ', numAnterior);
    end
    else if( opc = '-') then
    begin 
        writeln('Ingrese un numero');
        read(num);
         
        while((num<>0)) do begin
            if(aux=0) then
            begin
                numAnterior := num;
                num:=0;
                aux:=1;
            end;
            
            numAnterior := numAnterior - num;
            num:= 0;
            aux:=aux+1;

            writeln('Ingrese un nuevo numero');
            readln(num);
            
        end;
        writeln('El resultado de la operacion es de: ', numAnterior);
    end
    else 
    begin
        writeln('Ah seleccionado una operacion incorecta');
    end;
  
end.

