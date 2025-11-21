program punto3Practica4;
type

	producto = record
		codigo:integer;
		cantTotal:integer;
		montoTotal:real;
	end;
	
	venta = record
		codVenta: integer;
		codP : integer;
		cantUnidades: integer;
		precioU:real;
	end;

	arbol = ^nodo;
	nodo = record
		dato : producto;
		HI : arbol;
		HD : arbol;
	end;
	
	procedure leerVenta(var v: venta);
	begin
		writeln('Ingrese codigo de venta');
		readln(v.codVenta);
		if (v.codVenta <> -1) then begin
			readln(v.codP);
			readln(v.cantUnidades);
			readln(v.precioU);
		end;
	end;
	
	procedure insertar(var a: arbol; v: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codigo := v.codP;
			a^.dato.cantTotal := v.cantUnidades;
			a^.dato.montoTotal := v.precioU;
			a^.HI := nil;
			a^.HD := nil;
		end
		else 
			if (v.codP = a^.dato.codigo) then begin
				a^.dato.cantTotal := a^.dato.cantTotal + v.cantUnidades;
				a^.dato.montoTotal := a^.dato.montoTotal + v.precioU;
			end
			else 
				if (v.codP < a^.dato.codigo) then
					insertar(a^.HI, v)
				else
					insertar(a^.HD, v);
	end;
	
	procedure cargarVentas(var a : arbol);
	var
		v:venta;
	begin
		leerVenta(v);
		while (v.codVenta <> -1) do begin
			insertar(a,v);
			leerVenta(v);
		end;
	end;

	procedure imprimirOrdenado(a : arbol);
	begin
		if (a <> nil) then begin
			imprimirOrdenado(a^.HI);
			writeln('Codigo: ', a^.dato.codigo, 'Cantidad total: ', a^.dato.cantTotal, 'Monto: ', a^.dato.montoTotal);
			imprimirOrdenado(a^.HD);
		end;
	end;
	
	function devolverMaximo(a:arbol):integer;
	begin
		if (a^.HD = nil) then
			devolverMaximo := a^.dato.codigo
		else
			devolverMaximo := devolverMaximo(a^.HD);
	end;
	
	function devolverCantCodigos(a:arbol; valor:integer):integer;
	begin
		if (a = nil) then 
			devolverCantCodigos := 0
		else if (a^.dato.codigo >= valor) then
				devolverCantCodigos := devolverCantCodigos(a^.HI,valor)
			else
				devolverCantCodigos := 1 + devolverCantCodigos(a^.hi,valor) + devolverCantCodigos(a^.hd,valor);
	end;
	
	function retornarMontoTotal(a:arbol;v1:integer;v2:integer):real;
	begin
		if (a = nil) then
			retornarMontoTotal := 0
		else if (a^.dato.codigo > v1) and (a^.dato.codigo < v2) then
				retornarMontoTotal := a^.dato.montoTotal + retornarMontoTotal(a^.HD,v1,v2) + retornarMontoTotal(a^.HI,v1,v2)
			else if (a^.dato.codigo >= v2) then
				retornarMontoTotal := retornarMontoTotal(a^.HI,v1,v2)
			else 
				retornarMontoTotal := retornarMontoTotal(a^.HD,v1,v2);
	end;
	
var
	a: arbol;
	valor,v1,v2: integer;
begin
	a := nil;
	cargarVentas(a);
	imprimirOrdenado(a);
	writeln('El codigo del producto con mayor cantidad de ventas es: ', devolverMaximo(a));
	writeln('Ingrese un valor: ');
	readln(valor);
	writeln('La cantidad de codigos menores que el valor es: ', devolverCantCodigos(a,valor));
	writeln('Ingrese valor 1:');
	readln(v1);
	writeln('Ingrese valor 2:');
	readln(v2);
	writeln('El monto total entre estos dos codigos fue de :', retornarMontoTotal(a,v1,v2))
end.
