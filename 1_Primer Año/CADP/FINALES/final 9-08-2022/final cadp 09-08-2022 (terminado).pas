//se dispone de la informacion de los participantes inscriptos a una carrera (a lo sumo 5000),  de cada participante se tiene dni, nombre y apellido, categoria (1..5) y fecha de inscripcion, se pide implementar un programa que guarde en una estructura adecuada los participantes  de aquellas categorias que posean a lo sumo 50 inscriptos. Se sabe que cada participante se puede anotar en una sola categoria

program ej;
const 
  inscripMax=5;//5000
  catMax=5;
type

  categorias=record
    cantInscript:integer;
  end;
  
  vector=array[1..5] of categorias;
  
  participantes=record
    DNI:integer;
    nombre:string;
    apellido:string;
    categoria:1..catMax;
    dia:integer;
    mes:1..12;
    anio:1999..2024;
  end;

  lista=^nodo;
  
  nodo=record
    dato:participantes;
    sig:lista;
  end;
  
procedure inicializarVector(var v:vector);
var
  i:integer;
begin 
  for i:=1 to 5 do begin 
    v[i].cantInscript:=0;
  end;
end;

procedure leerDatos(var p:participantes; var v:vector);
begin 
  readln(p.DNI);
  if(p.DNI<>0) then begin
    readln(p.nombre);
    readln(p.apellido);
    readln(p.categoria);
    v[p.categoria].cantInscript:=v[p.categoria].cantInscript+1;
    readln(p.dia);
    readln(p.mes);
    readln(p.anio);
  end;
end;
  

procedure agregarAdelante(var l:lista; p:participantes);
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=p;
  nue^.sig:=l;
  l:=nue;
end;
  

procedure agregarDatos(var l:lista; var p:participantes; var v:vector);
begin 
  l:=nil;
  leerDatos(p, v);
  while(p.DNI<>0) do begin 
    agregarAdelante(l, p);
    leerDatos(p, v);
  end;
end;


procedure agregarNuevo(var l2:lista; var p:participantes);// se van a agregar los participantes de las categorias que cumplan las condiciones 
var
  nue:lista;
begin 
  new(nue);
  nue^.dato:=p;
  nue^.sig:=l2;
  l2:=nue;

end;


procedure recorrerLista(var l:lista; var l2:lista; x:integer);
begin 
  while(l<>nil) do begin 
    if(l^.dato.categoria = x) then 
      agregarNuevo(l2, l^.dato);
    l:=l^.sig;
  end;
end;


procedure imprimir(var l2:lista ; x:integer);
begin 
  writeln('Tanda ', x);
  while(l2<>nil) do begin 
    writeln(l2^.dato.DNI);
    writeln(l2^.dato.nombre);
    writeln(l2^.dato.apellido);
    writeln(l2^.dato.categoria);
    writeln(l2^.dato.dia);
    writeln(l2^.dato.mes);
    writeln(l2^.dato.anio);
    
    l2:=l2^.sig;
  end;

end;

var
  l, l2:lista;
  v:vector;
  p:participantes;
  x:integer;
begin 
  inicializarVector(v);
  agregarDatos(l, p, v);
  
  
  
  //faltaria tambien un l2:=nil
  for x:= 1 to 5 do begin 
    if (v[x].cantInscript>=2) then begin//50 seria aca, por los 50 inscriptos
      recorrerLista(l, l2, x);
      imprimir(l2, x); // este imprimir esta mal 
    end;
  end;
  

end.