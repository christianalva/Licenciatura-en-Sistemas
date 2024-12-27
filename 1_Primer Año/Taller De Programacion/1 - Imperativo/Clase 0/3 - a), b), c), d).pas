program listas;
type

  lista = ^nodo;
  
  nodo = record 
    dato:integer;
    sig:lista;
  end;
  
  
// A
procedure cargarLista(var l:lista);
var 
  nue: lista;
  ale: integer;
begin 
  
  l:= nil;
  
  repeat 
    ale :=  100 + random(51); // numero entre 100 y 150
    
    if (ale <> 120) then begin
      new(nue);
      nue^.dato:=ale;
      nue^.sig:=l;
      l:=nue;
    end;
  
  until ale = 120;


end;

//B
procedure imprimirLista(l:lista);
begin 
  
  while (l<>nil) do begin 
    writeln('El numero aleatorio es: ', l^.dato);
    
    l:=l^.sig;
  end;

end;


procedure buscarElemento(l:lista; valor:integer; var ok:boolean);
begin 

  while (l<>nil) do begin 
    if(valor = l^.dato) then 
      ok:=true;
    l:=l^.sig;
  end;

end;

var 
  l:lista;
  valor:integer;
  ok: boolean;
begin 
  
  cargarLista(l);
  imprimirLista(l);
  writeln();
  write('Ingrese un valor a buscar entre 100 y 150: ');
  readln(valor);
  
  buscarElemento(l, valor, ok);
  
  if(ok) then 
    writeln('El valor ', valor, ' se encuentra en la lista.')
  else 
   writeln('El valor ', valor, ' NO se encuentra en la lista.');

end.


  
  