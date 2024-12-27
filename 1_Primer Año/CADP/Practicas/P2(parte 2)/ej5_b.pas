program ej5;

procedure verificar(numA, numB:integer; var esDoble:boolean);
var 
    doble:integer;
begin
    doble:= numA*2;
    
    if(numB=doble) then
        esDoble:=true;
end;

var 
    numA, numB, paresLeidos, numBmayor: integer;
    esDoble: boolean;
begin 
    
    paresLeidos:=0;
    numBmayor:=0;
    write('Ingresar numero 1: ');
    readln(numA);
    write('Ingresar numero 2: ');
    readln(numB);
    while(numA<>0) or (numB<>0) do begin
        verificar(numA, numB, esDoble);
        paresLeidos:=paresLeidos+1;
        if(esDoble) then
            numBmayor:=numBmayor+1;
            
        write('Ingresar numero 1: ');
        readln(numA);
        write('Ingresar numero 2: ');
        readln(numB);
        esDoble:=false;
    end;
    writeln('La cantidad de pares leidos fue de: ', paresLeidos);
    writeln('La cantidad de pares en los que numB fue el doble de numA es de: ', numBmayor);
    
    
end.
