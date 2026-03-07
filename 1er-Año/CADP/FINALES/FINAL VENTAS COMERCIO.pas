{Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce 
número de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa 
que genere una segunda estructura con las ventas cuya cantidad de productos tenga más dígitos pares que 
impares. En la estructura generada deben quedar almacenadas  las ventas de tipo de pago efectivo antes que
las de tipo de pago con tarjeta.}

program final;
type
    empresa = record
        num:integer;
        cantidad:integer;
        tipo: string;
    end;

    lista = ^nodo; //se dispone
    nodo = record
        dato:empresa;
        sig:lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato:empresa;
        sig:lista2;
    end; 

    procedure cargarLista(var l:lista); //se dispone

    procedure agregarEfectivo(var l:lista2;e:empresa);
    var
        nue:lista2;
    begin
        new(nue);
        nue^.dato := e;
        nue^.sig := l;
        l := nue;
    end;

    procedure agregarTarjeta(var l:lista2;var ult:lista2;e:empresa);
    var
        nue:lista2;
    begin
        new(nue);
        nue^.dato := e;
        nue^.sig := nil;
        if (l = nil) then 
            l := nue
        else
            ult^.sig := nue;
        ult := nue;
    end;

    function masPares(num:integer):boolean;
    var
        dig,pares,impares:integer;
    begin
        pares := 0;
        impares := 0;
        while (num <> 0 ) do begin
            dig := num mod 10;
            if (dig mod 2 = 0) then 
                pares := pares + 1
            else
                impares := impares + 1;
            num := num div 10;
        end;
        masPares := pares > impares;
    end;

    procedure cargarListas(l:lista;var l2:lista2);
    var
        aux:lista;
        ult :lista2;
    begin
        aux := l;
        ult := nil;
        l2 := nil;
        while (aux <> nil) do begin
            if (masPares(aux^.dato.cantidad)) then begin
                if (aux^.dato.tipo = 'efectivo') then
                    agregarEfectivo(l2,aux^.dato)
                else
                    agregarTarjeta(l2,ult,aux^.dato)
            end;
            aux := aux^.sig;
        end;
    end;

var 
begin
    
end.
