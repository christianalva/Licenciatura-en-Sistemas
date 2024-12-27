program ej5;

procedure verificar(numA, numB:integer; var esDoble:boolean);
var 
    doble:integer;
begin
    doble:= numA*2;
    if(numB=doble) then begin
        writeln('numB es el doble que numA');
        //esDoble:=true;
    end
    else if(numB>doble) then
        writeln('numB es mayor al doble de numA')
    else 
        writeln('numB no es el doble de numA');
        //esDoble:=false;

end;
var 
    numA, numB: integer;
    esDoble: boolean;
begin 
    //esDoble:=false;
    write('Ingresar numero 1: ');
    readln(numA);
    write('Ingresar numero 2: ');
    readln(numB);
    verificar(numA, numB, esDoble);
    
    //if(esDoble) then
        //writeln('numB es el doble que numA')
    //else
         //writeln('numB no es el doble de numA');
    
    
end.
