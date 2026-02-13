{Se dispone de la información de los participantes inscriptos a una carrera (a lo sumo 5000). 
De cada participante se tiene DNI, nombre y apellido, categoría (1..5) y fecha de inscripción. 
Se pide implementar un programa que guarde en una estructura adecuada los participantes de aquellas 
categorías que posean a lo sumo 50 inscriptos. Se sabe que cada participante se puede anotar en una sola categoría.}


program Hello;
type
    participante = record
        dni :integer;
        nombre: string;
        apellido: string;
        categoria:integer;
    end;
    
    lista = ^nodo; //SE DISPONE
    nodo = record
        dato : participante;
        sig :lista;
    end;
    
    lista2 =^nodo2;
    nodo2 = record
        dato:participante;
        sig:lista2;
    end;
    
    vector = array [1..5] of integer;
    
    procedure inicializarVector(var v: vector);
    var
        i:integer;
    begin
        for i := 1 to 5 do begin
            v[i] := 0;
        end;
    end;
    
    procedure contarCategorias(var v:vector;l:lista);
    begin
        while (l <> nil) do begin
            v[l^.dato.categoria] := v[l^.dato.categoria] + 1;
            l := l^.sig;
        end;
    end;
    
    procedure agregarAdelante(var l:lista2;p:participante);
    var
        nue:lista2;
    begin
        new(nue);
        nue^.dato := p;
        nue^.sig:= l;
        l := nue;
    end;
    
    procedure cargarLista2(var l2:lista2;l:lista;v:vector);
    begin
        while (l <> nil) do begin
            if (v[l^.dato.categoria] <= 50) then begin
                agregarAdelante(l2,l^.dato);
            end;
            l := l^.sig;
        end;
    end;
var
    l:lista;
    l2:lista2;
    v:vector;
begin
    l2:= nil;
    inicializarVector(v);
    contarCategorias(v,l);
    cargarLista2(l2,l,v);
end.
