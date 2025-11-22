program prac4punto5;
type
	rangoMes =1..12;
	rangoDias = 1..31;
	
	prestamo = record
		ISBN : integer;
		numSocio:integer;
		dia:rangoDias;
		mes:rangoMes;
		cantDias:integer;
	end;

	arbol1 = ^nodo1;
	nodo1 = record
		dato:prestamo;
		hi:arbol1;
		hd: arbol1;
	end;
	
	lista = ^nodoL;
	
	nodoL = record
		dato :prestamo;
		sig: lista;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		ISBN :integer;
		dato : lista;
		hi: arbol2;
		hd:arbol2;
	end;
	
	arbol3 = ^nodo3;
	nodo3 = record 
		ISBN : integer;
		cantidad: integer;
		hi : arbol3;
		hd: arbol3;
	end;
	
	arbol4 = ^nodo4;
	nodo4 = record
		ISBN:integer;
		cantidad:integer;
		hi:arbol4;
		hd:arbol4;
	end;
	
	procedure leerPrestamo(var p:prestamo);
	begin
		writeln('Ingrese ISBN');
		readln(p.ISBN);
		if (p.ISBN <> 0) then begin
			writeln('Ingrese numero de socio');
			readln(p.numSocio);
			writeln('Ingrese dia');
			readln(p.dia);
			writeln('Ingrese mes');
			readln(p.mes);
			writeln('Ingrese cantidad de dias');
			readln(p.cantDias);
		end;
	end;
	
	procedure cargarArbol1(var a1:arbol1;p:prestamo);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato.ISBN := p.ISBN;
			a1^.dato.numSocio := p.numSocio;
			a1^.dato.dia:= p.dia;
			a1^.dato.mes := p.mes;
			a1^.dato.cantDias := p.cantDias;
			a1^.hi := nil;
			a1^.hd := nil;
		end
		else if (p.ISBN < a1^.dato.ISBN) then
				cargarArbol1(a1^.hi,p)
			else 
				cargarArbol1(a1^.hd,p);
 	end;
	
	procedure agregarALaLista(var l: lista; p:prestamo);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato := p;
		nue^.sig := l;
		l := nue;
	end;
	
	procedure cargarArbol2(var a2 : arbol2; p:prestamo);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.ISBN := p.ISBN;
			agregarALaLista(a2^.dato,p);
			a2^.hi := nil;
			a2^.hd:= nil;
		end
		else if (p.ISBN < a2^.ISBN) then
				cargarArbol2(a2^.hi,p)
			else if (p.ISBN > a2^.ISBN) then
					cargarArbol2(a2^.hd,p)
				else
					agregarALaLista(a2^.dato,p);
	end;

	procedure procesarArboles(var a1:arbol1 ; var a2: arbol2);
	var
		p:prestamo;
	begin
		leerPrestamo(p);
		while (p.ISBN <> 0) do begin
			cargarArbol1(a1,p);
			cargarArbol2(a2,p);
			leerPrestamo(p);
		end;
	end;
	
	function maximoArbol1(a:arbol1):integer;
	begin
		if (a = nil) then
			maximoArbol1 := 0
		else if (a^.hd = nil) then
			maximoArbol1 := a^.dato.ISBN
			else
				maximoArbol1 := maximoArbol1(a^.hd);
	end;	

	function minimoArbol2(a: arbol2):integer;
	begin
		if (a = nil) then
			minimoArbol2 := -1
		else if (a^.hi = nil) then
			minimoArbol2 := a^.ISBN
			else 
				minimoArbol2 := minimoArbol2(a^.hi);
	end;
	
	function cantPrestamosArbol1(a:arbol1; num:integer):integer;
	begin
		if (a = nil) then
			cantPrestamosArbol1 := 0
		else if (num = a^.dato.numSocio) then
				cantPrestamosArbol1 := 1 + cantPrestamosArbol1(a^.hi,num) + cantPrestamosArbol1(a^.hd,num)
			else 
				cantPrestamosArbol1 := cantPrestamosArbol1(a^.hi,num) + cantPrestamosArbol1(a^.hd,num);
	end;
	
	function contarEnLista(l:lista;num:integer):integer;
	begin
		contarEnLista := 0;
		while (l <> nil) do begin
			if (l^.dato.numSocio = num) then
				contarEnLista := contarEnLista + 1;
			l := l^.sig;
		end;
	end;
	
	function cantPrestamosArbol2(a: arbol2; num:integer):integer;
	begin
		if (a = nil) then
			cantPrestamosArbol2 := 0
		else 
			cantPrestamosArbol2 := contarEnLista(a^.dato,num) + cantPrestamosArbol2(a^.hi,num) + cantPrestamosArbol2(a^.hd,num);
	end;
	
	procedure cargarArbol3(var a3 : arbol3; a1: arbol1);
	begin
		if (a3 = nil) then begin
			new(a3);
			a3^.ISBN := a1^.dato.ISBN;
			a3^.cantidad := 1; 
			a3^.hi := nil;
			a3^.hd := nil;
		end
		else if (a1^.dato.ISBN < a3^.ISBN) then
				cargarArbol3(a3^.hi,a1)
			else if (a1^.dato.ISBN > a3^.ISBN) then
					cargarArbol3(a3^.hd,a1)
				else
					a3^.cantidad := a3^.cantidad + 1;
	end;
	
	procedure procesarArbol3(var a3:arbol3;a1:arbol1);
	begin
		if (a1 <> nil) then begin
			cargarArbol3(a3,a1);
			procesarArbol3(a3,a1^.hi);
			procesarArbol3(a3,a1^.hd);
		end;
	end;
	
	function contarCantidadLista(l:lista):integer;
	begin
		contarCantidadLista := 0;
		while (l <> nil) do begin
			contarCantidadLista := contarCantidadLista + 1;
			l := l^.sig;
		end;
	end;
	procedure cargarArbol4(var a4:arbol4;a2:arbol2);
	begin
		if (a4 = nil) then begin
			new(a4);
			a4^.ISBN := a2^.ISBN;
			a4^.cantidad := contarCantidadLista(a2^.dato);
			a4^.hi:=nil;
			a4^.hd := nil;
		end
		else if (a2^.ISBN < a4^.ISBN) then
				cargarArbol4(a4^.hi,a2)
			else if (a2^.ISBN > a4^.ISBN) then
					cargarArbol4(a4^.hd,a2)
				else
					a4^.cantidad := a4^.cantidad + contarCantidadLista(a2^.dato);
	end;
	
	procedure procesarArbol4(var a4 :arbol4;a2 :arbol2);
	begin
		if (a2 <> nil) then begin
			cargarArbol4(a4,a2);
			procesarArbol4(a4,a2^.hi);
			procesarArbol4(a4,a2^.hd);
		end;
	end;
	
	function cantPrestamosEntreISBN1(a1:arbol1;ISBN1:integer;ISBN2:integer):integer;
	begin
		if (a1 = nil) then
			cantPrestamosEntreISBN1 := 0
		else if (a1^.dato.ISBN > ISBN1) AND ( a1^.dato.ISBN2 < ISBN2) then
				cantPrestamosEntreISBN1 := 
	end;
	
	
var
	a1: arbol1;
	a2:arbol2;
	a3: arbol3;
	a4:arbol4;
	num1,num2:integer;
begin
	a1:=nil;
	a2:=nil;
	procesarArboles(a1,a2);
	maximoArbol1(a1);
	minimoArbol2(a2);
	read(num1);
	cantPrestamosArbol1(a1,num1);
	read(num2);
	cantPrestamosArbol2(a2,num2);
	procesarArbol3(a3,a1);
	procesarArbol4(a4,a2);
	//imprimirArbol4(a4);
	read(ISBN1);
	read(ISBN2);
	cantPrestamosEntreISBN1(a1,ISBN1,ISBN2);
	read(ISBN1);
	read(ISBN2);
	cantPrestamosEntreISBN2(a2,ISBN1,ISBN2);
end.
