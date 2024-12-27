program ej7;
const 
    dimF=24;
type
    notasTotales=record
        nota:integer;
    end;
    vector=array[1..dimF] of notasTotales;
    infoAlum=record
        numAlum:integer;
        apellido:string;
        nombre:string;
        correo:string;
        anioIngreso:integer;
        anioEgreso:integer;
        notas:vector;
    end;
    lista=^nodo;
    nodo=record
        dato:infoAlum;
        sig:lista;
    end;

procedure imprimir(l:lista);
var 
    i:integer;
begin 
    
    while (l<>nil) do begin 
        writeln;
        writeln('Codigo de alumno: ', l^.dato.numAlum);
        writeln('Apellido del alumno: ', l^.dato.apellido);
        writeln('Nombre del alumno: ', l^.dato.nombre);
        writeln('Correo del alumno: ', l^.dato.correo);
        writeln('Anio de ingreso: ', l^.dato.anioIngreso);
        writeln('Anio de egreso: ', l^.dato.anioEgreso);
        writeln('NOTAS');
        for i:=1 to dimF do begin 
            writeln('Nota ', i , ' materia: ', l^.dato.notas[i].nota);
        end;
        
        l:=l^.sig;
    end;
    
end;


procedure ordenarNotas(l:lista);
var
    i, j, aux:integer;
begin 
    aux:=0;
    while(l<>nil) do begin 
        for i:=1 to dimF-1 do begin 
            for j:=i+1 to dimF do begin 
                if(l^.dato.notas[j].nota>l^.dato.notas[i].nota) then begin 
                    aux:=l^.dato.notas[i].nota;
                    l^.dato.notas[i].nota:=l^.dato.notas[j].nota;
                    l^.dato.notas[j].nota:=aux;
                end;
            end;
        end;
        l:=l^.sig;
    end;

end;


procedure leerDatos(var l:lista);
var
    nuevo, actual, anterior:lista;
    num, i:integer;
begin 
    l:=nil;
    nuevo:=l;
    num:=0;
    
    while (num<>-1) do begin 
        writeln;
        write('Ingresar numero de alumno: ');
        readln(num);
        if(num<>-1) then begin
            new(nuevo);
            nuevo^.dato.numAlum:=num;
            write('Ingrese el apellido del alumno: ');
            readln(nuevo^.dato.apellido);
            write('Ingrese el Nombre del alumno: ');
            readln(nuevo^.dato.nombre);
            write('Ingrese el correo del alumno: ');
            readln(nuevo^.dato.correo);
            write('Ingrese el anio de ingreso: ');
            readln(nuevo^.dato.anioIngreso);
            write('Ingrese el anio de egreso: ');
            readln(nuevo^.dato.anioEgreso);
            for i:=1 to dimF do begin 
                writeln('Ingrese la nota de la ', i , ' materia aprobada: ');
                readln(nuevo^.dato.notas[i].nota);
            end;
            
            
            //INSERTAR ORDENADO
            if (l=nil) then begin //si la lista esta vacia
                nuevo^.sig:=l;
                l:=nuevo;
            end
            else begin  // si no esta vacia busco la posición adecuada en la lista
                actual:=l;
                anterior:=l;
                while(actual<>nil) and (nuevo^.dato.numAlum > actual^.dato.numAlum) do begin 
                    anterior:=actual;
                    actual:=actual^.sig;
                end;
                if(actual=anterior) then 
                    l:=nuevo
                else 
                    anterior^.sig:=nuevo;
                nuevo^.sig:=actual;
            
            end;
        end;
    end;
    ordenarNotas(l);
    imprimir(l);
end;

//2-a)
procedure promNotas(l:lista);
var
    total, i:integer;
    promedio:real;
begin 
    
    while(l<>nil) do begin 
        total:=0;
        promedio:=0;
        
        for i:=1 to dimF do begin 
            total:=total+l^.dato.notas[i].nota;
        end;
        
        promedio:=total/dimF;
        
        writeln;
        writeln('El promedio de las notas del alumno: ', l^.dato.nombre, ' es de: ', promedio:2:2);
        
        l:=l^.sig;
    end;
