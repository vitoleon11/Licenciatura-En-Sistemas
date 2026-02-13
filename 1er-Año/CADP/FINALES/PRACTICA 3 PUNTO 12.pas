{
El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece:
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con
información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el
nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción.
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI.

}
program gork;
type
    cliente = record
        nombre:string;
        dni:integer;
        edad:integer;
        tipo:integer;
    end;

    clienteSuscrito = record
        nombre:string;
        dni:integer;
    end;

    vectorCosto = array [1..4] of real; //se dispone
    vectorGanancia = array [1..4] of real;
    vectorClientes = array [1..4] of integer;

    lista = ^nodo;
    nodo = record
        dato : cliente;
        sig:lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato:cliente;
        sig:lista;
    end;

    procedure inicializarVectores(var vG:vectorGanancia;var vCli:vectorClientes);
    var
        i:integer;
    begin
        for i := 1 to 4 do begin
            vG[i] := 0;
            vCli[i] := 0;
        end;
    end;

    procedure leerCliente(var c:cliente);
    begin
        readln(c.dni);
        if (c.dni <> 0) then begin
            readln(c.nombre);
            readln(c.edad);
            readln(c.tipo);
        end;
    end;

    procedure agregarAdelante(var l:lista;c:cliente);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato := c;
        nue^.sig:= l;
        l := nue;
    end;

    procedure cargarLista(var l: lista;var vG:vectorGanancia;var vCli:vectorClientes;vC:vectorCosto);
    var
        c:cliente
    begin
        leerCliente(c);
        while (c.dni <> 0 ) do begin
            agregarAdelante(l,c);
            vG[c.tipo] := vG[c.tipo] + vC[c.tipo];
            vCli[c.tipo] := vCli[c.tipo] + 1;
            leerCliente(c);
        end;
    end;

    procedure procesarTodo(vG:vectorGanancia;vCli:vectorClientes);
    var
        fortacos:real;
        maxSub1,maxSub2,max1,max2:integer;
    begin
        aux := l;
        fortacos := 0;
        max2 := -1;
        max1:= -1;
        for i := 1 to 4 do begin
            fortacos := fortacos + vG[i];
            if (vCli[i] > max1) then begin
                max2 := max1;
                maxSub2 := maxSub1;
                max1 := vCli[i];
                maxSub1 := i;
            end
            else if (vCli [i] > max2) then begin
                    max2 := vCli[i];
                    maxSub2 := i;
                end; 
        end;
        writeln('La ganancia total de fortacos es de ', fortacos);
        writeln('Los que tienen max suscripciones son ', maxSub1, ' y ', maxSub2);
    end;

    procedure insertarOrdenado(var l2 :lista2;c:cliente)
    var
        nue,ant,act:lista2;
    begin
        new(nue);
        nue^.dato.nombre := c.nombre;
        nue^.dato.dni := c.dni;
        nue^.sig := nil;
        if (l2 = nil) OR (v.dni < l2^.dato.dni) then begin
            nue^.sig := l2;
            l2:= nue;
        end
        else begin
                ant := l2;
                act:= l2^.sig;
                while (act <> nil) AND (act^.dato.dni < c.dni) do begin
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
        while (aux <> nil) do begin
            if (aux^.dato.edad > 40) then begin
                if (aux^.dato.tipo = 3) OR (aux^.dato.tipo = 4) then begin
                    insertarOrdenado(l2,aux^.dato);
            end;
            aux := aux^.sig;
        end;
    end;

var
    l:lista;
    l2:lista2;
    vG:vectorGanancia;
    vCli:vectorClientes;
    vCosto:vectorCosto;
begin
    l := nil;
    inicializarVectores(vG,vCli);
    cargarLista(l,vG,vCli,vCosto);
    procesarTodo(vG,vCli);
    l2 := nil;
    cargarLista2(l2,l);
end.
