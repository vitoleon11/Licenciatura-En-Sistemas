{
Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y peso
registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un programa
que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}


program Hello;

    vectorPesos = array [1..42] of real;
    
    maternidad = record     
        nombre:string;
        apellido:string;
        peso:vectorPesos;
    end;

    lista = ^nodo;      //SE DISPONE
    nodo = record;
        dato:maternidad;
        sig:lista;
    end;
    
    procedure mayorAumento(l:lista);
    var
        aux:lista;
    begin
        aux := l;
        while (aux <> nil) do begin
            
        end;
    end;
    
begin
end.
