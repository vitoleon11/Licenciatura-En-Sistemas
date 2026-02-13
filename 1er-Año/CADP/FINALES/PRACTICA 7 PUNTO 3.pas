{

Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. De
cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y para
un mismo código de auto pueden existir 1 o más viajes. Se pide:

a. Informar los dos códigos de auto que más kilómetros recorrieron.

b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
viaje.

}


program Hello;
type
    viaje = record
        numViaje:integer;
        codAuto:integer;
        dirOrigen:string;
        dirDestino:string;
        kmReco:real;
    end;
    lista = ^nodo;  //SE DISPONE
    nodo = record
        dato:viaje;
        sig:lista;
    end;
    
    lista2= ^nodo2;
    nodo2 = record
        dato:viaje;
        sig:lista2;
    end;
    
    procedure informarMaximos(l:lista);
    var
        maxCod1,maxCod2,codActual:integer;
        max1,max2,kmActual:real;
        aux:lista;
    begin
        aux:=l;
        max1:=-1;
        max2:= -1;
        while (aux <> nil) do begin
            codActual := aux^.dato.codAuto;
            kmActual := 0;
            while (aux <> nil) AND (codActual = aux^.dato.codAuto) do begin
                kmActual := kmActual + aux^.dato.kmReco;
                aux := aux^.sig;
            end;
            if (kmActual > max1) then begin
                max2 := max1;
                max1 := kmActual;
                maxCod2 := maxCod1;
                maxCod1 := codActual;
            end
            else if (kmActual > max2) then begin
                    max2:= kmActual;
                    maxCod2 := codActual;
            end;
        end;
        writeln('Los maximos codigos fueron: ', maxCod1,' y ', maxCod2);
    end;
    
    procedure insertarOrdenado(var l2 : lista2; v:viaje);
    var
        nue,act,ant:lista2;
    begin
        new(nue);
        nue^.dato := v;
        nue^.sig := nil;
        if (l2 = nil) OR (v.numViaje <= l2^.dato.numViaje) then begin
            nue^.sig := l2;
            l2:= nue;
        end
        else begin
                ant := l2;
                act:= l2^.sig;
                while (act <> nil) and (act^.dato.numViaje < v.numViaje) do begin
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
        aux:=l;
        while (aux <> nil) do begin
            if (aux^.dato.kmReco > 5) then 
                insertarOrdenado(l2,aux^.dato);
            aux := aux^.sig;
        end;
    end;
    
var
    l:lista;
    l2:lista2;
begin
    l2:=nil;
    informarMaximos(l);
    cargarLista2(l2,l);
end.
