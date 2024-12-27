program ej4;
const 
    dimF=4;//1000
type
    infoAlumnos=record
        numAlum:integer;
        apellido:string;
        nombre:string;
        cantAsistencias:integer;
        end;
    vector=array[1..dimF] of infoAlumnos;


//ordeno de forma acendente el vector
procedure OrdenarVector(var v: vector; var dimL: integer);
var
  i, j: integer;
  temp: infoAlumnos;
begin
  for i := 1 to dimL do begin
    for j := 1 to dimL - i do begin
      if v[j].numAlum > v[j + 1].numAlum then begin
        // Intercambiar elementos
        temp := v[j];
        v[j] := v[j + 1];
        v[j + 1] := temp;
      end;
    end;
  end;
end;



procedure imprimirAlums(var v:vector; var diml:integer);
var 
    i:integer;
begin 
    for i:=1 to dimL do begin
        writeln();
        writeln('Num alum: ', v[i].numAlum, ' Nombre: ', v[i].nombre, ' Apellido: ', v[i].apellido, ' Cantidad de asistencias: ', v[i].cantAsistencias);
    end;
end;

procedure leerAlumnos(var v:vector; var dimL:integer);
var 
    i:integer;
begin
    for i:=1 to dimF do begin 
        writeln('ALUMNO ', i);
        write('Ingrese su numero de alumno: ');
        readln(v[i].numAlum);
        write('Ingrese su apellido: ');
        readln(v[i].apellido);
        write('Ingrese su nombre: ');
        readln(v[i].nombre);
        write('Ingrese la cantidad de asistencias que posee: ');
        readln(v[i].cantAsistencias);
        dimL:=dimL+1;
    end;
    OrdenarVector(v,dimL);
    imprimirAlums(v, dimL);
end;


//A) el alumno seguro existe
procedure encontrarAlum(var v:vector; var dimL:integer);
var
    i, num, pos:integer;
begin
    pos:=0;
    
    writeln();
    write('Ingrese el numero de alumno a buscar: ');
    readln(num);
    for i:=1 to dimL do begin 
        if(num=v[i].numAlum) then begin 
            pos:=i;
        end;
    end;
    writeln('la posicion del alumno con numero de alumno: ', num, ' es la: ', pos);
end;

//B)
procedure incertarAlum(var v:vector; var dimL:integer);
begin 
    writeln();
    dimL:=dimL+1;
    writeln('INGRESAR NUEVO ALUMNO');
    write('Ingrese su numero de alumno: ');
    readln(v[dimL].numAlum);
    write('Ingrese su apellido: ');
    readln(v[dimL].apellido);
    write('Ingrese su nombre: ');
    readln(v[dimL].nombre);
    write('Ingrese la cantidad de asistencias que posee: ');
    readln(v[dimL].cantAsistencias);
    
    OrdenarVector(v, dimL);
    imprimirAlums(v, dimL);
end;
    


//C)
procedure eliminarAlum(var v:vector; var dimL:integer);
var
    i, num, j, z:integer;
begin
    writeln();
    write('Ingrese la posicion de un alumno dentro del vector para eliminarlo: ');
    readln(num);
    for i:=1 to dimL do begin
        if(i=num) then begin
            for j:=i to dimL-1 do begin
                v[j]:=v[j+1];
            end;
            dimL:=dimL-1;
        end;
    end;
    writeln();
    writeln('El vector queda de la sigiente manera: ');
    for z:=1 to dimL do begin
        writeln('Num alum: ', v[z].numAlum, ' Nombre: ', v[z].nombre, ' Apellido: ', v[z].apellido, ' Cantidad de asistencias: ', v[z].cantAsistencias);
    end;
end;


//D) Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
procedure eliminarAlumNum(var v:vector; var dimL:integer);
var 
    i, j, z, num:integer;
    noEncontrado:boolean;
begin
    noEncontrado:=true;
    writeln();
    write('Ingresa el numero de alumno del alumno que quieras eliminar: ');
    readln(num);
    
    while (noEncontrado) do begin
        for i:=1 to dimL do begin 
            if(num=v[i].numAlum) then begin 
                noEncontrado:=false;
                for j:=i to dimL-1 do begin
                    v[j]:=v[j+1]
                end;
                dimL:=dimL-1;
            end;
        end;
        if(noEncontrado) then begin 
            write('Numero no encontrado, ingresa otro numero de alumno del alumno que quieras eliminar: ');
            readln(num);
        end;
    end;
    
    writeln();
    writeln('El vector queda de la sigiente manera: ');
    for z:=1 to dimL do begin
        writeln('Num alum: ', v[z].numAlum, ' Nombre: ', v[z].nombre, ' Apellido: ', v[z].apellido, ' Cantidad de asistencias: ', v[z].cantAsistencias);
    end;
end;


//E) Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
procedure eliminarAsistencias0(var v:vector; var dimL:integer);
var 
    i, j, z:integer;
begin
    
    
    for i:=1 to dimL do begin 
        if(v[i].cantAsistencias=0) then begin
            for j:=i to dimL-1 do begin 
                v[j]:=v[j+1];
            end;
            dimL:=dimL-1;
        end;
    end;
    writeln();
    writeln('Eliminando los alumnos con cantidad de asistencias cero el vector queda de la sigiente manera: ');
    for z:=1 to dimL do begin
        writeln('Num alum: ', v[z].numAlum, ' Nombre: ', v[z].nombre, ' Apellido: ', v[z].apellido, ' Cantidad de asistencias: ', v[z].cantAsistencias);
    end;
    
end;

var
    
    v:vector;
    dimL:integer;
    
begin
    dimL:=0;
    leerAlumnos(v, dimL);
    encontrarAlum(v, dimL);
    incertarAlum(v, dimL);
    eliminarAlum(v, dimL);
    eliminarAlumNum(v, dimL);
    eliminarAsistencias0(v, dimL);
end.
