{1. La Facultad de Informática organiza el congreso WICC, en donde se expondrán trabajos de investigación.
Realizar un programa que lea la información de cada publicación: título de la publicación, nombre del autor, 
DNI del autor y tipo de publicación (1..12).

La carga de publicaciones finaliza al ingresar un DNI de autor con valor 0 (el cual no debe procesarse). 
La información se lee ordenada por DNI del autor y un autor puede tener varias publicaciones.
Se pide escribir un programa que:

a. Informar el tipo de publicación con mayor cantidad de publicaciones.
b. Informar para cada autor la cantidad de publicaciones presentadas.}

program gork;
type
    publicacion = record
        titulo:string;
        nombre:string;
        dni:integer;
        tipo:integer;
    end;
    
    lista =^nodo;
    nodo = record
        dato:publicacion;
        sig:lista;
    end;
    
    vector = array [1..12] of integer;
    
    procedure inicializarVector(var v:vector);
    var
        i:integer;
    begin
        for i := 1 to 12 do begin
            v[i] := 0;
        end;
    end;
    
    procedure leerPublicacion(var p:publicacion); 
    begin read(p.dni); 
    if (p.dni <> 0) then begin 
        read(p.titulo); 
        read(p.nombre);
        read(p.tipo); 
    end; 
    end;
    
    procedure agregarAtras(var l:lista;var ult:lista; p:publicacion);
    var
        nue: lista;
    begin
        new (nue); 			    {Creo un nodo}
        nue^.dato := p; 		{Cargo el dato}
        nue^.sig := nil;		{Inicializo enlace en nil}
        if (l = nil) then 	    {Si la lista está vacía}
            l:= nue     	    {Actualizo el inicio}
        else				    {Si la lista no está vacía}
            ult^.sig := nue; 	{Realizo enlace con el último} 
        ult := nue;			    {Actualizo el último}
    end;
    
    procedure cargarLista(var l:lista; var v:vector);
    var
        p:publicacion;
        ult:lista;
    begin
        ult := nil;
        leerPublicacion(p);
        while (p.dni <> 0) do begin
            agregarAtras(l,ult,p);
            v[p.tipo] := v[p.tipo] + 1;
            leerPublicacion(p);
        end;
    end;
    
    procedure informarAutores(l:lista);
    var
        dniActual,cant:integer;
    begin
        while (l <> nil) do begin
            dniActual := l^.dato.dni;
            cant := 0;
            while (l <> nil) AND (l^.dato.dni = dniActual) do begin
                cant := cant + 1;
                l := l^.sig;
            end;
            writeln('La cantidad de publicaciones de :' , dniActual, ' fue ', cant);
        end;
    end;
        
    procedure informarMaximo(v:vector);
    var
        i,maxCant,maxTipo:integer;
    begin
        maxCant := -1;
        for i := 1 to 12 do begin
            if (v[i] > maxCant) then begin 
                maxTipo := i;
                maxCant := v[i];
            end;
        end;
        writeln('El tipo de publicacion con mayor cantidad de publicaciones es: ', maxTipo);
    end;
    
var 
    l:lista;
    v:vector;
begin
    l := nil;
    inicializarVector(v);
    cargarLista(l,v);
    informarMaximo(v);
    informarAutores(l);
end.
