//dada la sigguiente declaracion y los siguientes procesos, indique para cada uno de los procesos si son correctos o no, el objetivo es duplicar el contenido del ultimo nodo de la lista 

program ej;
type
  miLista=^nodo;
  
  nodo = record 
    dato:integer;
    sig:miLista;
  end;
  
  lista = record
    pri:miLista;
    ult:miLista;
  end;
  
procedure duplicar1(L:lista);
begin 
  L.ult^.dato:=L.ult^.dato*2;
end;



procedure duplicar2(L:lista);
var 
  aux:miLista;
begin
  aux:=L.pri;
  while(aux^.sig<>nil) do 
    aux:=aux^.sig;
  
  aux^.dato:=aux^.dato*2;
  
end;

// hambas estan mal ya que en ninguna de las dos estoy verificando si la lista esta vacia, en el 1 ult podria ser nil o no estar inicializado, y realizar esa operacion daria un error en el tiempo de ejecucion
// el 2 tampoco verifica que la lista no este vcacia o no inicializada, si ese fuese el caso tendriamos un error en el while