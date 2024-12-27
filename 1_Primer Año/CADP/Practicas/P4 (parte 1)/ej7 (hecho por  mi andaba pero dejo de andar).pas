program ej7;
const 
  dimF=100;
type
  vector=array[1..dimF] of integer;
  //se podria solo hacer con un array de 0 a 9
  vectorDig=array[0..9] of integer;

procedure llenarVector(var v:vector; var dimL:integer);
var 
  i, num:integer;
begin 
    i:=1;
    num:=0;
    
    write('Ingresar un numero entero: ');
    readln(num);
    while(num<>-1) do begin 
        v[i]:=num;
        i:=i+1;
        dimL:=dimL+1;
        
        write('Ingresar otro numero entero: ');
        readln(num);
    end
end;


procedure cantOcurrencias(var v:vector; var d:vectorDig; dimL:integer);
var 
    i, num, dig:integer;
begin 
    num:=1;
    dig:=0;
    
    
    for i:=1 to dimL do begin 
        while(num<>0)do begin 
            num:=V[i];
            dig:=num mod 10;
            
            d[dig]:=d[dig] + 1;
            
            num:= num div 10;
        end;
        num:=1;
    end;
end;

procedure mostrarReultado(d:vectorDig);
var 
    i, max, digMasLeido:integer;
    
begin 
    max:=0; 
    digMasLeido:=0;
    
    for i:=0 to 9 do begin 
        if(d[i]>max) then begin
            max:=d[i];
            digMasLeido:=i;
        end;
        
        writeln('Numero ', i,': ',d[i],' veces');
    end;
    
    writeln();
    writeln('El digito mas leido fue el: ', digMasLeido);
    writeln('Los digitos que no tuvieron concurrencias son: ');
    for i:=0 to 9 do begin 
        if(d[i]=0) then begin
            if(i=9)then
                write(', ', i)
            else 
                write(', ', i, ', ');
        end;
    end;
end;

var 
  v:vector;
  vd:vectorDig;
  dimL:integer;
 
begin
    dimL:=0;

    llenarVector(v, dimL);
    cantOcurrencias(v, vd, dimL);
    mostrarReultado(vd);
end.