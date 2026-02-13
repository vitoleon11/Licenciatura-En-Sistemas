{Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce número de venta, 
cantidad de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura
con las ventas cuya cantidad de productos tenga más dígitos pares que impares. En la estructura generada deben quedar almacenadas 
las ventas de tipo de pago efectivo antes que las de tipo de pago con tarjeta.}


program Hello;
type
    venta = record
        num : integer;
        cantidad:integer;
        tipoPago:String;
    end;
    
    lista = ^nodo;
    nodo = record   {SE DISPONE}
        dato:venta;
        sig:lista;
    end;
    
    lista2 = ^nodo2;
    nodo2 = record
        dato:venta;
        sig:lista2;
    end;
    
begin
    
end.
