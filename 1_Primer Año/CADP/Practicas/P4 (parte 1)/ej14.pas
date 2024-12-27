program ej14;
type
    participantes = record
        pais:string;
        codProyect:integer;
        nombreProyect:string;
        rol:integer;
        cantHoras:integer;
        end;
    
    vector=array[1..1000] of participantes;

//Le pido al usuario que rellene el vector y sumo su dimencion logica 
procedure leerPart(var v:vector; var dimL:integer);
var
    i:integer;
begin 
    i:=1;
    dimL:=1;
    writeln();
    writeln('Desarrollador: ', i);
    write('Ingrese su pais: ');
    readln(v[i].pais);
    write('Ingrese el codigo del proyecto (1 a 1000): ');
    readln(v[i].codProyect);
    write('Ingrese el nombre del proyecto en el que participo: ');
    readln(v[i].nombreProyect);
    write('Ingrese el rol que cumplio en dicho proyecto (del 1 al 5): ');
    readln(v[i].rol);
    write('Ingrese la cantidad de horas trabajadas: ');
    readln(v[i].cantHoras);
    
    while(v[i].codProyect<>-1) do begin 
        
        i:=i+1;
        dimL:=dimL+1;
        
        
        writeln();
        writeln('Desarrollador: ', i);
        write('Ingrese su pais: ');
        readln(v[i].pais);
        write('Ingrese el codigo del proyecto: ');
        readln(v[i].codProyect);
        if (v[i].codProyect=-1)then 
            break;
        write('Ingrese el nombre del proyecto en el que participo: ');
        readln(v[i].nombreProyect);
        write('Ingrese el rol que cumplio en dicho proyecto (del 1 al 5): ');
        readln(v[i].rol);
        write('Ingrese la cantidad de horas trabajadas: ');
        readln(v[i].cantHoras);
    end;
end;


procedure sueldosPorRol(var vs:vector; i, dimL:integer; var precioHora:real);
begin 

    if(vs[i].rol=1)then begin
        precioHora:=vs[i].cantHoras*35.20;
    end
    else if(vs[i].rol=2) then begin
        precioHora:=vs[i].cantHoras*27.45;
    end
    else if(vs[i].rol=3) then begin 
        precioHora:=vs[i].cantHoras*31.03;
    end
    else if(vs[i].rol=4) then begin 
        precioHora:=vs[i].cantHoras*44.28;
    end
    else if(vs[i].rol=5) then begin 
        precioHora:=vs[i].cantHoras*39.87;
    end;
        
end;

//A) El monto total invertido en desarrolladores con residencia en Argentina
procedure DesaArgentina( var v:vector; dimL:integer; var montoArg:real);
var 
    i:integer;
    precioH:real;
begin 
    precioH:=0;
    for i:=1 to dimL do begin 
        if(v[i].pais='argentina') then begin
            sueldosPorRol(v, i, dimL, precioH);
            montoArg:=montoArg+precioH;
        end;
        precioH:=0;
    end;

end;

//B) aministrrador de bases de datos
procedure cantAbdd(var v:vector; var dimL, horasTrabajoAdbd:integer);
var 
    i:integer;
    
begin 
    
    for i:=1 to dimL do begin 
        if(v[i].rol=3) then begin 
            horasTrabajoAdbd:=horasTrabajoAdbd+v[i].cantHoras;
        end;
    end;
end;


//C) El código del proyecto con menor monto invertido
procedure menorMonto(var v:vector; var dimL, codMenorMonto:integer; var min:real);
var
    i:integer;
    ph:real;
begin
    ph:=0;
    for i:=1 to dimL do begin 
        sueldosPorRol(v, i, dimL, ph);
        if(ph<min) then begin 
            min:=ph;
            codMenorMonto:=v[i].codProyect;
            
        end;
    end;
end;


//D)
procedure arquitectosDSoftware(var v:vector; dimL:integer);
var
    i, cantAds:integer;
begin 
    cantAds:=0;
    for i:=1 to dimL do begin 
        if(v[i].rol=4) then  
            cantAds:=cantAds+1;
        writeln('la cantidad de Arquitectos de software del proyecto: ', i, ' es de: ', cantAds);
        cantAds:=0;
    end;
end;

//PROGRAMA PRINCIPAL
var
    v:vector;
    p:participantes;
    dimL, horasTrabajoAdbd, codMenorMonto:integer;
    montoArg, min:real;
begin 
    dimL:=0;
    montoArg:=0;
    horasTrabajoAdbd:=0;
    codMenorMonto:=0;
    min:=99999;
    
    leerPart(v, dimL);
    DesaArgentina(v, dimL, montoArg);
    cantAbdd(v, dimL, horasTrabajoAdbd);
    menorMonto(v, dimL, codMenorMonto, min);
    
    writeln();
    writeln('El monto total invertido en desarolladores con residencia en Argentina es de: ', montoArg:2:2);
    writeln();
    writeln('a cantidad total de horas trabajadas por Administradores de bases de datos es de: ', horasTrabajoAdbd);
    writeln();
    writeln('El código del proyecto con menor monto invertido es el: ', codMenorMonto);
    writeln();
    arquitectosDSoftware(v, dimL);
end.