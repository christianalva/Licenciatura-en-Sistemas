program ej1;
type
    infoExtras=record
        dni:integer;
        apellido:string;
        nombre:string;
        edad:integer;
        codActuacion:string;
    end;
    lista=^nodo;
    nodo=record
        dato:infoExtras;
        sig:lista;
    end;
    genero=record
        cod:string;
        contador:integer;
    end;
    vector=array[1..5] of genero;
    
procedure imprimir(l:lista);
begin 
    while(l<>nil) do begin 
        
        writeln;
        writeln('DNI: ', l^.dato.dni);
        writeln('Apellido: ', l^.dato.apellido);
        writeln('Nombre: ', l^.dato.nombre);
        writeln('Edad: ', l^.dato.edad);
        writeln('Codigo de actuacion: ', l^.dato.codActuacion);
        l:=l^.sig;
        
    end;
end;


procedure leerDatos(var l:lista);
var
    aux:lista;
    p, cod:integer;
begin 
    p:=1;
    l:=nil;
    cod:=0;
    while(cod<>3355) do begin //33555444
        new(aux);
        writeln();
        writeln('Persona: ', p);
        write('Ingrese su DNI: ');
        readln(cod);
        aux^.dato.dni:=cod;
        write('Ingrese su apellido: ');
        readln(aux^.dato.apellido);
        write('Ingrese su nombre: ');
        readln(aux^.dato.nombre);
        write('Ingrese su edad: ');
        readln(aux^.dato.edad);
        write('Ingrese el codigo de genero de actuacion que prefiere: ');
        readln(aux^.dato.codActuacion);
        
        aux^.sig:=l;
        l:=aux;
        p:=p+1;
    end;
    writeln();
    imprimir(aux);
end;

procedure contadorDigitos(l:lista);
var
    dnis, par, impar, masPar:integer;
begin 
    dnis:=0;
    par:=0;
    impar:=0;
    masPar:=0;
    
    while(l<>nil) do begin
        dnis:=l^.dato.dni;
        while(dnis<>0) do begin 
            if(((dnis mod 10) mod 2)=0 ) then 
                par:=par+1
            else if(((dnis mod 10) mod 2)<>0 ) then 
                impar:=impar+1;
            dnis:= dnis div 10;
        end;
        if(par>impar) then 
            masPar:=masPar+1;
        
        par:=0;
        impar:=0;
        l:=l^.sig;
    end;
    writeln;
    writeln('La cantidad de personas con DNI con mas digitos pares que impares es de: ', masPar);
end;


procedure codMasElegidos(l:lista; var v:vector);
var
    i, j, max1, max2:integer;
    codMax1, codMax2:string;
begin
    max1:=0;
    max2:=0;
    codMax1:='';
    codMax2:='';
    
    v[1].cod:='Drama';
    v[2].cod:='Romantico';
    v[3].cod:='Accion';
    v[4].cod:='Suspenso';
    v[5].cod:='Terror';
    
    for i:=1 to 5 do begin
        v[i].contador:=0;
    end;
    
    while(l<>nil) do begin 
        
        for j:=1 to 5 do begin 
            if(v[j].cod=l^.dato.codActuacion) then begin
                v[j].contador:=v[j].contador+1;
            end;
        end;
        l:=l^.sig;
    end;
    
    for i:=1 to 5 do begin 
        if(v[i].contador>max1) then begin
            max2:=max1;
            codMax2:=codMax1;
            max1:=v[i].contador;
            codMax1:=v[i].cod
        end
        else if(v[i].contador>max2) then begin
            max2:=v[i].contador;
            codMax2:=v[i].cod;
        end;
    end;
    
    writeln;
    writeln('Los dos codigos de genero mas elegidos son: ');
    writeln('1- ', codMax1);
    writeln('2- ', codMax2);
    
end;

procedure eliminarDni(var l: lista);
var
    dniE: integer;         // Variable para almacenar el DNI a eliminar.
    encontrado: boolean;   // Variable que indica si el DNI a eliminar fue encontrado.
    ant, act: lista;       // Punteros auxiliares para recorrer y manipular la lista.

begin
    encontrado := false;    // Inicializa la variable "encontrado" como falso, ya que aún no se ha encontrado el DNI.
    ant := nil;             // Inicializa el puntero "ant" como nil, que representa el nodo anterior en la lista.
    act := l;               // Inicializa el puntero "act" con la cabeza de la lista "l".

    writeln();
    write('Ingrese un DNI a eliminar: ');
    readln(dniE);           // Solicita al usuario ingresar el DNI que se desea eliminar.

    while act <> nil do begin    // Comienza un ciclo mientras no se llegue al final de la lista.
        if act^.dato.dni = dniE then begin
            encontrado := true;   // Se encontró el DNI a eliminar, se marca "encontrado" como verdadero.

            if act = l then begin
                l := l^.sig;       // Si el DNI a eliminar está en el primer nodo, actualiza la cabeza de la lista.
            end
            else begin
                ant^.sig := act^.sig;  // Si el DNI a eliminar está en un nodo intermedio o al final, ajusta los punteros para omitir el nodo.
            end;

            dispose(act);    // Libera la memoria del nodo que contiene el DNI eliminado.
            act := ant;      // Vuelve "act" al nodo anterior en la lista (o nil si se eliminó el primer nodo).
        end
        else begin
            ant := act;  // El DNI actual no coincide con el DNI a eliminar, avanza los punteros "ant" y "act" a la siguiente posición.
            act := act^.sig;
        end;
    end;

    if not encontrado then
        writeln('No se encontró el DNI introducido') // Si no se encontró el DNI, muestra un mensaje.
    else
        imprimir(l);  // En caso contrario, llama a un procedimiento llamado "imprimir" para mostrar la lista actualizada.
end;




var 
    L:lista;
    v:vector;
begin 
    leerDatos(L);
    contadorDigitos(L);
    codMasElegidos(L, v);
    eliminarDni(L);
end.