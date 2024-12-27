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
  
  write('Introduzca el nombre del añumno ', i, ': ');
  readln(nombre);
  
  while (i<dimF) and (nombre<>'zzz') do begin 
    v[i]:=nombre;
    i:=i+1;
    dimL:=dimL+1;
    
    
    write('Introduzca el nombre del añumno ', i, ': ');
    readln(nombre);
  end;
  
  writeln ('El vector posee: ', dimL, ' elementos');
end;


//B)Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector
procedure eliminarNombre(var v:vector; dimL:integer);
var 
  i, j, x:integer;
  nombre:string;
  noEncontrado:boolean;
begin 
  noEncontrado:=false;
  write('Que nombre desea eliminar? ');
  readln(nombre);
  
  while(noEncontrado=false) do begin 
    for i:=1 to dimL do begin 
      if(nombre=v[i]) then begin
        noEncontrado:=true;
    
        for j:=i to dimL-1 do begin 
          v[j]:=v[j+1];
        end;
        dimL:=dimL-1;
      end;
    end;
  
    if(noEncontrado=false) then begin 
      writeln('No se ah encontrado el nombre.');
      writeln('Introduzca otro nombre a eliminar: ');
      readln(nombre);
    end;
  end;
  writeln('El vector con los nombres eliminados queda de la sigiente manera: ');
  for x:=1 to dimL do begin 
    writeln(x, '- ', v[x]);
  end;
end;



var 
  v:vector;
  dimL:integer;
begin 
  dimL:=0;
  
  
  leerNombres(v, dimL);
  eliminarNombre(v, dimL);
end.