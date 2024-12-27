program ListaOrdenada;
type
  
  Lista = ^nodo;
  
  nodo = record 
    dato: integer;
    sig: Lista;
  end;
  
  
procedure insertarOrdenado(var l:Lista; n:integer);
var 
  nue, ant, act: lista;
begin 
  
  new(nue);
  nue^.dato:= n;
  ant:=l;
  act:=l;
  while(act<>nil) and (n>act^.dato) do begin 
    ant:=act;
    act:=act^.sig;
  end;
  if(act = ant) then 
    l:=nue
  else
    ant^.sig:=nue;
  nue^.sig:=act;

end;


  
procedure CargarListaOrdenada(var l:Lista);
var 
  ale : integer;
begin
  l:=nil;
  
  repeat
    
    ale := 100 + random(51);  // numero random entre 100 y 150
    if(ale<>120) then 
      insertarOrdenado(l, ale);
  
  until ale = 120;
  
end;

procedure imprimirLista(l:lista);
var 
  i:integer;
begin 
  i:=0;
  while (l<>nil) do begin
    writeln(i, '- el valor aleatorio es: ', l^.dato);
    i:= i + 1;
    l:=l^.sig;
  end;

end;

procedure BuscarElemento(l:lista; v:integer; var ok:boolean);
begin 
  
  while(l<>nil) do begin 
    if(l^.dato = v) then 
      ok := true;
    
    l:=l^.sig;
  end;

end;
  
var 
  l: Lista;
  valor: integer;
  ok: boolean;
begin 
  randomize; {Elige una semilla distinta cada vez que se ejecuta el programa.}
                {La semilla sirve para generar series de números aleatorios distintos.}
                {Sin la llamada al procedimiento randomize, en todas las ejecuciones
                 del programa se elige siempre la misma serie de números aleatorios.}
  ok:= false;

  CargarListaOrdenada(l);
  imprimirLista(l);
  
  writeln();
  write('Ingrese el valor a buscar en la lista: ');
  readln(valor);
  BuscarElemento(l, valor, ok);
  
  if(ok) then 
    writeln('El valor: ', valor, ' se encuentra en la lista ordenada.')
  else 
    writeln('El valor: ', valor, ' NO se encuentra en la lista ordenada.');
end.



