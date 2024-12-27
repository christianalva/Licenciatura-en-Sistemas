program ej10;

procedure parteA(var caracter: char; var okA: boolean);
begin

    while(caracter<>'$') do begin
        if((caracter='a') or (caracter='e') or (caracter='i') or (caracter='o') or (caracter='u') ) then begin
            okA:= false;
        end
        else 
            okA:= true;
        write('Ingrese un caracter (pareteA): ');
        readln(caracter);
    end;

end;


procedure parteB(var caracter: char; var okB: boolean);
begin 
    
    while(caracter<>'#') do begin
        if((caracter='a') or (caracter='e') or (caracter='i') or (caracter='o') or (caracter='u') ) then begin
            okB:= true;
        end;
        write('Ingrese un caracter (pareteB): ');
        readln(caracter);
    end;

end;



var 
    okA, okB: boolean;
    caracter:char;
begin
    okA:= false;
    okB:= false;
    
    
    parteA(caracter, okA);
    write('Ingrese un caracter (pareteB): ');
    readln(caracter);
    parteB(caracter, okB);
    
    
    if(okA = true) then begin
        writeln('La parte A no se ah cumplido');
    end;
    if(okB = true) then begin
        writeln('La parte B no se ah cumplido.');
    end;
    
    
end.