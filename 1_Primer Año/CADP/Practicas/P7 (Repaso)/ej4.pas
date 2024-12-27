program ej4;
const 
    dimF=42;
type  
    pesoSemana=record
        peso:real;
    end;
    vector=array[1..dimF] of pesoSemana;
    pacientes=record
        nombre:string;
        apellido:string;
        pesoS:vector;
    end;
    lista=^nodo;
    nodo=record
        dato:pacientes;
        sig:lista;
    end;
    
procedure imprimir(l:lista);
var
    i:integer;
begin 
    while(l<>nil) do begin 
        writeln;
        writeln('Nombre: ', l^.dato.nombre);
        writeln('Apellido: ', l^.dato.apellido);
        for i:=1 to dimF do begin
            writeln('Peso semana ', i, ': ', l^.dato.pesoS[i].peso:2:2);
        end;
        
        l:=l^.sig;
    end;
end;

procedure leerDato(var l:lista);
var 
    aux, ult:lista;
    nom:string;
    i:integer;
begin 
    nom:='';
    l:=nil;
    aux:=l;
    ult:=nil;
    
    while(nom<>'zzz') do begin 
        writeln;
        write('Ingrese el nombre de la paciente: ');
        readln(nom);
        if(nom<>'zzz') then begin 
            new(aux); // Crea un nuevo nodo en la memoria y asigna su dirección a "aux"
            aux^.sig := nil; // Inicializa el puntero "sig" del nodo "aux" como nulo
            
            aux^.dato.nombre:=nom;
            write('Ingrese el apellido de la paciente: ');
            readln(aux^.dato.apellido);
            for i:=1 to dimF do begin 
                writeln;
                write('Ingrese el peso de la semana ', i, ': ');
                readln(aux^.dato.pesoS[i].peso);
            end;
            
            if (ult = nil) then // Comprobación: si "ult" (puntero al último nodo) es nulo, significa que es el primer nodo
                l := aux // Asigna el nodo "aux" como el primer nodo de la lista "l"
            else
                ult^.sig := aux; // Enlaza el nodo "aux" al último nodo (apuntado por "ult") de la lista
            ult := aux; // Actualiza "ult" para apuntar al último nodo agregado
        end;
    end;
    imprimir(l);
end;

//A)
procedure mayorAument(l:lista);
var 
    i, senMax:integer;
    pesoMax, total:real;
begin 
    senMax:=0;
    pesoMax:=0;
    total:=0;
    
    while(l<>nil) do begin 
        for i:=1 to dimF do begin 
            if(l^.dato.pesoS[i].peso>pesoMax) then begin 
                senMax:=i;
                pesoMax:=l^.dato.pesoS[i].peso;
            end;
            total:=total+l^.dato.pesoS[i].peso;
        end;
        writeln;
        writeln('La semana de mayor aumento de la pasiente: ', l^.dato.nombre, ' fue la semana: ', senMax);
        writeln('Y en total tuvo un aumento de peso de: ', total:2:2, 'kg.');
        l:=l^.sig;
        senMax:=0;
        pesoMax:=0;
        total:=0;
    end;

end;





var
    l:lista;
begin 
    leerDato(l);
    mayorAument(l);
end.