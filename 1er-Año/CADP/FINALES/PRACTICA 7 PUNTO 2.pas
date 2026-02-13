{

Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 1122,
el cual debe procesarse. La empresa dispone de una tabla donde guarda un valor que representa un monto
adicional que el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo 
al código de póliza que tiene contratada. Una vez finalizada la lectura de todos los clientes, se pide:

a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente por su
seguro automotriz (monto básico + monto adicional).

b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.

c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.

}


program Hello;
type
    cliente = record
        codCliente:integer;
        dni:integer;
        apellido:string;
        nombre:string;
        poliza:integer;
        monto:real;
    end;
    
    lista = ^nodo;
    nodo = record
        dato:cliente;
        sig:lista;
    end;
    
    vector = array [1..6] of real; //SE dispone
    
    procedure leerCliente(var c:cliente);
    begin
        readln(c.codCliente);
        readln(c.dni);
        readln(c.apellido);
        readln(c.nombre);
        readln(c.poliza);
        readln(c.monto);
    end;
    
    procedure agregarAdelante(var l: lista; c : cliente;v : vector);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato := c;
        nue^.dato.monto := nue^.dato.monto + v[nue^.dato.poliza];
        nue^.sig := l;
        l := nue;
    end;
    
    
    procedure cargarLista(var l : lista; v : vector);
    var
        c:cliente;
    begin
        repeat
            leerCliente(c);
            agregarAdelante(l,c,v);
        until(c.codCliente = 1122);
    end;
    
    
    procedure informarCliente(l:lista);
    var
        aux:lista;
    begin
        aux := l;
        while (l <> nil) do begin
            writeln('Codigo cliente: ', aux^.dato.codCliente, 
            ' dni: ', aux^.dato.dni, ' apellido: ', aux^.dato.apellido, 
            ' nombre: ', aux^.dato.nombre, ' poliza: ', aux^.dato.poliza, 
            ' monto: ', aux^.dato.monto);
            aux := aux^.sig;
        end;
    end;
    
    
    function alMenosDos(dni:integer):boolean;
    var
        dig,nueve:integer;
    begin
        nueve := 0;
        dig := 0;
        alMenosDos := false;
        while (dni <> 0) do begin
            dig := dni MOD 10;
            if (dig = 9) then begin
                nueve := nueve + 1;
            end;
            dni := dni DIV 10;
        end;
        if (nueve >= 2) then begin
            alMenosDos := true;
        end;
    end;
    
    procedure infomarAlMenosDos(l: lista);
    var
        aux:lista;
    begin
        aux := l;
        while (aux <> nil) do begin
            if (alMenosDos(aux^.dato.dni)) then 
                writeln('El cliente ', aux^.dato.cliente, 'tiene al menos 2 digitos 9.');
            aux := aux^.sig;
        end;
    end;
   
    procedure eliminarCliente(var l:lista,codigo:integer);
    var
        act,ant:lista;
    begin
        act := l;
        while (act^.dato.codCliente <> codigo) do begin
            ant := act;
            act:= act^.sig;
        end;
        if (act = l) then   
            l := l^.sig
        else
            ant^.sig := act^.sig;
        dispose(act);
    end;
    
var
    l:lista;
    v:vector;
    codigo:integer;
begin
    l := nil;
    cargarLista(l);
    informarCliente(l);
    infomarAlMenosDos(l);
    eliminarCliente(l,read(codigo))
end.
