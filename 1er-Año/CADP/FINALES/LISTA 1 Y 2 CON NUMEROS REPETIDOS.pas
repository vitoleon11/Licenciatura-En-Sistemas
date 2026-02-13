{

Implemente un módulo que recibe una lista de números enteros ordenada
de menor a mayor (pueden aparecer repetidos) y devuelva otra lista en la cual 
aparezca cada número de la lista de entrada junto con la cantidad de repeticiones del mismo.
Implemente el programa que contenga dicho módulo con su invocación.

}


program Hello;
type

    lista = ^nodo;      {SE DISPONE}
    nodo = record
        dato : integer;
        sig : lista;
    end;
    
    registro = record
        numero : integer;
        cantidad:integer;
    end;
    
    lista2 = ^nodo2;
    nodo2 = record
        dato: registro;
        sig:lista2;
    end;
    
    procedure agregarAdelante(var l2:lista2; num:integer);
    var
        nue:lista2
    begin
        new(nue);
        nue^.dato.numero := num;
        nue^.dato.cantidad := 0;
        nue^.sig := l2;
        l2 := nue;
    end;
    
    procedure cargarLista2(l : lista; var l2:lista2);
    var
        aux : lista;
        numActual : integer;
    begin
        aux := l;
        while (aux <> nil) do begin
            numActual := aux^.dato;
            agregarAdelante(l2,aux^.dato);
            while (aux <> nil) AND (numActual = aux^.dato) do begin
                l2^.dato.cantidad := l2^.dato.cantidad + 1;
                aux:= aux^.sig;
            end;
        end;
    end;
    
var
    l2:lista2;
    l:lista;
begin   
    l2:= nil;
    cargarLista2(l,l2)
end.



