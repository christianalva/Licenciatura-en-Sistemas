program ej3;
type
    viajes=record
        codAuto:integer;
        numViaje:integer;
        direcOrigen:string;
        direcDestino:string;
        kilometrosRecorridos:real;
    end;
    lista=^nodo;
    nodo=record
        dato:viajes;
        sig:lista;
    end;
    
procedure imprimir(l:lista);
begin 
    writeln;
    while(l<>nil)do begin 
        writeln;
        writeln('Codigo del auto: ', l^.dato.codAuto);
        writeln('Numero de viaje: ', l^.dato.numViaje);
        writeln('Direccion de origen : ', l^.dato.direcOrigen);
        writeln('Direccion de destino: ', l^.dato.direcDestino);
        writeln('Kilometros recorridos: ', l^.dato.kilometrosRecorridos:2:2);
        l:=l^.sig;
    end;
end;


procedure leerDatos(var l: lista);
var
    nuevo, act, aux: lista;
    codigo: integer;
begin
    l := nil; // Inicializamos la lista (l) como vacía
    nuevo := nil; // Inicializamos el nodo nuevo como vacío
    codigo := 0; // Inicializamos el código en cero

    while (codigo <> -1) do begin// Inicia un bucle que se ejecuta hasta que el código sea igual a -1
        new(nuevo); // Creamos un nuevo nodo en cada iteración del bucle

        writeln;
        write('Ingrese el codigo del auto: ');
        readln(codigo); // Solicitamos y leemos el código del auto

        if (codigo <> -1) then begin // Comprobamos si el código es diferente de -1 (para terminar la entrada de dato)
            nuevo^.dato.codAuto:=codigo;
            write('Ingrese el numero de viaje: ');
            readln(nuevo^.dato.numViaje); // Solicitamos y leemos el número de viaje
            write('Ingrese la direccion de origen: ');
            readln(nuevo^.dato.direcOrigen); // Solicitamos y leemos la dirección de origen
            write('Ingrese la direccion de destino: ');
            readln(nuevo^.dato.direcDestino); // Solicitamos y leemos la dirección de destino
            write('Ingrese los kilometros recorridos: ');
            readln(nuevo^.dato.kilometrosRecorridos); // Solicitamos y leemos los kilómetros recorridos
            
            //AGREGAR ATRAS
            nuevo^.sig := nil; // Inicializamos el siguiente nodo del nuevo nodo como nulo
            if l = nil then begin// Si la lista está vacía
                l := nuevo; // Asignamos el nuevo nodo como el primer nodo de la lista
            end
            else begin
                act := l; // Inicializamos un puntero "act" al inicio de la lista
                aux := nil; // Inicializamos un puntero "aux" como nulo

                while (act <> nil) and (act^.dato.codAuto <> nuevo^.dato.codAuto) do begin
                    aux := act; // Avanzamos el puntero "aux" al nodo actual
                    act := act^.sig; // Avanzamos el puntero "act" al siguiente nodo
                end;

                if (act <> nil) then begin// Si encontramos un nodo con el mismo código de auto
                
                    act^.dato.kilometrosRecorridos := act^.dato.kilometrosRecorridos + nuevo^.dato.kilometrosRecorridos;
                    dispose(nuevo); // Sumamos los kilómetros recorridos y liberamos la memoria del nuevo nodo
                end
                else begin
            
                    if (aux = nil) then
                        l := nuevo
                    else
                        aux^.sig := nuevo; // Si no encontramos un nodo con el mismo código, agregamos el nuevo nodo al final de la lista
                end;
            end;
        end;
    end;

    imprimir(l); // Imprimimos la lista después de ingresar los datos
end;

procedure masKm(l:lista);
var
    max1,max2:real;
    cod1, cod2:integer;
begin 
    max1:=0;
    max2:=0;
    cod2:=0;
    cod1:=0;
    while(l<>nil) do begin 
        if(l^.dato.kilometrosRecorridos>max1) then begin
            max2:=max1;
            cod2:=cod1;
            max1:=l^.dato.kilometrosRecorridos;
            cod1:=l^.dato.codAuto;
        end
        else if (l^.dato.kilometrosRecorridos>max2) then begin 
            max2:=l^.dato.kilometrosRecorridos;
            cod2:=l^.dato.codAuto;
        end;
        l:=l^.sig;
    end;
    writeln;
    writeln('Los dos codigos de autos que mas recorieron son: ', cod1, ' y ', cod2);
end;



procedure ordenarNuevaLista(l:lista);
var
    act,ant,nue, mayor:lista;
    aux:integer;
begin 
    aux:=0;
    act:=l;
    nue:=nil;
    ant:=nil;
    
    while(act<>nil) do begin
        mayor:=act;
        nue:=act^.sig;
        
        while(nue<>nil) do begin
            if (nue^.dato.numViaje > mayor^.dato.numViaje) then
               mayor := nue; // Actualizamos "mayor" si encontramos un nodo con más viajes
            nue := nue^.sig; // Avanzamos "nuevo" al siguiente nodo
        end;
        
        if (mayor <> act) then begin
            aux := act^.dato.numViaje; // Almacenamos temporalmente la cantidad de viajes de "actual"
            act^.dato.numViaje := mayor^.dato.numViaje; // Actualizamos la cantidad de viajes de "actual" con la de "mayor"
            mayor^.dato.numViaje := aux; // Actualizamos la cantidad de viajes de "mayor" con la cantidad temporal
        end;

        ant := act; // Avanzamos "anterior" a "actual" antes de avanzar "actual" al siguiente nodo
        act := act^.sig; // Avanzamos "actual" al siguiente nodo
    end;
    
    imprimir(l);
end;



procedure viajesMas5Km(l:lista; var l2:lista);
var
    nuevo, act: lista;
begin 
    l2:=nil;
    act:=l;
    nuevo:=l2;
    
    while(act<>nil) do begin 
        if (act^.dato.kilometrosRecorridos>5) then begin 
            new(nuevo);
            nuevo^.dato:=act^.dato;
            nuevo^.sig := nil;

            if (l2 = nil) then
                l2 := nuevo
            else
            begin
                nuevo^.sig := l2;
                l2 := nuevo;
            end;
        end;
        act:=act^.sig;
    end;
    
    ordenarNuevaLista(l2);
end;




var
    l, l2:lista;
begin 
    leerDatos(l);
    masKm(l);
    viajesMas5Km(l, l2);
end.