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



procedure eliminarNombre(var v:vector; dimL:integer);
var 
  i, j, x:integer;
  nombre:string;
  noEncontrado:boolean;
begin 
  noEncontrado:=true;
  write('Que nombre desea eliminar? ');
  readln(nombre);
  
  while(noEncontrado=false) do begin 
    for i:=1 to dimL do begin 
      if(nombre=v[i]) then begin
        noEncontrado:=true;
    
        for j:=i to dimL do begin 
          v[j]:=v[j+1];
        end;
      end;
    end;
  
    if(noEncontrado) then begin 
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
  dimL:=1;
  
  
  leerNombres(v, dimL);
  eliminarNombre(v, dimL);
end.