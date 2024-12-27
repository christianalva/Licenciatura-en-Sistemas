program ej5;
const
    dimF=2;//500
type
    infoClientes=record
        dia:integer;
        mes:integer;
        anio:integer;
        catMonotributo:char;
        codCiudad:integer;
        montoMensual:real;
    end;
    vector=array[1..dimF] of infoClientes;
    meses=array[1..12] of integer;
    anios=array[1990..2023] of integer;
    cat=array[1..6] of integer;
    ciudades=array[1..2400] of record
        codigo, cant:integer;
    end;
procedure leerInfo(var v:vector; var dimL:integer);
var 
    i:integer;
begin
    
    for i:=1 to dimF do begin 
        writeln();
        writeln('CLIENTE ', i);
        writeln('FECHA DE FIRMA DE CONTRATO: ');
        write('Ingrese el dia: ');
        readln(v[i].dia);
        write('Ingrese el mes: ');
        readln(v[i].mes);
        write('Ingrese el anio: ');
        readln(v[i].anio);
        if (v[i].dia>31) or (v[i].dia<1) or (v[i].mes<1) or (v[i].mes>12) or (v[i].anio>2023) or (v[i].anio<1990)then begin 
            repeat
                writeln('FECHA INCORRECTA, POR FAVOR INGRESE UNA NUEVA: ');
                write('Ingrese el dia: ');
                readln(v[i].dia);
                write('Ingrese el mes: ');
                readln(v[i].mes);
                write('Ingrese el anio: ');
                readln(v[i].anio);
            until (v[i].dia<=31) and (v[i].dia>=1) and (v[i].mes>=1) and (v[i].mes<=12) and (v[i].anio<=2023) and (v[i].anio>=1990);
        end;
        writeln('CATEGORIA DEL MONOTRIBUTO: ');
        write('Ingrese su cat de monotributo (entre A y F): ');
        readln(v[i].catMonotributo);
        if(v[i].catMonotributo<'A') or (v[i].catMonotributo>'F') then begin
            repeat
                writeln('CATEGORIA DEL MONOTRIBUTO INCORRECTA, POR FAVOR INGRESE UNA NUEVA: ');
                write('Ingrese su cat de monotributo (entre A y F): ');
                readln(v[i].catMonotributo);
            until (v[i].catMonotributo>='A') and (v[i].catMonotributo<='F');
        end;
        writeln('CODDIGO DE CIUDAD: ');
        write('Ingrese el codigo de ciudad (entre 1 y 2400): ');
        readln(v[i].codCiudad);
        if(v[i].codCiudad<1) or (v[i].codCiudad>2400) then begin
            repeat
                writeln('CODDIGO DE CIUDAD INVALIDO, POR FAVOR INGRESE UNO NUEVO: ');
                write('Ingrese el codigo de ciudad (entre 1 y 2400): ');
                readln(v[i].codCiudad);
            until (v[i].codCiudad>=1) and (v[i].codCiudad<=2400);
        end;
        writeln('MONTO MENSUAL ACORDADO EN EL CONTRATO: ');
        write('Ingrese el monto acordado en el contrato: ');
        readln(v[i].montoMensual);
        dimL:=dimL+1;
    end;    
        
end;

//A)
procedure cantContratos(var v:vector; var dimL:integer);
var 
    i, max, x, z, c, t, anioMax:integer;
    a:anios;
    m:meses;
    
begin 
    max:=0;  
    //INICIALIZO LOS VECTORES PARA QUE NO TENGAN BASURA
    for c:=1 to 12 do begin 
        m[c]:=0;
    end;
    for t:=1 to 2023 do begin 
        a[t]:=0;
    end;
    
    writeln();
    for x:=1990 to 2023 do begin
        for z:=1 to 12 do begin 
            for i:=1 to dimL do begin 
                if(x=v[i].anio) and (z=v[i].mes) then begin 
                    a[v[i].anio]:=a[v[i].anio]+1;
                    m[v[i].mes]:=m[v[i].mes]+1;
                end;
            end;
            if(m[z]>0) and (a[x]>0) then begin 
                writeln('En el mes ', z, ' del anio ', x , ' se firmaron: ', m[z], ' contratos');
            end;
            m[z]:=0;
        end;
        
        if((a[x]>0)) then
            writeln('En el anio ', x, ' se firmaron en total ', a[x], ' contratos');
            
        if(a[x]>=max) then begin
            max:=a[x];
            anioMax:=x;
        end;
    end;
    
    writeln();
    writeln('La mayor cantidad de contratos se firmo en el anio: ', anioMax);
end;

//B)
procedure cantClientesXcat(var v:vector; var dimL:integer);
var 
    i, x:integer;
    c:cat;
begin 
    //INICIALIZO
    for x:=1 to 6 do begin 
        c[x]:=0;
    end;
    for i:=1 to dimL do begin 
        if(v[i].catMonotributo='A') then
            c[1]:=c[1]+1;
        if(v[i].catMonotributo='B') then
            c[2]:=c[2]+1;
        if(v[i].catMonotributo='C') then
            c[3]:=c[3]+1;
        if(v[i].catMonotributo='D') then
            c[4]:=c[4]+1;
        if(v[i].catMonotributo='E') then
            c[5]:=c[5]+1;
        if(v[i].catMonotributo='F') then
            c[6]:=c[6]+1;
    end;
    
    writeln();
    writeln('La cantidad de clientes para la categoria A es de: ', c[1]);
    writeln('La cantidad de clientes para la categoria B es de: ', c[2]);
    writeln('La cantidad de clientes para la categoria C es de: ', c[3]);
    writeln('La cantidad de clientes para la categoria D es de: ', c[4]);
    writeln('La cantidad de clientes para la categoria E es de: ', c[5]);
    writeln('La cantidad de clientes para la categoria F es de: ', c[6]);
end;

//C)
procedure buscarCiudades(var v:vector; var dimL:integer);
var
    i, x, z, j,l, aux, aux2:integer;
    c:ciudades;
begin
    aux:=0;
    aux2:=0;
    //INICIALIZO
    for i:=1 to 2400 do begin
        c[i].codigo:=i;
        c[i].cant:=0;
    end;
    
    for x:=1 to dimL do begin 
        c[v[x].codCiudad].cant:= c[v[x].codCiudad].cant+1;
    end;
    
    for z:=1 to 2400-1 do begin 
        for j:=z+1 to 2400 do begin
            if(c[j].cant>c[z].cant) then begin
                aux:=c[z].cant;
                aux2:=c[z].codigo;
                c[z].cant:=c[j].cant;
                c[z].codigo:=c[j].codigo;
                c[j].cant:=aux;
                c[j].codigo:=aux2;
            end;
        end;
    end;
    
    writeln;
    writeln('OFICINAS CON MAOR CANTIDAD DE CLIENTES: ');
    for l := 1 to 10 do
    begin
        writeln('La oficina ', c[l].codigo, ' es la oficina numero ', l, ' con mas clientes; ', c[l].cant, ' en total');
    end;
end;


var
    dimL:integer;
    v:vector;
begin
    dimL:=0;
    
    leerInfo(v, dimL);
    cantContratos(v, dimL);
    cantClientesXcat(v, dimL);
    buscarCiudades(v, dimL);
end.