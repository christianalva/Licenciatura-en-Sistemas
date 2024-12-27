program ejercicio6;
type
    puntero_numeros = ^integer;
var
    num: puntero_numeros; // Memoria estática: 4 bytes (puntero a un entero)
    i: integer;
begin
    writeln(sizeof(num^) * 25000); // Memoria estática: 100,000 bytes (tamaño de un entero multiplicado por 25000)
    
    new(num); // Memoria dinámica: 4 bytes (asignación de memoria para un entero)
    
    for i := 1 to 25000 do
        num^ := 0; // Memoria dinámica: Uso temporal para almacenar valores enteros
    
    dispose(num); // Libera la memoria dinámica (4 bytes)
end.
