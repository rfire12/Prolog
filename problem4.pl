:-dynamic lista_pares/1.

% Para esta regla se utilizo numlist para generar los numeros entre los
% limites dados. Para extraer los pares de esa lista se utilizo la regla
% pares (Tarea 3). Luego con assert, se creo un hecho llamado
% "lista_pares" en el cual se almacena la lista con los numeros pares.
% Ejemplo de corrida:
% aserta_pares(1, 10).  -->  true.
% lista_pares(X).       -->  X = [2, 4, 6, 8, 10]
aserta_pares(Inferior, Superior):-numlist(Inferior, Superior, Lista), pares(Lista, NumerosPares), assertz(lista_pares(NumerosPares)),!.




% Se realizo una regla que remueve el primer numero de una lista y
% verifica si el numero es par.
% En caso de que el numero sea par, el mismo se introducira en una nueva
% lista.
% Aqui el caso base es cuando las listas no tienen elementos. La segunda
% lista no tendra elementos hasta que no se llegue al caso base.
% Ej:
% pares([5,4,3,2,1], X). X -> [4,2]
% Luego de ejecutar la regla, se debe
% presionar ENTER para terminar con la recursion, debido a que se siguen
% ejecutando llamadas recursivas si se presiona punto y coma (;).
pares([], []).
pares([Numero|Lista], [Numero|X]):- Numero mod 2 =:= 0, pares(Lista, X).
pares([Numero|Lista], NumerosPares):- Numero mod 2 \== 0, pares(Lista, NumerosPares).
