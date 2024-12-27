program ej9;
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

//A)
procedure listaOrdenada(l:lista);
var
    aux:lista;
    ordenado:boolean;
begin
    aux:=l;
    ordenado:=true;
    
    while(l<>nil) and (ordenado) and (aux^.sig<>nil) do begin 
        if(aux^.num<aux^.sig^.num) then begin 
            ordenado:=false;
        end;
        
        aux:=aux^.sig;
    end;
    
    writeln;
    if(ordenado) then 
        writeln('La lista esta ordenada.')
    else
        writeln('La lista no esta ordenada.');
    
end;

//B)
procedure EliminarValor(l:lista);
var
    act,ant:lista;
    num:integer;
    encontrado:boolean;
begin
    act:=l;
    ant:=nil;
    encontrado:=false;
    
    writeln;
    write('Ingrese un valor de la lista a eliminar: ');
    readln(num);
    
    while(act<>nil)do begin 
        if (num=act^.num) then begin 
            if(ant = nil) then 
                l:=act^.sig
            else
                ant^.sig:=act^.sig;
            dispose(act);
            encontrado:=true;
        end
        else begin 
            ant:=act;
            act:=act^.sig;
        end;
    end;
    writeln;
    if(encontrado) then begin
        writeln('Lista con el valor: ', num, ' eliminado.');
        imprimirLista(l)
    end
    else 
        writeln('El valor ', num, ' no fue encontado en la lista');
    
    
end;

//C)
procedure sublista(l:lista; var L1:lista);
var
    a,b:integer;
    nuevaLista:lista;
begin 
    nuevaLista:=nil;
    
    writeln;
    write('Ingrese un valor A: ');
    readln(a);
    write('Ingrese un valor B: ');
    readln(b);
    
    while(l<>nil)do begin 
        if(l^.num>a) and (l^.num<b) then begin
            new(nuevaLista);
            nuevaLista^.num:=l^.num;
            
            nuevaLista^.sig:=L1;
            L1:=nuevaLista;
        
        end;
        l:=l^.sig;
    end;
    
    writeln;
    writeln('La nueva sublista con valores mayores a ', a, ' y menores a ', b, ' es la sigiente: ');
    imprimirLista(L1);

end;


var
    pri, L1 : lista;
    valor : integer;
begin
    pri := nil;
    L1 := nil;
    
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    
    imprimirLista(pri);
    listaOrdenada(pri);
    EliminarValor(pri);
    sublista(pri, L1)
end.