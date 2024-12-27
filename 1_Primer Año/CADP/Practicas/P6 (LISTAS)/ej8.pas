program ej8;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodoOrdenado(var L: lista; v: integer);
var
    nue:lista;
    act, ant : lista; //punteros auxiliares
begin
    new(nue);       //creo el nodo a insertar
    nue^.num:=v;    //creo el nodo a insertar
    act:=L;         //creo el nodo a insertar
    ant:=L;         //creo el nodo a insertar
    
    while(act<>nil) and (v < act^.num) do begin //busco la posicion para incertar el nodo creado
        ant:=act;                               //busco la posicion para incertar el nodo creado
        act:=act^.sig;                          //busco la posicion para incertar el nodo creado
    end;
    
    if(act = ant) then //al inicio de la lista vacia    // realizo los enlaces
        L:=nue                                          // realizo los enlaces
    else               // al medio o al final           // realizo los enlaces
        ant^.sig:=nue;                                  // realizo los enlaces
    nue^.sig:=act;                                      // realizo los enlaces
end;


procedure imprimirLista(l:lista);
begin 
    
    while (l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;

end;


var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodoOrdenado(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
  
    imprimirLista(pri);
    
    
end.