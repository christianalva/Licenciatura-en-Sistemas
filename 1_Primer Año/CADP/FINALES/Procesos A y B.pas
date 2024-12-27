//dada la siguiente declaracion y los siguientes procesos, indiquie para cada uno de los procesos si son correctos o no. El objetico es duplicar el contenido del ultimo nodo de la lista, justifique su respuesta 


program uno;
type
  miLista = ^nodo;
  nodo = record
    dato:integer;
    sig:miLista;
    end;
  lista = record
    pri:miLista;
    ult:miLista;
    end;


procedure duplicar1(L:lista);//proceso A
begin 
  L.ult^.dato:=L.ult^.dato*2;//para mi este esta mal ya que si la lista esta vacia se esta ejecutando al pedo, o estas multiplicando algo que no existe
end;


procedure duplicar2(L:lista);//proceso B y este seria el que estaria bien en teoria 
var 
  aux:miLista;
begin 
  aux:=L.pri;
  while(aux^.sig<>nil) do begin 
    aux:=aux^.sig;
  end;
  aux^.dato:=aux^.dato*2;
end;

var 
  l:lista;
begin 
  duplicar1(l);
  //duplicar2(l);
end.