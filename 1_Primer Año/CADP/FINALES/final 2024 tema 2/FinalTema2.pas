program finale;


type

venta = record
	codigo : integer;
	pago : string;
	end;


lista = ^nodo;

nodo = record
	ventaa : venta;
	sig : lista;
	end;
	
procedure leer(var r : venta);
	begin
	writeln('lea un codigo');
	readln(r.codigo);
	if (r.codigo <> 0) then
		begin
		writeln('lea un medio de pago');
		readln(r.pago);
		end;
	end;


procedure agregarAdelante(var l : lista; r : venta);
	var
		nue : lista;
	begin
	new(nue);
	nue^.ventaa := r;
	nue^.sig := l;
	l := nue;
	end;


procedure cargarlista(var l : lista);
	var
		r: venta;
	begin
	leer(r);
	while (r.codigo <> 0) do
		begin
		agregarAdelante(l, r);
		leer(r);
		end;
	end;

function esPar(digito : integer) : boolean;
	var
		resto, par : integer;
	begin
	par := 0;
	while (digito <> 0) do
		begin
		resto := digito mod 10;
		if ((resto mod 2) = 0) then
			begin
			par := par + 1;
			end;
		digito := digito div 10;
		end;
	esPar := par >= 2;
	end;
	
procedure insertar(var l : lista; r : venta);
	var
		ant, act, nue : lista;
	begin
	new(nue);
	ant := l;
	act := l;
	nue^.ventaa := r;
	while (act <> nil) and (nue^.ventaa.pago <> 'tarjeta') do // este bucle se va a ejecutar siempre que act sea diferente a nulo y nue^.ventaa.pago sea diferente a tarjeta ya que si es pago en efectivo tiene q agregarlo a lo ultimo y eso seria cuando llega al final o cuando encuentra a otro pago en efectivo
		begin
		ant := act;
		act := act^.sig;
		end;
	if (ant = act) then
		begin
		l := nue;
		end
	else
		begin
		ant^.sig := nue;
		end;
	nue^.sig := act;
	end;

	
procedure armarlista(var l : lista; li : lista);
	begin
	while (li <> nil) do
		begin
		if esPar(li^.ventaa.codigo) then
			begin
			insertar(l, li^.ventaa);
			end;
		li := li^.sig;
		end;

	end;

var
	l, li : lista;
begin
l := nil;
li := nil;
cargarlista(li);
armarlista(l, li);
while (l <> nil) do
	begin
	writeln(l^.ventaa.pago);
	l := l^.sig;
	end;

end.
