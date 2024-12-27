{
    8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
2
REDICTADO CADP – Práctica 7 – Repaso 2023
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la
transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.

}

program ej8;
const 
    dimF=1; // las veces que voy a preguntar para leer una nueva transferencia
    dimV=7;
type
    {motivos=record
        motivo:integer;
        cant:integer;
    end;
    vector=array[1..dimV] of motivos;}
    
    fechas=record
        dia:integer;
        mes:integer;
    end;
    Transferencias=record
        numCuentaOrigen:integer;
        dniTitular:integer;
        numCuentaDestino:integer;
        dniTitularDestino:integer;
        fecha:fechas;
        hora:integer;
        monto:real;
        codMotivos:integer;
    end;
    lista=^nodo;
    nodo=record 
        dato:Transferencias;
        sig:lista;
    end;
    
    vector=array[1..dimV] of integer;


procedure inicializarVector(var v:vector);
var 
    i:integer;
begin 
    for i:=1 to dimV do begin
        v[i]:=0;
    end;
end;

procedure leerDatos(var t:Transferencias);
begin 
    writeln;
    write('Numero de cuenta de origen: ');
    readln(t.numCuentaOrigen);
    write('DNI del titular: ');
    readln(t.dniTitular);
    write('Numero de cuenta de Destino: ');
    readln(t.numCuentaDestino);
    write('DNI del titular de la cuenta destino: ');
    readln(t.dniTitularDestino);
    write('Ingrese el dia: ');
    readln(t.fecha.dia);
    write('Ingrese el mes: ');
    readln(t.fecha.mes);
    write('Ingrese la hora: ');
    readln(t.hora);
    write('Ingresar el monto: ');
    readln(t.monto);
    write('Ingrese el codigo del motivo ((1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios): ');
    readln(t.codMotivos);
end;

procedure agregarAdelante(var l:lista; t:Transferencias);
var
    nuevo:lista;
begin 
    new(nuevo);
    nuevo^.dato:=t;
    nuevo^.sig:=l;
    l:=nuevo;
end;


procedure cargarDatos(var l:lista; t:Transferencias); // el ejercicio no lo pide pero lo hago para probar el programa 
var
    i:integer;
begin 
    l:=nil;
    for i:=1 to dimF do begin 
        leerDatos(t);
        agregarAdelante(l, t);
    end;

end;

procedure insertarOrdenado(var l2: lista; t: Transferencias);
var
    nuevo, anterior, actual: lista;
begin
    // Crea un nuevo nodo y asigna la transferencia 't' a su campo 'dato'.
    new(nuevo);
    nuevo^.dato := t;

    // Inicializa los punteros 'actual' y 'anterior' con la lista 'nil'.
    actual := l2;
    anterior := nil;

    // Comienza un bucle que recorrerá la lista 'l2' y encuentra la posición
    // adecuada para insertar el nuevo nodo.
    while (actual <> nil) and (t.numCuentaOrigen > actual^.dato.numCuentaOrigen) do begin
        // Actualiza los punteros 'anterior' y 'actual' para avanzar en la lista.
        anterior := actual;
        actual := actual^.sig;
    end;

    // Verifica si 'actual' es nulo, lo que significa que el nuevo nodo debe ser el primero
    // en la lista, por lo que actualiza el puntero 'l2' para que apunte al nuevo nodo.
    if (actual = nil) then
        l2 := nuevo
    else 
        // Si 'actual' no es nulo, significa que el nuevo nodo debe insertarse entre
        // 'anterior' y 'actual'. Por lo tanto, actualiza los punteros 'sig' para insertar
        // el nuevo nodo en la posición correcta de la lista.
        anterior^.sig := nuevo;
    nuevo^.sig := actual;
end;


procedure transferenciasAterceros(l:lista; var l2:lista);
begin 
    
    while(l<>nil) do begin 
        if(l^.dato.numCuentaOrigen<>l^.dato.numCuentaDestino) then begin
            insertarOrdenado(l2, l^.dato);
        end;
        l:=l^.sig
    end;

end;


procedure recorrerVectorNuevo(l:lista; var v:vector);
var
    codMasTransferido, max, i, cantImpar, cantPar, num, cantTotal:integer;
begin 
    max:=0;
    codMasTransferido:=0;
    
    while(l<>nil) do begin 
        cantPar:=0;
        cantImpar:=0;
        num:=0;
        cantTotal:=0;
        
        v[l^.dato.codMotivos]:=v[l^.dato.codMotivos]+1;
        
        if(l^.dato.fecha.mes=6) then begin
            num:=l^.dato.numCuentaDestino;
            while(num<>0) do begin 
                if(((num mod 10) mod 2) = 0) then 
                    cantPar:=cantPar+1
                else    
                    cantImpar:=cantImpar+1;
                num:= num div 10;
            end;
        end;
        if(cantImpar>cantPar) then 
            cantTotal:=cantTotal+1;
        
        l:=l^.sig;    
    end;
    
    //C
    for i:=1 to dimV do begin 
        if(v[l^.dato.codMotivos]>max) then begin
            max:=l^.dato.codMotivos;
            codMasTransferido:=i;
        end;
    end;
    writeln;
    writeln('El ccodigo de motivo que mas transferencias tuvo fue el: ', codMasTransferido, ' con un total de ', max, ' transferencias' );
    
    //D
    writeln;
    writeln('La cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares es de: ', cantTotal);
    
end;


var 
    l, l2:lista;
    t:Transferencias;
    v:vector;
begin 
    inicializarVector(v);
    cargarDatos(l, t);
    //A)
    transferenciasAterceros(l, l2);
    //C
    recorrerVectorNuevo(l2, v);
end.