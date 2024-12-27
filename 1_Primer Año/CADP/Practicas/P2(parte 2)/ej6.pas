program ej6;

// codigo de los dos productos mas baratos
procedure productosMasBaratos(precio, precioProducBarato, precioProducBarato2: real; codigo:integer; var codigoProducBarato, codigoProducBarato2:integer);
begin
    
    if(precio<precioProducBarato) then begin
        precioProducBarato2:= precioProducBarato;
        precioProducBarato:=precio;
        codigoProducBarato2:= codigoProducBarato;
        codigoProducBarato:=codigo;
    end
    else if(precio<precioProducBarato2) then begin
        precioProducBarato2:=precio;
        codigoProducBarato2:= codigo;
    end;

end;

// codigo pantalon mas caro
procedure pantalonMasCaro(precio, precioPantalon:real; codigo:integer; var codigoPantalon:integer);
begin 
    if(precio>precioPantalon) then begin 
        precioPantalon:= precio;
        codigoPantalon:=codigo;
    end;
end;


//variables locales programa principal
var
    precio, precioProducBarato, precioProducBarato2, precioPantalon, precioProm, precioTotal:real;
    i, codigo, codigoProducBarato, codigoProducBarato2, codigoPantalon:integer;
    tipo:string;
//programa principal
begin
    precioPantalon:=0;
    codigoPantalon:=0;
    precioProducBarato:=9999999;
    precioProducBarato2:=9999999;
    codigoProducBarato:=0;
    codigoProducBarato2:=0;
    precioTotal:=0;
    
    
    for i := 1 to 2 do begin
        write('Ingresar precio del producto: ');
        readln(precio);
        write('Ingresar codigo del producto: ');
        readln(codigo);
        write('Ingresar tipo de producto: ');
        readln(tipo);
        precioTotal:=precioTotal+precio;
        productosMasBaratos(precio, precioProducBarato, precioProducBarato2, codigo, codigoProducBarato, codigoProducBarato2);
        
        if((tipo='pantalon') or (tipo='PANTALON')) then
            pantalonMasCaro(precio, precioPantalon, codigo, codigoPantalon);
        
    end;
    
    
    writeln('Los codigos de los dos productos mas baratos son el: ', codigoProducBarato2, ' y el: ', codigoProducBarato);
    writeln('EL código del producto de tipo “pantalón” más caro es el: ', codigoPantalon);
    writeln('El precio promedio es de: ', precioTotal/100:2:2);



end.
