{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program ej8;
var
    i: integer;
    monto, montoTotalMes, montoDia: real;
begin
  montoTotalMes:=0;
  montoDia:=0;
  
  for i := 1 to 3 do begin
    writeln('DIA ', i);
    repeat 
        write('Ingresar monto: ');
        readln(monto);
        
        montoDia:= montoDia+monto;
    until(monto = 0);
    writeln('La cantidad de venntas del dia ', i, ' es de: ', montoDia:0:0);
    montoTotalMes:= montoTotalMes+montoDia;
    montoDia:=0;
  end;
    
  writeln('El monto total acumulado en el mes es de: ', montoTotalMes:0:0);
end.

