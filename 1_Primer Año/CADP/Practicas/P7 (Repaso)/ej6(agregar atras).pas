program ej6;
type
    objeto = record
        codObjeto: integer;
        catObjeto: integer;
        nombre: string;
        distancia: real;
        descubridor: string;
        anioDescubrimiento: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: objeto;
        sig: lista;
    end;
    objetos = record
        categoria: integer;
        cant: integer;
    end;
    vector = array[1..7] of objetos;

procedure imprimir(l: lista);
begin
    while (l <> nil) do begin
        writeln;
        writeln('Categoria del objeto: ', l^.dato.catObjeto);
        writeln('Nombre del objeto: ', l^.dato.nombre);
        writeln('Distancia a la tierra: ', l^.dato.distancia);
        writeln('Nombre del descubridor: ', l^.dato.descubridor);
        writeln('Anio de descubrimiento: ', l^.dato.anioDescubrimiento);
        l := l^.sig;
    end;
end;

procedure leerDatos(var l: lista);
var
    nuevo, actual, anterior: lista;
    codigo: integer;
begin
    l := nil;
    nuevo := l;
    codigo := 0;
    actual := l;
    anterior := nil;

    while (codigo <> -1) do begin
        writeln;
        write('Ingrese el codigo del objeto: ');
        readln(codigo);
        if (codigo <> -1) then begin
            new(nuevo);
            nuevo^.dato.codObjeto := codigo;
            write('Ingrese la categoria del objeto (1-7): ');
            readln(nuevo^.dato.catObjeto);
            write('Ingrese el nombre del objeto: ');
            readln(nuevo^.dato.nombre);
            write('Ingrese la distancia a la tierra (medida en anios luz): ');
            readln(nuevo^.dato.distancia);
            write('Ingrese el nombre del descubridor: ');
            readln(nuevo^.dato.descubridor);
            write('Ingrese el anio del descubrimiento: ');
            readln(nuevo^.dato.anioDescubrimiento);

            // AGREGAR ATRAS
            if l = nil then begin   // Verifica si la lista está vacía (l es el puntero a la lista)
                nuevo^.sig := l;    // El puntero "sig" del nuevo nodo apunta al primer nodo actual (que puede ser nil si está vacía)
                l := nuevo;         // El puntero l (que es la lista) ahora apunta al nuevo nodo, estableciéndolo como el primer nodo
            end
            else begin               // Si la lista no está vacía, se ejecuta el siguiente bloque de código
                
                actual := l;        // Inicializa el puntero "actual" para que apunte al primer nodo de la lista
                anterior := nil;    // Inicializa un puntero "anterior" como nil (se usará para rastrear el nodo anterior mientras recorremos la lista)
                
                while (actual <> nil) do begin  // Inicia un bucle que recorre la lista hasta llegar al último nodo
                    
                    anterior := actual;         // El puntero "anterior" se actualiza para que apunte al mismo nodo que "actual"
                    actual := actual^.sig;      // El puntero "actual" se mueve al siguiente nodo en la lista
                
                end;
                
                anterior^.sig := nuevo;     // El puntero "sig" del nodo anterior (último nodo en la lista) apunta al nuevo nodo, conectándolo al final de la lista
                nuevo^.sig := nil;          // El puntero "sig" del nuevo nodo se establece en nil, indicando que es el último nodo en la lista
            
            end;
        end;
    end;
    imprimir(l);
end;

procedure recorrerVector(l: lista; var v: vector);
var
    max1, max2: real;
    codMax1, codMax2, cantPlanetas, i, codigo, cantPar, cantImpar: integer;
begin
    max1 := 0;
    max2 := 0;
    codMax2 := 0;
    codMax1 := 0;
    cantPlanetas := 0;
    codigo := 0;

    for i := 1 to 7 do begin
        v[i].categoria := i;
        v[i].cant := 0;
    end;

    while (l <> nil) do begin
        cantPar := 0;
        cantImpar := 0;

        // B-1
        if (l^.dato.distancia > max1) then begin
            max2 := max1;
            max1 := l^.dato.distancia;
            codMax2 := codMax1;
            codMax1 := l^.dato.codObjeto;
        end
        else if (l^.dato.distancia > max2) then begin
            max2 := l^.dato.distancia;
            codMax2 := l^.dato.codObjeto;
        end;

        // B-2
        if (l^.dato.descubridor = 'Galileo Galilei') and (l^.dato.anioDescubrimiento < 1600) then begin
            cantPlanetas := cantPlanetas + 1;
        end;

        // B-3
        for i := 1 to 7 do begin
            if (l^.dato.catObjeto = v[i].categoria) then begin
                v[i].cant := v[i].cant + 1;
            end;
        end;

        // B-4
        codigo := l^.dato.codObjeto;
        while (codigo <> 0) do begin
            if (((codigo mod 10) mod 2) = 0) then
                cantPar := cantPar + 1
            else
                cantImpar := cantImpar + 1;
            codigo := codigo div 10;
        end;
        if (cantPar > cantImpar) then begin
            writeln('La estrella de nombre: ', l^.dato.nombre, ' posee en su codigo de objeto mas digitos pares que impares.');
        end;

        l := l^.sig;
    end;

  
    writeln;
    writeln('Los codigos de los dos objetos mas lejanos de la tierra son: ');
    writeln('1- ', codMax1, ' con una distancia a la tierra de: ', max1:0:2);
    writeln('2- ', codMax2, ' con una distancia a la tierra de: ', max2:0:2);
    

    writeln;
    writeln('La cantidad de planetas descubiertos por Galileo Galilei antes del anio 1600 es de: ', cantPlanetas);

    writeln;
    writeln('Cantidad de objetos observados por cada categoria: ');
    for i := 1 to 7 do begin
        writeln('Categoria: ', v[i].categoria, ' cantidad: ', v[i].cant);
    end;
end;

var
    l: lista;
    v: vector;
begin
    leerDatos(l);
    recorrerVector(l, v);
end.
