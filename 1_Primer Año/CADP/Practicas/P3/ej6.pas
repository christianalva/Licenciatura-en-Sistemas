program ej6;
type
    
    Microprocesadores=record
        marca:string;
        linea:string;
        coresOnucleos:integer;
        velocidadReloj:real;
        tamanioTransistores:integer;
        end;
        

procedure leerMicroprocesador(var micro:Microprocesadores; var max, max2, procesadorAux, cantProcesadoresMulticore:integer; var marcaMax, marcaMax2:string);
begin
    
    //Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
    if((micro.coresOnucleos>2) and (micro.tamanioTransistores>22)) then begin 
        writeln('EL procesador de marca: ', micro.marca, ' y linea: ', micro.linea, ' tiene más de 2 cores con transistores de a lo sumo 22 nm');
    end;

    //Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.
    if((micro.marca = 'intel') or (micro.marca='amd')) then begin
        if((micro.coresOnucleos>1) and (micro.velocidadReloj>=2))then begin
            cantProcesadoresMulticore:=cantProcesadoresMulticore+1;
        end;
    
    end;
    
    
    //Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
    if(micro.tamanioTransistores=14) then begin
        procesadorAux:=micro.coresOnucleos;
    if(procesadorAux>max) then begin
        max2:=max;
        marcaMax2:=marcaMax;
        max:=procesadorAux;
        marcaMax:=micro.marca;
    end
    else if(procesadorAux>max2) then begin
        max2:=procesadorAux;
        marcaMax2:=micro.marca;
    end;
    
    end;

end;



var 
    micro:Microprocesadores;
    procesadorAux, max, max2, cantProcesadoresMulticore:integer;
    marcaMax, marcaMax2:string;
    
begin
    max:=0; 
    max2:=0; 
    procesadorAux:=0; 
    cantProcesadoresMulticore:=0;
    marcaMax:='';
    marcaMax2:='';
    


    write('Ingrese la marca del Microprocesador (Intel, AMD, NVidia, etc): ');
    readln(micro.marca);
    write('Ingrese la linea (Xeon, Core i7, Opteron, Atom, Centrino, etc.): ');
    readln(micro.linea);
    write('Ingrese la cantidad de cores o núcleos de procesamiento (1, 2, 4, 8): ');
    readln(micro.coresOnucleos);
    write('Ingrese la velocidad del reloj (medida en Ghz): ');
    readln(micro.velocidadReloj);
    write('Ingrese el tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.): ');
    readln(micro.tamanioTransistores);
    
    
    while(micro.coresOnucleos<>0) do begin
        
        
        leerMicroprocesador(micro, max, max2, procesadorAux, cantProcesadoresMulticore, marcaMax, marcaMax2);
        
        
        write('Ingrese la marca del Microprocesador: ');
        readln(micro.marca);
        write('Ingrese la linea (Xeon, Core i7, Opteron, Atom, Centrino, etc.): ');
        readln(micro.linea);
        write('Ingrese la cantidad de cores o núcleos de procesamiento (1, 2, 4, 8): ');
        readln(micro.coresOnucleos);
        write('Ingrese la velocidad del reloj (medida en Ghz): ');
        readln(micro.velocidadReloj);
        write('Ingrese el tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.): ');
        readln(micro.tamanioTransistores);
    end;
    writeln('La marca con mayor cantidad de procesadores de 14nm es ',marcaMax,' seguida por ',marcaMax2);
	writeln('La cantidad de procesadores multicore de intel o amd es: ',cantProcesadoresMulticore);

end.