{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

}


program ej8_a;
var
    i: integer;
    monto, montoTotalMes, montoDia, diaDemcv, dia: real;
begin
  montoTotalMes:=0;
  montoDia:=0;
  diaDemcv:=0;
  dia:=0;
  
  for i := 1 to 3 do begin
    writeln('DIA ', i);
    repeat 
        write('Ingresar monto: ');
        readln(monto);
        
        montoDia:= montoDia+monto;
    until(monto = 0);
    writeln('La cantidad de venntas del dia ', i, ' es de: ', montoDia:0:0);
    montoTotalMes:= montoTotalMes+montoDia;
    if(montoDia>diaDemcv) then begin
        diaDemcv:=montoDia;
        dia:=i;
    end;
    montoDia:=0;
  end;
    
  writeln('El monto total acumulado en el mes es de: ', montoTotalMes:0:0);
  writeln('El día en el que se realizó la mayor cantidad de ventas fue el dia: ', dia:0:0);
end.

