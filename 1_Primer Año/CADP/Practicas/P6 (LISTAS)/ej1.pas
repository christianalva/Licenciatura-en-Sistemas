program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;


procedure imprimirLista(l:lista);
begin 
    
    while (l <> nil) do begin
        writeln(l^.num);
        l:= l^.sig;
    end;

end;

procedure incrementarLista(l:lista);
var 
    incre:integer;
begin   
    write('Ingrese un valor para incrementar todos los elementos de lam lista: ');
    read(incre);
    writeln('los elementos de la lista incrementados en: ', incre, ' quedan de la sigiente manera: ');
    while (l<>nil) do  begin
        l^.num:=l^.num+incre;
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
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    //C
    imprimirLista(pri);
    //D
    incrementarLista(pri);
    imprimirLista(pri);
    
end.

//A) el programa guarda los numeros que yo le introduzco y luego me los muestra del ultimo ingresado al primero
//B) queda conformada de la sigiente manera: 0, 48, 13, 21, 10