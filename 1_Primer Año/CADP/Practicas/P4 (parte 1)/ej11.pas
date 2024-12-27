program ej11;
const   
    dimF=2;//200
type

    informacion=record
        tituloFt:string;
        autorFt:string;
        cantMg:integer;
        cantClick:integer;
        cantComentarios:integer;
        end;
    
    vector=array[1..dimF] of informacion;

procedure leerDatos(var i:informacion);
begin 
    write('Ingrese el titulo de la foto: ');
    readln(i.tituloFt);
    write('Ingrese el autor de la foto: ');
    readln(i.autorFt);
    write('Ingrese la cantidad de me gustra de la foto: ');
    readln(i.cantMg);
    write('Ingrese la cantidad de click recividos: ');
    readln(i.cantClick);
    write('Ingrese la cantidad de comentarios de la foto: ');
    readln(i.cantComentarios);
end;

procedure guardarDatos(var i:informacion; var v:vector; x:integer);
begin
    v[x]:=i;
end;

procedure ftMasVista(var v:vector; var tituloFtMasVista:string; var ftMax:integer);
var 
    i:integer;
begin 

    for i:=1 to dimf do begin 
        if(v[i].cantClick>ftMax) then begin
            ftMax:=v[i].cantClick;
            tituloFtMasVista:=v[i].tituloFt;
        end;
    end;

end;

procedure mgArtVandelay(var v:vector; var cantTotalMg:integer);
var
    i:integer;
begin 
    for i:=1 to dimf do begin 
        if(v[i].autorFt='Art Vandelay')then begin
            cantTotalMg:=cantTotalMg+v[i].cantMg;
        end;
    end;
end;



var 
    i:informacion;
    v:vector;
    x, ftMax, cantTotalMg:integer;
    tituloFtMasVista:string;

begin 
    tituloFtMasVista:='';
    ftMax:=0;
    cantTotalMg:=0;
    
    for x:=1 to dimF do begin
        leerDatos(i);
        guardarDatos(i, v, x);
    end;
    
    ftMasVista(v, tituloFtMasVista, ftMax);
    mgArtVandelay(v, cantTotalMg);
    
    
    writeln('El titulo de la foto mas vista es: ', tituloFtMasVista);
    writeln('La cantidad total de MG de las fotos del autor Vandelay es de: ', cantTotalMg);
    
    writeln('cantidad de comentarios recibidos por publicacion: ');
    for x:=1 to dimF do begin 
        writeln('La publicacion ', x, ' ah recibido: ', v[x].cantComentarios, ' COMENTARIOS.');
    end;
    
    
end.