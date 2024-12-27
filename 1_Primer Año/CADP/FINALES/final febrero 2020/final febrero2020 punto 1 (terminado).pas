//la facultad de informatica organiza el congreso WICC, en donde se expondran trabajos de investigacion. Realizar un programa que lea ;a informacion de cada publicacion: titulo de la publicacion, nombre del autor, dni del autor, y tipo de publicacion(1..12). La lectura de publicaciones finaliza al ingresar un dni de autor con valor 0 que ((no debe procesarce). La informacion se lee ordenada por DNI del autor y un autor puede tener varias publicaciones : se pide escribir un programa que: 
//a) informe el tipo de publicacion con mayor cantidad de publicaciones
//b) informar para cada autor la cantidad de publicaciones presentadas.

program uno;
const
  max=12;
type
  
  
  publicaciones=record 
    cant:integer;
  end;
  vector=array[1..max] of publicaciones;
  
  informacion=record 
    titulo:string;
    nombreA:string;
    DNI:integer;
  end;
  
  lista=^nodo;
  
  nodo=record
    dato:informacion;
    sig:lista;
  end;
  
  
  
  
procedure inicializarVector(var v:vector);
var
  i:integer;
begin 
  for i:=1 to max do begin 
    v[i].cant:=0;
  end;
end;
  
procedure leerDatos(var i:informacion; var v:vector);
var
  publi, x:integer;
begin 

  readln(i.titulo);
  readln(i.nombreA);
  readln(i.DNI);
  readln(publi);
  
  for x:= 1 to max do begin 
    if(publi = x) then 
      v[x].cant:=v[x].cant+1;
  end;
  
end;

procedure agregarOrdenadoDni(var l:lista; i:informacion);
var
  nue,act,ant:lista;
begin 
  //creo el nodo a insertar
  new(nue);
  nue^.dato:=i;
  act:=l;
  ant:=l;
  
  //busco la posicion para insertar el nodo creado
  while(act<>nil) and (i.DNI>act^.dato.DNI) do begin
    ant:=act;
    act:=act^.sig;
  end;
  
  //realiza los enlaces
  if(act=ant) then
    l:=nue //al inicio o lista vacia
  else //AL MEDIO O AL FINAL
    ant^.sig:=nue;  
  nue^.sig:=act;
  
end;



procedure agregarDatos(var l:lista; var v:vector; var i:informacion);
var
 x:integer;
begin 
  l:=nil;
  x:=1;
  writeln('Publicacion ', x);
  leerDatos(i, v);
  while(i.DNI<>0) do begin 
    agregarOrdenadoDni(l, i);
    x:=x+1;
    writeln('Publicacion ', x);
    leerDatos(i, v);
  end;
end;

procedure imprimir(var l:lista);
var 
  i:integer;
begin 
  i:=1;
  while(l<>nil) do begin
    write('Datos Publicacion ', i);
    write(l^.dato.titulo);
    write(l^.dato.nombreA);
    write(l^.dato.DNI);
    
    i:=i+1;
    
    writeln();
    l:=l^.sig;
  end;
end;


procedure recorrerLista(var l: lista; var v: vector);
var
  mayorCant, x, DNIaux, cantXAutor, publiMayorCant: integer;
begin
  mayorCant := 0;
  publiMayorCant:=0;
  while (l <> nil) do begin
    DNIaux := l^.dato.DNI;
    cantXAutor := 0;

    while (l <> nil) and (DNIaux = l^.dato.DNI) do
    begin
      cantXAutor := cantXAutor + 1;
      l := l^.sig;
    end;

    writeln('Cantidad de publicaciones por autor con DNI ', DNIaux, ': ', cantXAutor);

    for x := 1 to max do
    begin
      if (v[x].cant > mayorCant) then begin
        mayorCant := v[x].cant;
        publiMayorCant:=x;
      end;
    end;
  end;

  writeln('El tipo de publicacion con mayor cantidad de publicaciones es: ', publiMayorCant);
end;


var
  l:lista;
  i:informacion;
  v:vector;
begin 
  agregarDatos(l , v, i);
  recorrerLista(l, v);
  imprimir(l);
end.