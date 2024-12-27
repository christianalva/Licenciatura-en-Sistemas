program final;
const 
  dimF = 2000; 

type
  
  facturas = record 
    numFactura:integer;
    codCliente:integer;
    codSucursal:integer;
    montoTotal:real;
  end;
  
  vector = array[1..dimF] of facturas;
  
  
procedure cargarDatos(var v:vector; f:facturas; var dimL:integer;);// se dispone

procedure analizarDatos(v:vector; var codMax:integer; dimL:integer;);
var
  i, cant, cantMax :integer;
begin 
  cantMax:=0;
  cant:=1;
  for i:=1 to dimL-1 do begin 
    
    if(v[i].codSucursal = v[i+1].codSucursal) then begin 
      cant:=cant+1;
    end
    else begin 
      if(cant>cantMax) then begin 
        cantMax:=cant;
        codMax:=v[i].codSucursal;
      end
      cant:=1;
      
    end;
  
  end;

end;

var 
  f:facturas;
  v:vector;
  dimL, codMax:integer;
begin
  dimL:=0;
  codMax:=0;
  cargarDatos(v, f, dimL);
  analizarDatos(v, codMax, dimL);
  
  writeln('El codigo de sucursal con mayor cantidad de facturas es el: ', codMax);
end.
