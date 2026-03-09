{Se dispone de la información de los participantes inscriptos a una carrera (a lo sumo 5000). 
De cada participante se tiene DNI, nombre y apellido, categoría (1..5) y fecha de inscripción. 
Se pide implementar un programa que guarde en una estructura adecuada los participantes de aquellas 
categorías que posean a lo sumo 50 inscriptos. Se sabe que cada participante se puede anotar en una sola categoría.}


program final;
type
    participante = record
        dni:integer;
        apellido:string;
        nombre:string;
        categoria:integer;
        fecha:string;
    end;

    vParticipantes = array [1..5000] of participante; // se dispone

    vContador = array [1..5] of integer;

    lista = ^nodo;
    nodo = record
        dato:participante;
        sig:lista;
    end;

    procedure cargarVector(var v:vParticipantes;var dimL:integer); // se dispone

    procedure agregarAdelante(var l :lista;p:participante);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato := p;
        nue^.sig := l;
        l := nue;
    end;

    procedure inicializarVector(var v:vContador);
    var
        i:integer;
    begin
        for i := 1 to 5 do begin
            v[i] := 0;
        end;
    end;

    procedure procesarLista(vP:vParticipantes;var vC:vContador;var l:lista;dimL:integer);
    var
        i:integer;
    begin
        for i:= 1 to dimL do begin
            vC[vP[i].categoria] := vC[vP[i].categoria] + 1;
        end;
        for i := 1 to dimL do begin
            if (vC[vP[i].categoria] <= 50) then
                agregarAdelante(l,vP[i]);
        end;
    end;
    
var
    vC:vContador;
    vP:vParticipantes;
    l:lista;
    dimL:integer;
begin
    l := nil;
    dimL := 0;
    cargarVector(v,dimL); //se dispone
    inicializarVector(vC);
    procesarLista(vP,vC,l,dimL);
end;
