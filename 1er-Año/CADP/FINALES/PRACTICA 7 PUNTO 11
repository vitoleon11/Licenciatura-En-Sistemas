{
11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De cada
evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3: obra de
teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas para el evento 
y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. 
De cada venta se debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de entradas
adquiridas. La lectura de las ventas finaliza con código de venta -1.

2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares
y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.
}

program gork;
type 
    evento = record
        nombre:string;
        tipo:integer;
        lugar:string;
        maxPersonas:integer;
        costo:real;
    end;

    venta = record
        codigo:integer;
        numEvento:integer;
        dni:integer;
        cantEntradas:integer;
    end;

    vEventos = array [1..100] of evento; //SE DISPONE  

    vRecaudacion = array [1..100] of real;

    lista = ^nodo;
    nodo = record
        dato:venta;
        sig:lista;
    end;

    procedure inicilizarVector(var v:vRecaudacion);
    var
        i:integer;
    begin
        for i:= 1 to 100 do begin
            v[i] := 0;
        end;
    end;

    procedure leerVenta(var v:venta);
    begin
        readln(v.codigo);
        if (v.codigo <> -1) then begin
            readln(v.numEvento);
            readln(v.dni);
            readln(v.cantEntradas);
        end;
    end;

    procedure agregarAdelante(var l:lista;v:venta);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato := v;
        nue^.sig := l;
        l := nue;
    end;

    procedure cargarLista(var l : lista;var vR:vRecaudacion;vE:vEventos);
    var
        v:venta;
    begin
        leerVenta(v);
        while (v.codigo <> -1) do begin
            vR[v.numEvento] := vR[v.numEvento] + (v.cantEntradas * vE[v.numEvento].costo);
            agregarAdelante(l,v);
            leerVenta(v);
        end;
    end;

    function masPares(num:integer):boolean;
    var
        dig,pares,impares:integer;
    begin
        pares:= 0;
        impares := 0;

        while (num <> 0 ) do begin
            dig := num MOD 10;
            if (dig MOD 2 = 0 ) then
                pares := pares + 1
            else
                impares := impares + 1;
            num := num div 10;
        end;
        masPares := pares > impares;
    end;

    procedure procesarTodo(l:lista; vR:vRecaudacion; vE:vEventos);
    var
        aux:lista;
        minR1,minR2:real;
        minE1,minE2:string;
        cantEntradasDNI:integer;
    begin
        aux := l;
        minR1 := 99999;
        minR2 := 99999;
        cantEntradasDNI := 0;
        for i := 1 to 100 do begin
            if (vR[i] < minR1) then begin
                minR2 := minR1;
                minE2 := minE1;
                minR1 := vR[i];
                minE1 := vE[i].nombre;
            end
            else if (vR[i] < minR2) then begin
                    minR2 := vR[i];
                    minE2 := vE[i].nombre;
                end;
        end;
        cantEntradas50 := 0;
        while (aux <> nil) do begin
            if (masPares(aux^.dato.DNI)) AND (vE[aux^.dato.numEvento].tipo = 3) then begin
                cantEntradasDNI := cantEntradasDNI + aux^.dato.cantEntradas;
            end;
            if (aux^.dato.numEvento = 50) then  
                cantEntradas50 := cantEntradas50 + aux^.dato.cantEntradas;
            aux := aux^.sig;
        end;
        writeln('Los eventos con menos recaudación: ', minE1, ' y ', minE2);
        writeln('La cantidad de entradas de obras de teatro con compradores de DNI con mas pares fue: ', cantEntradasDNI);
        if (cantEntradas50 >= vE[50].maxPersonas) then
            writeln('La cantidad de entradas vendidas para este evento supera la cantidad maxima de personas')
        else
            writeln('La cantidad de entradas vendidas para este evento no supera la cantidad maxima de personas');
    end;

var
    l:lista;
    vR:vRecaudacion;
    vE:vEventos;
begin
    inicilizarVector(vR);
    l := nil;
    cargarLista(l,vR,vE);
    procesarTodo(l,vR,vE);
end.
