program ej4;
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


//A)Maximo
procedure elementoMaxYMin(l:lista);
var
    max, min:integer;
begin 
    max:=0;
    min:=9999;
    while (l<>nil) do begin 
        if(l^.num>max)then 
            max:=l^.num;
        if(l^.num<min) then 
            min:=l^.num;
        l:=l^.sig;
    end;
    writeln;
    writeln('El valor maximo de la lista es el: ', max);
    writeln('El valor minimo de la lista es el: ', min);
end;

procedure multiplos(l:lista);
var 
    num, cant:integer;
begin
    cant:=0;
    writeln;
    write('Ingrese un valor para buscar la cantidad de multlipos que hay en la lista: ');
    readln(num);
    while (l<>nil) do begin 
        if((l^.num mod num)= 0) then
            cant:=cant+1;
        l:=l^.sig;
    end;
    
    writeln;
    writeln('La cantidad de multiplos de ', num, ' en la lista es de: ', cant);
    
end;


var
    pri : lista;
    
begin
    pri := nil;
    
    cargarLista(pri);
    imprimirLista(pri);
    elementoMaxYMin(pri);
    multiplos(pri);
end.