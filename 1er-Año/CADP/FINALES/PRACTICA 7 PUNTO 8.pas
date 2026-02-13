{

8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de
transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año
2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta 
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1:
alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura no posee
orden alguno.
Se pide:

a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que
las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales
el número de cuenta destino posea menos dígitos pares que impares.
}
program gork;
type
    transferencia = record
        numOrigen : integer;
        dniOrigen:integer;
        numDestino:integer;
        dniDestino:integer;
        dia:integer;
        mes:integer;
        hora:string;
        monto:real;
        codigo:integer;
    end;

    lista = ^nodo;  //SE DISPONE
    nodo = record
        dato:transferencia;
        sig:lista;
    end;
    
    lista2= ^nodo2;
    nodo2 = record
        dato:transferencia;
        sig:lista2;
    end;
    
    vectorMotivo = array [1..7] of integer; 

    procedure inicializarVector(var v: vectorMotivo);
    var
        i:integer
    begin
        for i := 1 to 7 do begin
            v[i] := 0;
        end;
    end;

    procedure insertarOrdenado(var l2 : lista2; t:transferencia);
    var
        nue,act,ant:lista2;
    begin
        new(nue);
        nue^.dato := t;
        nue^.sig := nil;
        if (l2 = nil) OR (t.numOrigen <= l2^.dato.numOrigen) then begin
            nue^.sig := l2;
            l2:= nue;
        end
        else begin
                ant := l2;
                act:= l2^.sig;
                while (act <> nil) and (act^.dato.numOrigen < t.numOrigen) do begin
                    ant := act;
                    act := act^.sig;
                end;
                ant^.sig := nue;
                nue^.sig := act;
        end;
    end;

    procedure cargarLista2(var l2:lista2;l:lista);
    var
        aux:lista;
    begin
        aux := l;
        while (aux <> nil ) do begin
            if (aux^.dato.dniOrigen <> aux^.dato.dniDestino) then
                insertarOrdenado(l2,aux^.dato);
            aux := aux^.sig;
        end;
    end;

    function menosPares(num:integer):boolean;
    var
        dig,pares,impares:integer;
    begin
        pares := 0;
        impares := 0;
        while (num <> 0) do begin
            dig := num MOD 10;
            if (dig MOD 2 = 0) then
                pares:= pares + 1
            else
                impares := impares +1;
            num := num DIV 10;
        end;
        menosPares := pares < impares;
    end;
    procedure procesarTodo(l2:lista2; var v :vectorMotivo);
    var
        aux:lista2;
        montoTotal:real;
        origenActual,maxCodigo,maxCant,cantTerceros,i: integer;
    begin
        aux := l2;
        cantTerceros := 0;
        while (aux <> nil) do begin
            //inciso B
            origenActual := aux^.dato.numOrigen;
            montoTotal := 0;
            while (aux <> nil) AND (aux^.dato.numOrigen = origenActual) do begin
                montoTotal := montoTotal + aux^.dato.monto;
                //INCISO C
                v[aux^.dato.codigo] := v[aux^.dato.codigo] + 1;
                //INCISO C
                if (aux^.dato.mes = 6) AND (menosPares(aux^.dato.numDestino)) then
                    cantTerceros := cantTerceros + 1;
                aux := aux^.sig;
            end;
            writeln('El monto total de esta cuenta fue de $', montoTotal);
            writeln('Cantidad de transferencias en junio con menos pares que impares: ', cantTerceros);
        end;
        //INCISO C
        maxCodigo := -1;
        maxCant := -1;
        for i := 1 to 7 do begin
            if (v[i] > maxCant) then begin
                maxCodigo := i;
                maxCant := v[i];
            end;
        end;
    end;

var
    l:lista;
    l2:lista2;
    v:vectorMotivo;
begin 
    l2:= nil;
    cargarLista2(l2,l);
    inicializarVector(v);
    procesarTodo(l2,v);
    end;
