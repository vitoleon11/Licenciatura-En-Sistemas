{Se dispone de la información de los productos de un supermercado. De cada producto se tiene Código, Nombre, Rubro (1..20) y precio.
Se pide implementar un programa que guarde en una estructura adecuada los productos de los rubros que tengan 10 productos.}

program final;
type
    producto = record
        codigo:integer;
        nombre:string;
        rubro:integer;
        precio:real;
    end;

    lista = ^nodo; // se dispone
    nodo = record
        dato:producto;
        sig:lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record 
        dato:producto;
        sig:lista2;
    end;

    vContador = array [1..20] of integer;

    procedure cargarLista(var l:lista); //se dispone

    procedure inicializarVector(Var v:vContador);
    var
        i:integer;
    begin
        for i := 1 to 20 do begin
            v[i] := 0;
        end;
    end;

    procedure agregarAdelante(var l2 : lista2;p:producto);
    var
        nue:lista2;
    begin
        new(nue);
        nue^.dato := p;
        nue^.sig := l2;
        l2 := nue;
    end;

    procedure procesarLista(l:lista;var l2:lista2;var v:vContador);
    var
        aux:lista;
    begin
        aux := l;
        while (aux <> nil) do begin
            v[aux^.dato.rubro] := v[aux^.dato.rubro] + 1;
            aux := aux^.sig;
        end;
        aux := l;
        while (aux <> nil) do begin
            if (v[aux^.dato.rubro] = 10) then
                agregarAdelante(l2,aux^.dato);
            aux := aux^.sig;
        end;
    end;

var 
    l:lista;
    l2:lista2;
    v:vContador;
begin
    l := nil;
    l2 := nil;
    cargarLista(l); //Se dispone
    inicializarVector(v);
    procesarLista(l,l2,v);
end.
