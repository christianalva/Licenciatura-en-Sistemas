program ej12_a;

procedure calcRendimiento(tipoZona, cantHectareas:integer; precio:real; var rendEconomico:real);

begin 
    
    case tipoZona of
    1: rendEconomico:=((6*precio)*cantHectareas);

    2: rendEconomico:=((2.6*precio)*cantHectareas);
    
    3:rendEconomico:=((2.4*precio)*cantHectareas);
    else 
        writeln('Tipo de zona invalida');
        end;

end;

var 
    cantHectareas, tipoZona:integer;
    precio, rendEconomico:real;

begin 
    cantHectareas:=0;
    tipoZona:=0;
    precio:=0;
    rendEconomico:=0;
    
    write('cantidad de hectáreas (ha) sembradas: ');
    readln(cantHectareas);
    
    writeln('Cual es la zona de siembra: ');
    writeln('1: zona muy fértil');
    writeln('2: zona estándar');
    writeln('3: zona árida');
    readln(tipoZona);
    
    writeln('Cual es el precio en dolares de la tonelada de soja?: ');
    readln(precio);
    
    calcRendimiento(tipoZona, cantHectareas, precio, rendEconomico);
    
    writeln('El rendimiento economico es de: ', rendEconomico:2:2);
    
end.