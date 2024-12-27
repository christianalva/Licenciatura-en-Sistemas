program ej7;
var 
    codigo, precioActual, nuevoPrecio: INTEGER;
    porciento1, porciento2: REAL;
begin
    codigo:= 0;
    precioActual:=0;
    nuevoPrecio:=0;
    porciento1:=0;
    porciento2:=0;
    
    writeln('Ingrese el codigo del producto');
    read(codigo);
    while(codigo<>32767) do begin
        writeln('Ingrese el precio actual');
        read(precioActual);
        writeln('Ingrese el nuevo precio');
        read(nuevoPrecio);
        
        porciento1:= precioActual/10;
        porciento2:= nuevoPrecio/10;
        
        if(porciento2>porciento1) then
        begin
            writeln('El aumento de precio del producto ', codigo, ' es superior al 10%');
        end
        else 
        begin
            writeln('El aumento del producto ', codigo, ' no es superior al 10%');
        end;
        
        {LE PIDO UN NUEVO PRODUCTO}
        writeln('Ingrese el codigo de un nuevo producto');
        read(codigo);
        
        {proceso el codigo con el cual luego termina el programa}
        if(codigo = 32767) then
        begin
            writeln('Ingrese el precio actual');
            read(precioActual);
            writeln('Ingrese el nuevo precio');
            read(nuevoPrecio);
        
            porciento1:= precioActual/10;
            porciento2:= nuevoPrecio/10;
        
            if(porciento2>porciento1) then
            begin
                writeln('El aumento de precio del producto ', codigo, ' es superior al 10%');
            end
            else 
            begin
                writeln('El aumento del producto ', codigo, ' no es superior al 10%');
            end;
        end;
    end;
end.