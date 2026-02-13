
program gork; 
type
    venta = record 
      codVenta:integer; 
      codProducto: integer; 
      cantVendida:integer; 
    end; 
    lista =^nodo; 
    nodo = record 
      dato :venta; 
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

    procedure insertarOrdenado(var l :lista; v:venta);
    var
        nue, ant, act: lista;
    begin
        new(nue);
        nue^.dato := v;
        nue^.sig := nil;
    
        if (l = nil) or (v.codProducto < l^.dato.codProducto) then begin
            nue^.sig := l;
            l := nue;
        end
        else begin
            ant := l;
            act := l^.sig;
            while (act <> nil) and (act^.dato.codProducto < v.codProducto) do begin
                ant := act;
                act := act^.sig;
            end;
            ant^.sig := nue;
            nue^.sig := act;
        end;
    end;

    procedure procesarLista (var l: lista);
    var
        v: venta;
    begin
        leerVenta(v);
        while (v.codVenta <> 9999) do begin
            insertarOrdenado(l,v);
            leerVenta(v);
        end;
    end;
    
    function informarCantidad(l:lista;codProducto:integer):integer;
    var
        cant :integer;
    begin
        cant := 0;
        while (l <> nil) AND (l^.dato.codProducto < codProducto) do begin
            l := l^.sig;
        end;
        while (l <> nil) AND (l^.dato.codProducto = codProducto) do begin
            cant := cant + l^.dato.cantVendida;
            l := l^.sig;
        end;
        informarCantidad := cant;
    end;

var
    l :lista;
    codigo:integer;
begin
    l := nil;
    procesarLista(l);
    writeln('Ingrese un codigo de producto para saber cantidad de ventas');
    readln(codigo);
    writeln('La cantidad de ventas de este codigo de producto fueron ', informarCantidad(l,codigo));
end.
