program ej5;
type
    productos=record
        codigo:integer;
        descripcion:string;
        stockActual:integer;
        stockMinimo:integer;
        precio:real;
    end;
    lista=^nodo;
    nodo=record
        dato:productos;
        sig:lista;
    end;



procedure leerDatos(var l:lista);
var
    i, codigo:integer;
    aux:lista;
begin 
    l:=nil;
    i:=1;
    codigo:=0;
    
    while codigo<>-1 do begin
        new(aux);
        writeln('PRODUCTO ', i);
        writeln;
        write('Ingrese el codigo del producto: ');
        readln(codigo);
        
        if(codigo<>-1) then begin
            aux^.dato.codigo:=codigo;
            write('Ingrese la descripcion del producto: ');
            readln(aux^.dato.descripcion);
            write('Inrgese el stock actual: ');
            readln(aux^.dato.stockActual);
            write('Ingrese el stock minimo: ');
            readln(aux^.dato.stockMinimo);
            write('Ingrese el precio: ');
            readln(aux^.dato.precio);
            i:=i+1;
            aux^.sig:=l;
            l:=aux;
        end;
    end;
end;

//A)
procedure stocks(l:lista);
var 
    produc, cantTotal:integer;
    porcentaje:real;
begin
    produc:=0;
    cantTotal:=0;
    porcentaje:=0;
    while(l<>nil) do begin 
        if(l^.dato.stockActual<l^.dato.stockMinimo) then
            produc:=produc+1;
        cantTotal:=cantTotal+1;
        l:=l^.sig;
    end;
    porcentaje:=(produc*100)/cantTotal;
    writeln;
    writeln('El porcentaje de productos con stock actual por debajo del minimo es de: ', porcentaje:2:2, '%');
end;


//B
procedure tresPares(l:lista);
var
    dig, cant, num:integer;
begin 
    dig:=0;
    cant:=0;
    num:=0;
    writeln;
    writeln;
    writeln('Productos con al menos tres digitos pares: ');
    while(l<>nil) do begin 
        num:=l^.dato.codigo;
        while(num<>0) do begin 
            dig:=num mod 10;
            if((dig mod 2)=0) then begin 
                cant:=cant+1;
            end;
            num:=num div 10;
        end;
        if(cant>3) then
            writeln('El producto con descripcion: ', l^.dato.descripcion, ' tiene al menos tres digitos pares');
        l:=l^.sig;
        cant:=0;
    end;
end;


procedure pEconomicos(l:lista);
var 
    eco1, eco2:real;
    codEco1, codEco2:integer;
begin
    eco1:=9999;
    eco2:=9999;
    codEco2:=0;
    codEco1:=0;
    
    while(l<>nil) do begin
        if(l^.dato.precio<eco1) then begin
            eco2:=eco1;
            eco1:=l^.dato.precio;
            codEco2:=codEco1;
            codEco1:=l^.dato.codigo;
        end
        else if(l^.dato.precio<eco2) then begin
            eco2:=l^.dato.precio;
            codEco2:=l^.dato.codigo;
        end;
        l:=l^.sig;
    end;
    
    writeln;
    writeln('LOS CODIGOS DE LOS DOS PRODUCTOS MAS BARATOS SON LOS SIGUIENTES: ');
    writeln('1- ', codEco1 );
    writeln('2- ', codEco2 );
end;

var 
    l:lista;
begin 
    leerDatos(l);
    stocks(l);
    tresPares(l);
    pEconomicos(l);
end.