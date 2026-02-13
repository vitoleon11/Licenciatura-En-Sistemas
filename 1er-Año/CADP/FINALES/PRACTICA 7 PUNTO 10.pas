{
10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les
provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la
ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo de la empresa se
registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas dedicadas y la cantidad de
meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se
ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada empresa
se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código de
empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al
total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program gork;
type
    
    cultivo = record
        tipo:string;
        cantHectareas:integer;
        cantMeses:integer;
    end;

    vCultivos = array [1..20] of cultivo;

    empresa = record
        codigo:integer;
        nombreEmpresa:string;
        estOpriv:string;
        nombreCiudad:string;
        cultivos:vCultivos;
        dimL:integer;
    end;


    lista = ^nodo;
    nodo = record
        dato:empresa;
        sig:lista;
    end;

    procedure leerEmpresa(var e:empresa);
    var 
        c:cultivo;
    begin
        readln(e.codigo);
        if (e.codigo <> -1) then begin
            readln(e.nombreEmpresa);
            readln(e.estOpriv);
            readln(e.nombreCiudad);
            readln(c.cantHectareas);
            readln(c.tipo);
            readln(c.cantMeses);
            e.dimL := 0;
            while (e.dimL < 20) AND (c.cantHectareas <> 0) do begin
                e.dimL := e.dimL + 1;
                e.cultivos[e.dimL] := c;
                readln(c.cantHectareas);
                readln(c.tipo);
                readln(c.cantMeses);
            end;
        end;
    end;

    procedure agregarAdelante(var l:lista; e:empresa);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato := e;
        nue^.sig := l;
        l := nue;
    end;

    procedure cargarLista(var l:lista);
    var
        e:empresa;
    begin
        leerEmpresa(e);
        while (e.codigo <> -1 ) do begin
            agregarAdelante(l,e);
            leerEmpresa(e);
        end;
    end;

    function alMenosDos(num:integer):boolean;
    var
        ceros,dig:integer;
    begin
        ceros := 0;
        while (num <> 0) do begin
            dig := num MOD 10;
            if (dig = 0) then
                ceros := ceros + 1;
            num := num div 10;
        end;
        alMenosDos := ceros >= 2;
    end;

    procedure procesarTodo(l:lista);
    var
        aux:lista;
        esTrigo :boolean;
        i,hectareasSoja,cantHectareas,cantMesesMaiz,maxMaiz: integer;
        maxEmpresa:string;
        porcentaje:real;
    begin
        aux := l;
        hectareasSoja := 0;
        cantHectareas := 0;
        maxMaiz := -1;
        while (aux <> nil) do begin
            cantMesesMaiz := 0;
            esTrigo := false;
            //INCISO B
            if (aux^.dato.nombreCiudad = 'San Miguel del Monte') AND (alMenosDos(aux^.dato.codigo)) then begin
                i := 1;
                while (i <= aux^.dato.dimL) AND (not esTrigo) do begin
                    if (aux^.dato.cultivos[i].tipo = 'Trigo') then begin
                        esTrigo := true;
                        writeln('El nombre de la empresa es: ', aux^.dato.nombreEmpresa);
                    end;
                    i := i +1;
                end;
            end;
            //INCISO C
            for i := 1 to aux^.dato.dimL do begin
                if (aux^.dato.cultivos[i].tipo = 'soja') then
                    hectareasSoja := hectareasSoja + aux^.dato.cultivos[i].cantHectareas;
                cantHectareas := cantHectareas + aux^.dato.cultivos[i].cantHectareas;
                if (aux^.dato.cultivos[i].tipo = 'Maiz') then
                    cantMesesMaiz := aux^.dato.cultivos[i].cantMeses + cantMesesMaiz;
            end;
            //INCISO D
            if (cantMesesMaiz > maxMaiz) then begin
                maxMaiz := cantMesesMaiz;
                maxEmpresa := aux^.dato.nombreEmpresa;
            end;
            aux := aux^.sig;
        end;
        //INCISO C
        porcentaje := (hectareasSoja / cantHectareas) * 100;
        writeln('El porcentaje de hectareas de soja entre el total de todas las empresas es del %', porcentaje);
        //INCISO D
        writeln('La empresa que dedica mas tiempo al cultivo de maiz es: ', maxEmpresa);
    end;


    procedure incrementarMes(var l:lista);
    var
        aux:lista;
        i:integer;
    begin
        aux:= l;
        while (aux <> nil) do begin
            if (aux^.dato.estOpriv = 'Privada') then begin
                for i:= 1 to aux^.dato.dimL do begin
                    if (aux^.dato.cultivos[i].tipo = 'Girasol') AND (aux^.dato.cultivos[i].cantHectareas < 5) then
                        aux^.dato.cultivos[i].cantMeses := aux^.dato.cultivos[i].cantMeses +1;
                end;
            end;
            aux := aux^.sig;
        end;
    end;
var
    l:lista;
begin
    l := nil;
    cargarLista(l);
    procesarTodo(l);
    incrementarMes(l);
end.
