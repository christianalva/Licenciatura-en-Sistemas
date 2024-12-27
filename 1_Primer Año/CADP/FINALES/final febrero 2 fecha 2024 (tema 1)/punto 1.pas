//una emopresa dispone de una estructura de datos con los clientes de su comercio (a lo sumo 500), de cada cliente se conoce el numero de cliente, numero de DNI, y monto que paga. se pide implementar un programa que informe la cantidad de clientes cuyo numero de DNI es capicua (es igual leerlo de izquierda a derecha q de derecha a izquierda)


program final;
const
  dimF=2;
type
  clientes = record 
    numCliente:integer;
    numDni:integer;
    monto:real;
  end;
  
  vector=array[1..dimF] of clientes;

procedure cargarDatos(var v:vector; var dimL:integer);
var
  i:integer;
begin   
  
  for i:=1 to dimF do begin
    write('Ingrese el numero de cliente: ');
    readln(v[i].numCliente);
    write('Ingrese el numero de DNI: ');
    readln(v[i].numDni);
    write('Ingrese monto: ');
    readln(v[i].monto);
    dimL:=dimL+1;
  end;
end;



procedure procesarDatos(v:vector; dimL:integer);
var
  i, num, numOriginal, dig, capicua, nuevo:integer;
begin 
  capicua:=0;
  for i:=1 to dimL do begin
    nuevo:=0;
    num:=v[i].numDni;
    numOriginal:=num;
    
    while(num<>0) do begin
      dig:=num mod 10;
      nuevo:=nuevo*10 + dig;// aca iria almacenando el numero dado vuelta
      num:=num div 10;
    end;
    
    if(numOriginal = nuevo) then 
      capicua:=capicua+1;
    
  end;
  
  writeln('La cantidad de numeros de dni apicuas es de: ', capicua);
end;


var
  v:vector;
  c:clientes;
  dimL:integer;
begin 
  dimL:=0;
  cargarDatos(v, dimL);
  procesarDatos(v, dimL);
end.




