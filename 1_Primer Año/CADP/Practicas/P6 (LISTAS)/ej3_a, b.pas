program ej3_puntoA;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

//agregar atras
procedure aregarAtras(var L, ult : lista; v: integer);
var
    nue : lista;
begin
    new(nue);           //creo un nodo
    nue^.num := v;      //cargo el dato
    nue^.sig := nil;    //inicializo el enlace en nil
    if(L=nil) then      //si la lista esta vacia
        L:=nue          //actualizo el inicio
    else                //si la lista no esta vacia
        ult^.sig:=nue;  //realizo el enlace con el ultimo
    ult:=nue;           //actualizo el ultimo
end;


//cargo la lista
procedure cargarLista(var l:lista);
var
    valor : integer;
    ult:lista;
begin
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        aregarAtras(l, ult, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
end;


//imprimir lista
procedure imprimirLista(l:lista);
begin 
    
    while (l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;

end;

var
    pri : lista;
    
begin
    pri := nil;
    
    cargarLista(pri);
    imprimirLista(pri);
    
    
end.