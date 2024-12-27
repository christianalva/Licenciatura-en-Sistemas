{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in 
}

program ej2;
const 
  dimF=500;
type 
  vector=array[1..dimF] of string;


//A)Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
procedure leerNombres(var v:vector; var dimL:integer);
var 
  i:integer;
  nombre:string;
begin
  i:=1;
  
  write('Introduzca el nombre del alumno ', i, ': ');
  readln(nombre);
  
  while (i<dimF) and (nombre<>'zzz') do begin 
    v[i]:=nombre;
    i:=i+1;
    dimL:=dimL+1;
    
    
    write('Introduzca el nombre del alumno ', i, ': ');
    readln(nombre);
  end;
  
  writeln ('El vector posee: ', dimL, ' elementos');
end;


//C) Lea un nombre y lo inserte en la posición 4 del vector.
procedure incertarPos4(var v:vector; dimL:integer);
var 
    i, j, x:integer;
    nombre,nombreAnt:string;
begin 
    writeln('Ingrese un nombre para insertarlo en la posicion 4: ');
    readln(nombre);
    
    nombreAnt:=v[4];
    
    if(dimL<3) then begin
        writeln('El vector posee menos de 4 posiciones');
    end
    else
    begin
        for i:=1 to dimL do begin
            if(i=4) then begin 
                for j:=dimL downto 4 do begin 
                    v[j+1]:=v[j];
                end;
                v[i]:=nombre;
            dimL:=dimL+1
            end;
        end;
        writeln('los nombres quedan de la sigiente manera: ');
        for x:=1 to dimL do begin 
            writeln(x, '- ', v[x]);
        end;
    end;
    
    
end;



  
var 
  v:vector;
  dimL:integer;
begin 
  dimL:=0;
  
  
  leerNombres(v, dimL);
  incertarPos4(v, dimL);
end.