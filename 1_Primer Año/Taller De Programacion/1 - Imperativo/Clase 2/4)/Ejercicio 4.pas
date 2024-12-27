program Ejercicio4;

procedure convertir(num: integer);
begin 
    // Verifica si el número es mayor que cero para continuar con la conversión
    if (num > 0) then begin
        // Llama recursivamente al procedimiento con el número dividido por 2 (parte entera)
        convertir(num div 2);
        // Escribe el residuo de la división entre 2, que corresponde a un dígito binario
        write(num mod 2);
    end;
end;

procedure ingresarNumero(var num:integer);
begin 
	writeln('Ingrese un numero decimal a convertir en binario: ');
	readln(num);
	if(num <> 0) then begin 
		write('El numero binario es: ');
		convertir(num);
		writeln;
		ingresarNumero(num);
	end;
end;


var 
	num:integer;
begin 
	ingresarNumero(num);
end.