end;


procedure alumnos2012(l:lista);
var
    num, cantDig, digPar, total:integer;
begin 
    total:=0;
    while(l<>nil) do begin 
        num:=0;
        digPar:=0;
        cantDig:=0;
        if(l^.dato.anioIngreso=2012) then begin 
            num:=l^.dato.numAlum;
            while(num<>0) do begin 
                if(((num mod 10 ) mod 2) = 0) then begin 
                    digPar:=digPar+1;
                end;
                cantDig:=cantDig+1;
                num:=num div 10;
            end;
        end;
        
        if(cantDig=digPar) then 
            total:=total+1;
        
        l:=l^.sig;
    end;
    writeln;
    writeln('La cantidad de alumnos ingresantes en 2012 con numero de alumno compuesto unicamente por digitos impares es de: ', total);
end;


procedure alumnosRapidos(l:lista);
var 
    min1, min2, aniosTardados:integer;
    apellido1, apellido2, nombre1, nombre2, correo1, correo2:string;
begin 
    apellido1:='';
    apellido2:='';
    nombre1:='';
    nombre2:='';
    correo1:='';
    correo2:='';
    min1:=9999;
    min2:=9999;
    
    
    while(l<>nil) do begin 
        aniosTardados:=l^.dato.anioEgreso-l^.dato.anioIngreso;
        if (aniosTardados<min1) then begin 
            min2:=min1;
            apellido2:=apellido1;
            nombre2:=nombre1;
            correo2:=correo1;
            min1:=aniosTardados;
            apellido1:=l^.dato.apellido;
            nombre1:=l^.dato.nombre;
            correo1:=l^.dato.correo;
        end
        else if(aniosTardados<min2) then begin 
            min2:=aniosTardados;
            apellido2:=l^.dato.apellido;
            nombre2:=l^.dato.nombre;
            correo2:=l^.dato.correo;
        end;
        
        l:=l^.sig;
    end;
    
    writeln;
    writeln('Apellido, nombre y correo electronico de los dos alumnos que mas rapido se resivieron: ');
    writeln('1- apellido: ', apellido1, ', nombre: ', nombre1, ', email: ', correo1, ' se graduo en un total de: ', min1,' anios'  );    
    writeln('2- apellido: ', apellido2, ', nombre: ', nombre2, ', email: ', correo2, ' se graduo en un total de: ', min2,' anios'  );  
end;


procedure eliminar(var l:lista);
var
    anterior, actual:lista;
    num:integer;
    encontrado:boolean;
begin 
    encontrado:=false;
    actual:=l;
    anterior:=nil;
    
    writeln();
    write('Introduzca el numero de alumno que desea eliminar: ');
    readln(num);
    
    while(actual<>nil) do begin 
        if(num=act^.dato.numAlum) then begin
            encontrado:=true;
            if(actual=l) then 
                l:=l^.sig  // Si el nodo a eliminar es el primero, se actualiza la lista para que apunte al siguiente nodo.
            else    
                anterior^.sig:=actual^.sig;  // Si no es el primer nodo, se actualiza el puntero del nodo anterior para omitir el nodo actual.
            dispose(actual);  // Libera la memoria ocupada por el nodo actual.
            actual:=anterior;  // Actualiza el puntero actual para que apunte al nodo anterior.
        end
        else begin  
            anterior:=actual;  // Actualiza el puntero anterior para que apunte al nodo actual.
            actual:=actual^.sig;  // Mueve el puntero actual al siguiente nodo en la lista.
        end;
    end;
    
    if(not encontrado) then begin 
        writeln();
        writeln('No se ah encontrado el alumno con el Codigo que a proporcionado');
    end
    else begin 
        writeln();
        imprimir(l);  // Muestra la lista actualizada en la consola.
    end;
end;


var 
    l:lista;
begin 
    leerDatos(l);
    promNotas(l);
    alumnos2012(l);
    alumnosRapidos(l);
    eliminar(l);
end.