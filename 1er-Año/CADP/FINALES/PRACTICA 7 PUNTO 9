{

    Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene:
    código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5:
    comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura
    no posee orden alguno.
    Se pide:
    a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe
    leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico,
    apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee
    el código de película -1 y la información viene ordenada por código de película.
    b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
    c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que
    impares en su DNI.
    d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como
    parámetro (el mismo puede no existir)

}

program gork;
type
    pelicula = record
        codPelicula: integer;
        titulo:string;
        codGenero:integer;
        puntaje:real;
    end;
    critica = record 
        dni:integer;
        apellido:string;
        nombre:string;
        codPelicula:integer;
        puntaje:real;
    end;

    vector = array [1..8] of real;

    lista = ^nodo; // se dispone
    nodo = record
        dato: pelicula;
        sig:lista;
    end;

    lista2 = ^nodo2;
    nodo2 = record
        dato: critica;
        sig:lista2;
    end;

    procedure inicializarVector(var v :vector);
    var
        i:integer;
    begin
        for i := 1 to 8 do begin
            v[i] := 0;
        end;
    end;

    procedure leerCritica(var c : critica);
    begin
        readln(c.codPelicula);
        if (c.codPelicula <> -1) then begin
            readln(c.dni);
            readln(c.apellido);
            readln(c.nombre);
            readln(c.puntaje);
        end;
    end;


    function mismaCantidad(num:integer):boolean;
    var
        dig,pares,impares:integer;
    begin
        pares := 0;
        impares:= 0;
        while (num <> 0) do begin
            dig := num MOD 10;
            if (dig MOD 2 = 0) then 
                pares := pares + 1
            else
                impares := impares + 1;
            num := num div 10;
        end;
        mismaCantidad := pares = impares;
    end;

    procedure actualizarLista(var l:lista;var v:vector);
    var
        c:critica;
        aux :lista;
        cant,codActual,i,codMax:integer;
        promedio,puntaje,maxCant: real;
        seActualizo : boolean;
    begin
        leerCritica(c);
        while (c.codPelicula <> -1) do begin
            aux := l;
            puntaje := 0;
            cant := 0;
            codActual := c.codPelicula;
            while (c.codPelicula <> -1) AND (c.codPelicula = codActual) do begin
                cant:= cant + 1;
                puntaje := c.puntaje + puntaje;
                //INCISO C
                if (mismaCantidad(c.dni)) then
                    writeln('El critico ', c.nombre,' ',c.apellido, ' tiene mismos pares e impares.');
                leerCritica(c);
            end;
            promedio := puntaje / cant;
            seActualizo := false;
            while (aux <> nil) AND (not seActualizo) do begin
                if (aux^.dato.codPelicula = codActual) then begin
                    seActualizo := true;
                    aux^.dato.puntaje := promedio;
                    v[aux^.dato.codGenero] := v[aux^.dato.codGenero] + puntaje;
                end
                else
                    aux := aux^.sig;
            end;
        end;
        codMax := -1;
        maxCant := -1;
        //INCISO B
        for i := 1 to 8 do begin
            if (v[i] > maxCant) then begin
                maxCant := v[i];
                codMax := i;
            end;
        end;
        writeln('El genero con mayor puntaje es ', codMax)
    end;


    procedure eliminarPelicula(var l:lista;codigo:integer);
    var
        act,ant:lista;
    begin
        act := l;
        ant:= nil;
        while (act <> nil) AND (act^.dato.codPelicula <> codigo) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act <> nil) then begin
            if (ant = nil) then
                l := act^.sig
            else
                ant^.sig := act^.sig;
            dispose(act);
        end
        else
            writeln('No se encontro la pelicula a eliminar.')
    end;
var
    l:lista;
    v:vector;
    codigo:integer;
begin
    inicializarVector(v);
    actualizarLista(l,v);
    readln(codigo);
    eliminarPelicula(l,codigo);
end.
