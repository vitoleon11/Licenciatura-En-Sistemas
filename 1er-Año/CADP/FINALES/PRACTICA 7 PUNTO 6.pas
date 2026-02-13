{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2:
planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados.
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse). La
estructura generada debe mantener el orden en que fueron leídos los datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
}

program gork;
type 
    objeto = record
        codigo : integer;
        categoria:integer;
        nombreObj:string;
        distanciaTierra:real;
        nombreDes:string;
        anio:integer;
    end;
    
    lista = ^nodo;
    nodo = record
        dato:objeto;
        sig:lista;
    end;

    vector = array [1..7] of integer;

    procedure inicializarVector(var v : vector);
    var
        i:integer;
    begin
        for i := 1 to 7 do begin
            v[i] := 0;
        end;
    end;

    procedure leerObjeto(var o : objeto);
    begin
        readln(o.codigo);
        if (o.codigo <> -1) then begin 
            readln(o.categoria);
            readln(o.nombreObj);
            readln(o.distanciaTierra);
            readln(o.nombreDes);
            readln(o.anio);
        end;
    end;


    procedure agregarAtras(var l:lista; o:objeto);
    var
        nue, act: lista;
    begin
        new(nue);
        nue^.dato := o;
        nue^.sig := nil;

        if (l = nil) then
            l := nue
        else begin
            act := l;
            while (act^.sig <> nil) do
                act := act^.sig;
            act^.sig := nue;
        end;
    end;


    procedure cargarLista(var l : lista);
    var 
        o:objeto;
    begin
        leerObjeto(o);
        while (o.codigo <> -1 ) do begin
            agregarAtras(l,o);
            leerObjeto(o);
        end;
    end;

    function masPares(num:integer):boolean;
    var
        dig,pares,impares:integer;
    begin
        impares := 0;
        pares := 0;
        while (num <> 0) do begin
            dig := num MOD 10;
            if (dig MOD 2 = 0) then
                pares := pares + 1
            else
                impares:= impares + 1;
            num := num DIV 10;
        end;
        masPares := pares > impares;
    end;

    procedure procesarTodo(l:lista; var v : vector);
    var
        maxDis1,maxDis2:real;
        maxCod1,maxCod2, cantGalilei:integer;
        aux:lista;
    begin
        aux := l;
        maxDis1 := -1;
        maxDis2 := -1;
        cantGalilei := 0;
        maxCod1 := -1;
        maxCod2 := -1;
        while (aux <> nil ) do begin
            //INCISO B1
            if (aux^.dato.distancia > maxDis1) then begin
                maxDis2 := maxDis1;
                maxCod2 := maxCod1;
                maxDis1 := aux^.dato.distancia;
                maxCod1 := aux^.dato.codigo;
            end
            else if (aux^.dato.distancia > maxDis2) then begin
                    maxDis2 := aux^.dato.distancia;
                    maxCod2 := aux^.dato.codigo;
            end;
            // INCISO B2
            if (aux^.dato.anio < 1600) AND (aux^.dato.nombreDes = 'Galileo Galilei') AND (aux^.dato.categoria = 2) then
                cantGalilei := cantGalilei + 1;
            //INCISO B3
            v[aux^.dato.categoria] := v[aux^.dato.categoria] + 1;
            //INCISO B4
            if (masPares(aux^.dato.codigo)) AND (aux^.dato.categoria = 1) then
                writeln('Nombre de la estrella: ', aux^.dato.nombreObj)
            aux := aux^.sig;
        end;
    end;
var
    l:lista;
    v:vector;
begin
    l := nil;
    cargarLista(l);
    inicializarVector(v);
    procesarTodo(l,v);
end.
