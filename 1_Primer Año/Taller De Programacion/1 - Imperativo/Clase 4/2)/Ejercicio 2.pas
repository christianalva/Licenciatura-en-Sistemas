{2. Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer e informar la cantidad de socios cuyos códigos se encuentran comprendidos
entre los valores leídos. Debe invocar a un módulo recursivo que reciba los valores
leídos y retorne la cantidad solicitada.
}
Program ImperativoClase3;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol; // Hijo izquierdo
                    HD: arbol; //Hijo Derecho
                 end;
     
procedure GenerarArbol (var a: arbol);
{ Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. }

  Procedure CargarSocio (var s: socio);
  var vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  
  begin
    s.numero:= random (51) * 100;
    If (s.numero <> 0)
    then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var 
	unSocio: socio;  
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;
 CargarSocio (unSocio);

 while (unSocio.numero <> 0)do begin
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio);
  end;

 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

procedure InformarSociosOrdenCreciente (a: arbol);
{ Informar los datos de los socios en orden creciente. }
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if ((a <> nil) and (a^.HI <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HI);
    writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
    if ((a <> nil) and (a^.HD <> nil))
    then InformarDatosSociosOrdenCreciente (a^.HD);
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

// B) ii
procedure InformarSociosOrdenDecreciente(a:arbol);

	procedure InformarDatosOrdenDecreciente(a:arbol);
	begin 
		if(a<>nil) then begin 
			InformarDatosOrdenDecreciente(a^.HD);
			writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
			InformarDatosOrdenDecreciente(a^.HI)
		end;
	end;
begin 
	writeln('----- Socios en orden decreciente por numero de socio ----->');
	writeln;
	InformarDatosOrdenDecreciente(a);
	writeln;
	writeln('//////////////////////////////////////////////////////////');
	writeln;
end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
{ Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

procedure AumentarEdadNumeroImpar (a: arbol);
{Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}
  
  function AumentarEdad (a: arbol): integer;
  var resto: integer;
  begin
     if (a = nil) 
     then AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then a^.dato.edad:= a^.dato.edad + 1;
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
          end;  
  end;

begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

//b) iii
procedure InformarExistenciaNombreSocio(a:arbol; nombre:string);
	
	procedure recorrerNombresSocios(a:arbol; nombre:string; var ok:boolean);
	begin 
		if(a=nil) then 
			ok:=false
		else begin
			if(a^.dato.nombre = nombre) then 
				ok:=true
			else begin 
				recorrerNombresSocios(a^.HI, nombre, ok);
				if(not ok) then
					recorrerNombresSocios(a^.HD, nombre, ok);
			end;
		end;
	end;

Var
	ok: boolean;
begin 
	ok:=false;
	recorrerNombresSocios(a, nombre, ok);
	writeln;
	if(ok) then  
		writeln('El socio con nombre: ', nombre, ' EXISTE.')
	else 
		writeln('El socio con nombre: ', nombre, ' NO EXISTE.');
	
end;


procedure InformarPromedioDeEdad(a:arbol; cant:integer);
	
	procedure sacarPromedio(a:arbol; var total:integer);
	begin 
		if(a<>nil)then begin 
			total:= total+a^.dato.edad;
			sacarPromedio(a^.HI, total);
			sacarPromedio(a^.HD, total);
		end;
	end;

var
	total:integer;
begin 
	total:=0;
	sacarPromedio(a, total);
	
	writeln;
	writeln('El promedio de edad es de: ', (total/cant):0:2)
	

end;



//b)iv
procedure InformarCantidadSocios(a:arbol);
	procedure recorrerArbolCant(a:arbol; var cant:integer);
	begin 
		if(a<>nil) then begin 
			cant:=cant+1;
			recorrerArbolCant(a^.HI, cant);
			recorrerArbolCant(a^.HD, cant);
		end;
	end;
var 
	cant:integer;
begin 
	cant:=0;
	recorrerArbolCant(a, cant);
	
	writeln;
	writeln('La cantidad de socios es de: ', cant);
	//LO MUEVO A ACA ADENTRO YA QUE TENGO LA CANTIDAD TOTAL DE SOCIOS Y NO LA TENDRIA QUE SACAR DE VUELTA 
	InformarPromedioDeEdad (a, cant); 

end;

//================================= I) ===============================
procedure numeroDeSocioMasGrande(a: arbol; var numero:integer);
begin
	if(a<>nil) then begin
		numeroDeSocioMasGrande(a^.HD, numero);// Buscar en el subárbol derecho
		if(a^.HD = nil) and (a^.dato.numero > numero) then //lo pongo de esta manera ya que si el hijo derecho llega a nil llegue al ultimo elemento del hijo con los elementos mas grandes
			numero:=a^.dato.numero;
			numeroDeSocioMasGrande(a^.HI, numero);
	end;
end;

//=============================== II) ================================
procedure numeroDeSocioMasChico(a:arbol; var s:socio);
begin 
	if(a^.HI = nil) then 
		s:=a^.dato
	else 
		numeroDeSocioMasChico(a^.HI, s);
		
end;

//============================ III) =================================
procedure buscarSocio(a:arbol; valor:integer; var ok:boolean);
begin 
	if(a<>nil) then begin
		buscarSocio(a^.HI, valor, ok);
		if(valor = a^.dato.numero) then 
			ok:= true
		else
			buscarSocio(a^.HD, valor, ok);
	end;
end;

//=========================== IV) ====================================
procedure buscarValoresComprendidos(a:arbol; min, max:integer; var cant:integer);
begin 
	if(a <> nil) then begin 
		if (a^.dato.numero >= min) and (a^.dato.numero <= max) then
			cant := cant + 1;

		// Continuar buscando en ambos subárboles si el valor está dentro del rango.
		if (a^.dato.numero > min) then
			buscarValoresComprendidos(a^.HI, min, max, cant);
		if (a^.dato.numero < max) then
			buscarValoresComprendidos(a^.HD, min, max, cant);
	end;
end;

var 
	a: arbol;
	nombre:string; 
	numero, valor, num1, num2, cantSocios:integer;
	socioChico:socio;
	ok:boolean;
Begin
  ok:=false;
  numero:=-1;
  cantSocios:=0;
  randomize;
  GenerarArbol (a);
  InformarSociosOrdenCreciente (a);
  InformarSociosOrdenDecreciente (a); 
  // b) ii
  InformarNumeroSocioConMasEdad (a);
  AumentarEdadNumeroImpar (a);
  //b) iii
  writeln('Ingresar un nombre: ');
  readln(nombre);
  //b)iv
  InformarExistenciaNombreSocio (a, nombre); 
  InformarCantidadSocios (a); 
  
  //============================= i) ==========================
  numeroDeSocioMasGrande(a, numero);
  writeln;
  writeln('El numero de socio mas grande es el: ', numero);
     
  //============================ ii) ==========================
  numeroDeSocioMasChico(a, socioChico);
  writeln;
  writeln;
  writeln('El socio con numero mas chico es: ');
  writeln('Numero: ', socioChico.numero, ', nombre: ', socioChico.nombre, ', edad: ', socioChico.edad, ' años');
  
  //=========================== iii) ==========================
  writeln;
  writeln;
  writeln('Ingrese un valor entero a buscar: ');
  read(valor);
  buscarSocio(a, valor, ok);
  if(ok) then 
	writeln('El socio con número ', valor, ' EXISTE.')
  else 
	writeln('El socio con número ', valor, ' NO EXISTE.');
  
  //========================== iv) ===========================
  
  writeln;
  writeln;
  writeln('Ingrese el primer valor: ');
  read(num1);
  writeln('Ingrese el segundo valor (mayor al primero): ');
  read(num2);
  buscarValoresComprendidos(a, num1, num2, cantSocios);
  writeln('La cantidad de socios con números entre ', num1, ' y ', num2, ' es: ', cantSocios);
  
  
End.
