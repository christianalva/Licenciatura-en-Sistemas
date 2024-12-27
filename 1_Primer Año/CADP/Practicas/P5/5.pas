//5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
//  interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
//  de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
//  libres. Justificar mediante prueba de escritorio.


Program Alocacion_Dinamica;
Type
    TEmpleado = record
        sucursal: char;
        apellido: string[25];
        correoElectrónico: string[40];
        sueldo: real;
    end;
    Str50 = string[50];
Var
    alguien: TEmpleado;
    PtrEmpleado: ^TEmpleado;
Begin
    
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    
    Readln( alguien.apellido );// 26 bytes 
    
    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    
    New( PtrEmpleado ); // 26 bytes de la linea anterior + 4bytes de esta nueva linea
    
    {¿Cuánta memoria disponible hay ahora? (III)}
    
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );// 30 bytes de todo lo anterior + 1 byte (char) + 26 bytes (string) de la nueva linea
    
    Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );// 57 bytes de las lineas anteriores + 41 bytes (string) + 4 bytes (real) = 102 bytes  
    
    {¿Cuánta memoria disponible hay ahora? (IV)} // 399.898 bytes
    
    Dispose( PtrEmpleado );
    
    {¿Cuánta memoria disponible hay ahora? (V)} // 399.898 bytes
end.
