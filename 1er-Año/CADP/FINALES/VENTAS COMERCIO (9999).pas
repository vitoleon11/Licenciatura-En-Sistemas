program gork;
type
    venta = record
        codVenta:integer;
        codProducto:integer;
        cantVendida:integer;
    end;

    lista = ^nodo;
    nodo = record
        dato:venta;
        sig:lista;
    end;

    procedure leerVenta(var v:venta);
    begin
        readln(v.codVenta);
        if (v.codVenta <> 9999) then begin
            readln(v.codProducto);
            readln(v.cantVendida);
        end;
    end;

    procedure insertarOrdenado(var l :lista;v:venta);
    var
        act,ant,nue:lista;
    begin
        new(nue);
        nue^.dato := v;
        act := l;
        ant := l;
        while (act <> nil) and (v.codProducto > act^.dato.codProducto) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            l := nue;
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure cargarLista(var l :lista);
    var
        v:venta;
    begin
        leerVenta(v);
        while (v.codVenta <> 9999) do begin
            insertarOrdenado(l,v);
            leerVenta(v);
        end;
    end;

    procedure informarVendidos(l:lista;cod:integer);
    var
        aux:lista;
        informe:false;
    begin
        informe := false;
        aux:=l;
        while (aux <> nil) and (aux^.dato.codProducto < cod) do begin
            aux := aux^.sig;
            while (aux <> nil) and (aux^.dato.codVenta = cod) do begin
                cant := cant + aux^.dato.cantVendida;
                aux := aux^.sig;
            end;
        end;
        writeln('La cantidad vendida fue', cant);
    end;

var
    l:lista;
    cod:integer;
begin
    l:= nil;
    cargarLista(l);
    readln(cod);
    informarVendidos(l,cod);
end.
