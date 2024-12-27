program ej8;
const
    dimF=2;
type
    infoAlum=record
        numInscripcion:integer;
        dni:integer;
        apellido:string;
        nombre:string;
        anioNacimiento:integer;
    end;
    vector=array[1..dimF] of infoAlum;

procedure leerDatos(var i:infoAlum);
begin 
    
    write('Ingrese su numero de inscripcion: ');
    readln(i.numInscripcion);
    write('Ingrese su DNI: ');
    readln(i.dni);
    write('Ingrese su apellido: ');
    readln(i.apellido);
    write('Ingrese su nombre: ');
    readln(i.nombre);
    write('Ingrese su anio de nacimiento: ');
    readln(i.anioNacimiento);
    
end;

procedure cargarVector(var v:vector; i:infoAlum; z:integer);
begin 
    
    v[z]:=i;

end;

procedure dniCompuesto(var v:vector; var dniPar, cantAlumnos:integer; var porcAlum:real);
var 
    i, num, dig, cantDig, digPar:integer;
begin
    dniPar := 0;
    cantAlumnos := 0;
    
    for i := 1 to dimF do begin 
        num := v[i].dni;
        cantDig := 0; // Reiniciar la cuenta de dígitos
        digPar := 0;  // Reiniciar la cuenta de dígitos pares
        
        while (num > 0) do begin 
            dig := num mod 10;
            cantDig := cantDig + 1;
            if (dig mod 2 = 0) then
                digPar := digPar + 1;
            
            num := num div 10;
        end;
        
        if (cantDig = digPar) then
            dniPar := dniPar + 1;
        
        cantAlumnos := cantAlumnos + 1;
    end;
    
    porcAlum := (dniPar / cantAlumnos) * 100;
end;


procedure mayorEdad(var v:vector; var max1, max2:integer; var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2:string);
var 
    i:integer;
begin 
    
    for i:=1 to dimF do begin
        if(v[i].anioNacimiento>max1) then begin 
            max2:=max1;
            apellidoMax2:=apellidoMax1;
            nombreMax2:=nombreMax1;
            max1:=v[i].anioNacimiento;
            apellidoMAx1:=v[i].apellido;
            nombreMax1:=v[i].nombre;
        end
        else if(v[i].anioNacimiento>max2) then begin
            max2:=v[i].anioNacimiento;
            apellidoMAx2:=v[i].apellido;
            nombreMax2:=v[i].nombre;
        end;
    
    end;
end;


var 
    i:infoAlum;
    v:vector;
    z, dniPar, cantAlumnos, max1, max2:integer;
    apellidoMax1, apellidoMax2, nombreMax1, nombreMax2:string;
    porcAlum:real;
begin 
    porcAlum:=0;
    dniPar:=0;
    cantAlumnos:=0;
    max2:=0;
    max1:=0;
    apellidoMax2:='';
    apellidoMax1:='';
    nombreMax1:='';
    nombreMax2:='';
    
    
    
    for z:=1 to dimF do begin 
        leerDatos(i);
        cargarVector(v, i, z);
    end;
    
    dniCompuesto(v, dniPar, cantAlumnos, porcAlum);
    mayorEdad(v, max1, max2, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2);
    
    writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares es de: ', porcAlum:2:2, '%');
    writeln('APELLIDO Y NOMBRE DE LOS DOS ALUMNOS DE MAYOR EDAD');
    writeln('1- apellido: ', apellidoMAx1, ', nombre: ', nombreMax1);
    writeln('2- apellido: ', apellidoMAx2, ', nombre: ', nombreMax2);
    
end.