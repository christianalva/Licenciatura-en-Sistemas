//la facultad de informatica organiza el congreso WICC, en donde se expondran trabajos de investigacion. Realizar un programa que lea ;a informacion de cada publicacion: titulo de la publicacion, nombre del autor, dni del autor, y tipo de publicacion(1..12). La lectura de publicaciones finaliza al ingresar un dni de autor con valor 0 que ((no debe procesarce). La informacion se lee ordenada por DNI del autor y un autor puede tener varias publicaciones : se pide escribir un programa que: 
//a) informe el tipo de publicacion con mayor cantidad de publicaciones
//b) informar para cada autor la cantidad de publicaciones presentadas.


program final;
type
  publicaciones = record 
    titulo:string;
    nombreAutor:string;
    dniAutor:integer;
    tipoPublicacion:1..12;
  end;

  lista = ^nodo;
  
  nodo = record 
    dato:publicaciones;
    sig:lista;
  end;
  
  vectorPublicaciones = array[1..12] of integer;

procedure inicializarVector(var vp:vectorPublicaciones);
var
 i:integer;
begin 
  for i:=1 to 12 do begin 
    vp[i]:=0;
  end;
end;

procedure leerDatos(var p:publicaciones)
begin
  
  readln(p.dniAutor);
  if(p.dniAutor<>0) then begin
    readln(p.titulo);
    readln(p.nombreAutor);
    readln(p.tipoPublicacion);
  end;
end;

procedure agregarOrdenado(var l:lista; p:publicaciones);
var
  nue, ant, act:lista;
begin 
  new(nue);
  nue^.dato:=p;
  act:=l;
  ant:=l;
  while(act<>nil) and (p.dniAutor > act^.dato.dniAutor) do begin 
    ant:=act;
    act:=act^.sig;
  end;
  
  if(act = ant) then 
    l:=nue;
  else 
    ant^.sig;=nue;
  nue^.sig:=act;
end;
  
procedure cargarDatos(var l:lista; p:publicaciones);
begin
  leerDatos(p);
  while(p.dniAutor<>0) do begin
    agregarOrdenado(l, p);
    leerDatos(p);
  end;

end;

procedure analizarDatos(l:lista; var v:vectorPublicaciones);
var 
  i, cantPubli, tipoPubli, cantXautor:integer;
  sig:lista;
begin 
  cantPubli:=0;
  tipoPubli:=0;
  cantXautor:=1;
  while(l<>nil) do begin 
    sig:=l^.sig;
    if(l^.dato.dniAutor = sig^.dato.dniAutor ) and (sig<>nil) then
      cantXautor:=cantXautor+1;
    else begin
      writeln('El autor con dni: ', l^.dato.dniAutor, ' tinene un total de: ', cantXautor, ' publicaciones presentadas.');
      cantXautor:=1;
    end;
    
    
    v[l^.dato.tipoPublicacion]:=v[l^.dato.tipoPublicacion]+1;
    
    l:=l^.sig;
  end;
  
  
  for i:=1 to 12 do begin 
    if(cantPubli<v[i]) then begin  
      cantPubli:=v[i];
      tipoPubli:=i;
    end;
  end;
  
  
  writeln('El tipo de publicacion con mayor publicaciones es: ' tipoPubli, ' con un total de: ', cantPubli, ' publicaciones ');
end;

var 
  l:lista;
  v:vectorPublicaciones
  p:publicaciones;

begin 
  l:=nil;
  
  inicializarVector(v);
  cargarDatos(l, p);
  analizarDatos(l, v);

end.

