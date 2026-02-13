{
Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho
casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que
prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega una
persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:

a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.

b. Informar los dos códigos de género más elegidos.

c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
Invocar dicho módulo en el programa principal.

}


program Hello;
type
    
    persona = record
        dni : integer;
        apellido : string;
        nombre : string;
        edad : integer;
        codGenero: integer;
    end;
    
    lista = ^nodo;
    nodo = record
        dato:persona;
        sig : lista;
    end;
    
    vectorGeneros = array [1..5] of integer;
    
    procedure inicializarVector(var v: vectorGeneros);
    var
        i:integer
    begin
        for i := 1 to 5 do begin
            v[i] := 0;
        end;
    end;
        
    procedure leerPersona(var p : persona);
    begin
        readln(p.dni);
        readln(p.apellido);
        readln(p.nombre);
        readln(p.edad);
        readln(p.codGenero);
    end;
    
    procedure agregarAdelante(var l : lista;p : persona);
    var
        nue : lista;
    begin
        new(nue);
        nue^.dato := p;
        nue^.sig := l;
        l := nue;
    end;

    function masPares(dni:integer):boolean;
    var
        pares,impares,dig:integer;
    begin
        pares := 0;
        impares := 0;
        masPares := false;
        while (dni <> 0) do begin
            dig := dni MOD 10;
            if (dig MOD 2 = 0) then
                pares := pares + 1
            else
                impares := impares + 1;
            dni := dni div 10;
        end;
        if (pares > impares) then
            masPares := true;
    end;
    
    function cantidadPares(l:lista):integer;
    var
        aux : lista;
        cant:integer;
    begin
        aux := l;
        cant := 0;
        while (aux <> nil) do begin
            if (masPares(aux^.dato.dni)) then
                cant := cant + 1;
            aux := aux^.sig;
        end;
        cantidadPares := cant;
    end;
    
    procedure maximosCodigos(v:vectorGeneros,var cod1:integer;var cod2:integer);
    var
        max1,max2,i:integer;
    begin
        max1 := -1;
        max2 := -1;
        for i := 1 to 5 do begin
            if (v[i] > max1) then begin
                max2 := max1;
                max1 := v[i];
                cod2 := cod1;
                cod1 := i;
            end
            else if (v[i] > max2) then begin
                    max2 := v[i];
                    cod2 := i;
                end;
        end;
    end;
    
    procedure eliminarDNI(var l:lista; dni:integer);
    var
        ant,act: lista;
    begin
        act := l;
        while (act <> nil) AND (act^.dato.dni <> dni) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act <> nil) then begin
            if (act = l) then   
                l := l^.sig
            else
                ant^.sig := act^.sig;
            dispose(act);
        end;
    end;
    
    procedure procesarTodo(var l : lista; var v: vectorGeneros);
    var
        p:persona;
        cod1,cod2,dni:integer;
    begin
        cod1:=0;
        cod2 := 0;
        repeat 
            leerPersona(p);
            v[p.codGenero] := v[p.codGenero] + 1;
            agregarAdelante(l,p)
        until (p.dni = 33555444);
        writeln('La cantidad de DNI con mas digitos pares son: ', cantidadPares(l));
        maximosCodigos(v,cod1,cod2);
        writeln('Los dos codigos maximos fueron ', cod1, ' y ', cod2);
        writeln('Ingrese un dni');
        readln(dni);
        eliminarDNI(l,dni);
    end;





var
    l:lista;
begin   
    l := nil;
    procesarTodo(l);
end.





