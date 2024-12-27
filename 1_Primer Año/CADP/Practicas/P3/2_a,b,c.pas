program ej2;
//inciso A
type
    dias=1..31;
    meses=1..12;
    anios=2019..2020;
    
    fecha=record
    
        dia:dias;
        mes:meses;
        anio:anios;
    end;
    
//inciso B
procedure Leerfecha(var fe:fecha; var primerosMeses, primeros10dias, casamientos:integer);
begin
    
    while(fe.anio<>2020) do begin
    
        write('Ingrese el dia: ');
        readln(fe.dia);
        write('Ingrese mes: ');
        readln(fe.mes);
        write('Ingrese el año: ');
        readln(fe.anio);
        
        //Inciso C
        if(fe.anio=2019) then begin
            casamientos:=casamientos+1;
            if((fe.mes=1) or (fe.mes = 2) or (fe.mes = 3)) then begin
                primerosMeses := primerosMeses + 1;
            end;
            
            if(fe.dia<11) then begin
                primeros10dias:= primeros10dias + 1;
            end;
            
        end;
    
   
    end;

end;


var 
    f:fecha;
    primerosMeses, primeros10dias, casamientos:integer;
begin 
    
    primeros10dias:=0;
    primerosMeses:=0;
    casamientos:=0;
    
    Leerfecha(f, primerosMeses, primeros10dias, casamientos);
    
    writeln('La cantidad de casamientos en el 2019 es de: ', casamientos);
    writeln('La cantidad de casamientos realizados en los primeros 3 meses (enero, febrero y marzo) es de: ', primerosMeses);
    writeln('La cantidad de casamientos realizados en los primeros 10 dias de cada mes es de: ', primeros10dias);
end.