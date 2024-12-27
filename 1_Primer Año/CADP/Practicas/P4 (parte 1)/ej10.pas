program ej10;
const
    dimF=2;
type
    vector = array[1..dimF] of real;


procedure cargarVector(var v:vector; var dimL, cantEmpleados:integer; var sueldoTotal:real);
var 
    i:integer;
begin 
    i:=1;
    write('Ingrese el salario de del empleado ', i, ': ');
    readln(v[i]);
    
    while(v[i]<>0) and (i<dimF) do begin 
        i:=i+1;
        dimL:=dimL+1;
        sueldoTotal:=sueldoTotal+v[i];
        cantEmpleados:=cantEmpleados+1;
        write('Ingrese el salario de del empleado: ', i, ': ');
        readln(v[i]);
        
    end;
end;


procedure incrementarSalario(var v:vector; dimL:integer; var procAument, sueldoTotalConAument:real);
var 
    i:integer;
begin 
    for i:=1 to dimL do begin
        writeln('EMPLEADO: ', i);
        writeln('Salario anterior ',v[i]:0:2);
        procAument:=v[i]*0.15;
        v[i]:=procAument+v[i];
        sueldoTotalConAument:=sueldoTotalConAument+v[i];
        writeln('Salario nuevo ',v[i]:0:2);
        writeln;
    end;
end;


var 
    v:vector;
    dimL, cantEmpleados:integer;
    procAument, promTotal, sueldoTotal, promAument15, sueldoTotalConAument:real;
begin 
    dimL:=1;
    procAument:=0;
    promTotal:=0;
    sueldoTotal:=0;
    cantEmpleados:=1;
    sueldoTotalConAument:=0;
    promAument15:=0;
    
    cargarVector(v, dimL, cantEmpleados, sueldoTotal);
    incrementarSalario(v, dimL, procAument, sueldoTotalConAument);
    promTotal:=(sueldoTotal/cantEmpleados);
    promAument15:= (sueldoTotalConAument/cantEmpleados);
    writeln('Para los ',cantEmpleados,' empleados el sueldo promedio sin aumento del 15% es ',promTotal:0:2);
    writeln('Para los ',cantEmpleados,' empleados el sueldo promedio con aumento del 15% es ',promAument15:0:2);
end.