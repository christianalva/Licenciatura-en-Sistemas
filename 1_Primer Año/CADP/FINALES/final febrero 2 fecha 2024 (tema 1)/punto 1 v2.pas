//una emopresa dispone de una estructura de datos con los clientes de su comercio (a lo sumo 500), de cada cliente se conoce el numero de cliente, numero de DNI, y monto que paga. se pide implementar un programa que informe la cantidad de clientes cuyo numero de DNI es capicua (es igual leerlo de izquierda a derecha q de derecha a izquierda)

program final;
const 
  dimF = 500;
type
  clientes = record 
    numCliente:integer;
    numDNI:integer;
    monto:real;
  end;
  
  vector = array[1..dimF] of clientes;

procedure cargarDatos(var v:vector; c:clientes; var dimL:integer);// se dispone 


procedure analizarDatos(v:vector; dimL:integer);
var 
  i, num, dig, numOriginal, numAlrevez, cant:integer;
begin 
  cant:=0;
  
  for i:=1 to dimL do begin 
    numAlrevez:=0;
    numOriginal:=v[i].numDNI;
    num:=numOriginal;
    while(num<>0) do begin 
      dig:=num div 10;
      numAlrevez:= (numAlrevez * 10) + dig;
      num:=num div 10;
    end;
    
    if(numOriginal = numAlrevez) then begin
      cant:=cant+1;
    end;
    
  end;
  
  writeln('La cantidad de clientes con numero de dni capicua es de: ', cant);

end;


var 
  v:vector;
  c:clientes;
  dimL:integer;
begin 
  dimL:=0;
  cargarDatos(v, c, dimL);
  analizarDatos(v, dimL);
end.
























