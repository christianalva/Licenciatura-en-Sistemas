{Una cรกtedra dispone de informaciรณn de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha informaciรณn se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:

a. Un mรณdulo que retorne la posiciรณn del alumno con un nro de alumno recibido por parรกmetro. El
alumno seguro existe.

b. Un mรณdulo que reciba un alumno y lo inserte en el vector.

c. Un mรณdulo que reciba la posiciรณn de un alumno dentro del vector y lo elimine.

d. Un mรณdulo que reciba un nro de alumno y elimine dicho alumno del vector

e. Un mรณdulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los mรณdulos desarrollados en los incisos previos con datos
leรญdos de teclado.}

program ejercicio4;
const   
    dimF=1000;
type
    vector = array [1..dimF] of record
        numero,asistencias:integer;
        nombre,apellido:string[20];
    end;
procedure imprimir(var alumnos:vector; var dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        writeln;
        writeln('Codigo: ',alumnos[i].numero);
        writeln('Apellido: ',alumnos[i].apellido);
        writeln('Nombre: ',alumnos[i].nombre);
        writeln('Asistencias: ',alumnos[i].asistencias);
    end;
    writeln;
    writeln('---------------------------------------------------------------------');
end;
procedure cargarVector(var alumnos:vector; var dimL:integer);
var
    i:integer;
begin
    writeln('Introduzca los datos del alumno');
    for i:=1 to dimF do begin
        writeln;
        alumnos[i].numero:=i+1000;
        write('Apellido: ');
        readln(alumnos[i].apellido);
        write('Nombre: ');
        readln(alumnos[i].nombre);
        write('Asistencias totales: ');
        readln(alumnos[i].asistencias);
        dimL:=dimL+1;
    end;
    writeln;
    writeln('El vector posee ',dimL,' elementos');
    imprimir(alumnos,dimL);
end;
procedure encontrar(var alumnos:vector; var dimL:integer);
var
    i,a:integer;
begin
    writeln;
    write('Codigo del alumno a encontrar: ');
    readln(a);
    for i:=1 to dimL do begin
        if (a=alumnos[i].numero) then begin
            writeln;
            writeln('Alumno encontrado en la posicion ',i);
            writeln;
            writeln('Apellido: ',alumnos[i].apellido);
            writeln('Nombre: ',alumnos[i].nombre);
            writeln('Asistencias: ',alumnos[i].asistencias);
        end;    
    end;
end;
procedure insertar(var alumnos:vector; var dimL:integer);
begin
    writeln;
    write('Datos del alumno a insertar: ');
    writeln;
    dimL:=dimL+1;
    alumnos[dimL].numero:=dimL+1000;
    write('Apellido: ');
    readln(alumnos[dimL].apellido);
    write('Nombre: ');
    readln(alumnos[dimL].nombre);
    write('Asistencias totales: ');
    readln(alumnos[dimL].asistencias);
    imprimir(alumnos,dimL);
end;
procedure eliminarPos(var alumnos:vector; var dimL:integer);
var
    i,a:integer;
begin
    writeln;
    write('Posicion del alumno a eliminar: ');
    readln(a);
    writeln;
    for i:=a to dimL -1 do begin
        alumnos[i].numero:=alumnos[i+1].numero;
        alumnos[i].apellido:=alumnos[i+1].apellido;
        alumnos[i].nombre:=alumnos[i+1].nombre;
        alumnos[i].asistencias:=alumnos[i+1].asistencias;
    end;
    dimL:=dimL-1;
    imprimir(alumnos,dimL);
end;
procedure eliminarAlum(var alumnos:vector; var dimL:integer);
var
    i,j,a:integer;
begin
    writeln;
    write('Codigo del alumno a eliminar: ');
    readln(a);
    writeln;
    for j:=1 to dimL do begin
        if (a=alumnos[j].numero) then
            for i:=j to dimL -1 do begin
                alumnos[i].numero:=alumnos[i+1].numero;
                alumnos[i].apellido:=alumnos[i+1].apellido;
                alumnos[i].nombre:=alumnos[i+1].nombre;
                alumnos[i].asistencias:=alumnos[i+1].asistencias;
            end;
    end;
    dimL:=dimL-1;
    imprimir(alumnos,dimL);
end;
procedure eliminarCeros(var alumnos:vector; var dimL:integer);
var
    i,j,a:integer;
begin
    writeln;
    write('Eliminando alumnos con 0 asistencias');
    writeln;
    j:=1;
    while j<=dimL do begin
        if (alumnos[j].asistencias=0) then begin
            for i:=j to dimL -1 do begin
                alumnos[i].numero:=alumnos[i+1].numero;
                alumnos[i].apellido:=alumnos[i+1].apellido;
                alumnos[i].nombre:=alumnos[i+1].nombre;
                alumnos[i].asistencias:=alumnos[i+1].asistencias;
            end;
            dimL:=dimL-1;
        end
        else begin
            j:=j+1;
        end;
    end;
    imprimir(alumnos,dimL);
end;
var
    dimL:integer;
    alumnos:vector;
begin
    cargarVector(alumnos,dimL);
    {a}
    encontrar(alumnos,dimL);
    {b}
    insertar(alumnos,dimL);
    {c}
    eliminarPos(alumnos,dimL);
    {d}
    eliminarAlum(alumnos,dimL);
    {e}
    eliminarCeros(alumnos,dimL);
end.