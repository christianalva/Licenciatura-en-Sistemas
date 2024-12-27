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
    sueldos=array[1..5] of real;

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
        write('Ingrese el nombre del proyecto en el que participo: ');
        readln(v[i].nombreProyect);
        write('Ingrese el rol que cumplio en dicho proyecto (del 1 al 5): ');
        readln(v[i].rol);
        write('Ingrese la cantidad de horas trabajadas: ');
        readln(v[i].cantHoras);
    end;
end;

procedure llenarSueldos(var vs:sueldos);
var 
    i:integer;
begin 
    
end;

procedure DesaArgentina( var v:vector; var dimL:integer; var montoArg:real);
var 
    i:intreger;
    precioHora:real;
begin 
    precioHora:=0;
    
    
    for i:=1 to dimL do begin 
        if(v[i].pais='argentina') then begin
            if(v[i].rol=1)then begin
                precioHora:=v[i].cantHoras*35.20;
            end
            else if(v[i].rol=2) then begin
                precioHora:=v[i].cantHoras*27.45;
            end
            else if(v[i].rol=3) then begin 
                precioHora:=v[i].cantHoras*31.03;
            end
            else if(v[i].rol=4) then begin 
                precioHora:=v[i].cantHoras*44.28;
            end
            else if(v[i].rol=5) then begin 
                precioHora:=v[i].cantHoras*39.87;
            end;
            montoArg:=montoArg+precioHora;
        end;
        precioHora:=0;
    end;

end;
//aministrrador de bases de datos
procedure cantAbd()

var
    v:vector;
    p:participantes;
    dimL:integer;
    montoArg:real;
begin 
    dimL:=0;
    montoArg:=0;
    
    
    
    leerPart(v, dimL);


end.