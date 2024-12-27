{

Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
    
}


program ej8;
var 
    caracter:CHAR;
    cant, vocales:INTEGER;
begin 
    cant:= 0;
    vocales:=0;
    
    writeln('Ingrese una letra');
    readln(caracter);
    cant:=cant+1;
    
    if ((caracter = 'a') or (caracter = 'A') or (caracter = 'e') or (caracter = 'E') or (caracter = 'i') or (caracter = 'I') or (caracter = 'o') or (caracter = 'O') or (caracter = 'u') or (caracter = 'U')) then
    begin
        vocales:= vocales+1;
    end;
    
    while(cant<3)do begin
        writeln('Ingrese otra letra ');
        readln(caracter);
        
        if ((caracter = 'a') or (caracter = 'A') or (caracter = 'e') or (caracter = 'E') or (caracter = 'i') or (caracter = 'I') or (caracter = 'o') or (caracter = 'O') or (caracter = 'u') or (caracter = 'U')) then
        begin
            vocales:= vocales+1;
        end;
        cant:=cant+1;
    end;
    
    if(vocales=3) then
    begin
        writeln('Los 3 son vocales');
    end
    else
    begin
        writeln('Al menos un caracter no era vocal');
    end;
end.
