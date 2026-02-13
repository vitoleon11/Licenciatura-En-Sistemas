{Una inmobiliaria de la ciudad de La Plata necesita un programa para administrar información sobre los 
inmuebles que tuvo alquilados en el 2016. Para ello se dispone de la información de los inmuebles. De cada 
inmueble se conoce: código de inmueble, tipo de inmueble (1: monoambiente, 2: departamento, 3: casa, 4: local), 
DNI del dueño, DNI del inquilino y precio del alquiler. La lectura finaliza cuando se lee el inmueble con código 999. 
La información está almacenada de manera ordenada por DNI del dueño.

Procesar e informar:

Para cada dueño, la cantidad de inmuebles que tuvo alquilados con precio de alquiler superior a 5000.

El precio de alquiler promedio de aquellos inmuebles tipo departamento.}


program gork;
type
    inmueble = record
        codigo:integer;
        tipo :integer;
        dniDuenio : integer;
        dniInquilino : integer;
        precio: real;
    end;
    lista = ^nodo;
    nodo = record
        dato : inmueble;
        sig : lista;
    end;
    
    procedure leerInmueble(var i:inmueble);
    begin
        readln(i.codigo);
        if (i.codigo <> 999) then begin
            readln(i.tipo);
            readln(i.dniDuenio);
            readln(i.dniInquilino);
            readln(i.precio);
        end;
    end;
    
    procedure insertarOrdenado(var l : lista; i : inmueble);
    var
        nue,act,ant: lista;
    begin
        new(nue);
        nue^.dato := i;
        act := l;
        ant := l;
        while (act <> nil) AND (act^.dato.dniDuenio < i.dniDuenio) do begin 
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            l := nue
        else 
            ant^.sig := nue;
        nue^.sig := act;
        end;
   
    procedure cargarLista(var l : lista);
    var
        i:inmueble;
    begin
        leerInmueble(i);
        while (i.codigo <> 999) do begin
            insertarOrdenado(l,i);
            leerInmueble(i);
        end;
    end;
    
    procedure informarCantidad(l : lista);
    var
        aux : lista;
        dniAct, cant:integer;
    begin
        aux := l;
        cant := 0;
        while (aux <> nil) do begin
            dniAct := aux^.dato.dniDuenio;
            cant := 0;
            while (aux <> nil) AND (aux^.dato.dniDuenio = dniAct) do begin
                if (aux^.dato.precio > 5000) then 
                    cant := cant + 1;
                aux := aux^.sig;
            end;
            writeln('La cantidad de inmuebles de ', dniAct,' por mas de $5000 fue: ', cant);
        end;
    end;
    
    function promedioDepto(l : lista):real;
    var
        cant : integer;
        precio : real;
        aux : lista;
    begin
        aux := l;
        cant := 0;
        precio := 0;
        while (aux <> nil) do begin
            if (aux^.dato.tipo = 2) then begin
                cant := cant + 1;
                precio := precio + aux^.dato.precio;
            end;
            aux := aux^.sig;
        end;
        promedioDepto := precio / cant;
    end;
    
var
    l:lista;
begin
    l := nil;
    cargarLista(l);
    informarCantidad(l);
    promedioDepto(l);
end.








