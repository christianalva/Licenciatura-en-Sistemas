program ej5;
type
    autos=record
        marca:string;
        modelo:string;
        precio:real;
        end;
        

procedure InfoAutos(var auto:autos; var autoMasCaro:real; var marcaAutoMax, modeloAutoMax:string);
begin
   
   if(auto.precio>autoMasCaro) then begin
        autoMasCaro:=auto.precio;
        marcaAutoMax:=auto.marca;
        modeloAutoMax:=auto.modelo;
   end;
    
end;

var
    auto:autos;
    cantAutos:integer;
    marcaAutoMax, modeloAutoMax:string;
    autoMasCaro,precioProm, precioTotal:real;

begin 
    precioProm:=0;
    marcaAutoMax:='';
    modeloAutoMax:='';
    autoMasCaro:=0;
    cantAutos:=0;
    precioTotal:=0;

    write('Ingrese la marca de la nave: ');
    readln(auto.marca);
    write('Ingrese el modelo de la nave: ');
    readln(auto.modelo);
    write('Ingrese el precio del ', auto.marca, ' ', auto.modelo, ': ');
    readln(auto.precio);

    while(auto.marca<>'ZZZ')do begin
        
        InfoAutos(auto, autoMasCaro, marcaAutoMax, modeloAutoMax);
        cantAutos:=cantAutos+1;
        precioTotal:=precioTotal+auto.precio;
        
        write('Ingrese la marca de la nave: ');
        readln(auto.marca);
        write('Ingrese el modelo de la nave: ');
        readln(auto.modelo);
        write('Ingrese el precio del ', auto.marca, ' ', auto.modelo, ': ');
        readln(auto.precio);
    end;
    precioProm:=(precioTotal/cantAutos);
    
    writeln('El modelo del auto mas caro es: ', modeloAutoMax, ' y la marca es: ', marcaAutoMax);
    writeln('El precio promedio final de todos los autos es de: ', precioProm:2:2);

end.