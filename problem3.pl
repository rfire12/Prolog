% Punto 1
% La regla notaaletra toma 2 parametros.
% Se toma la nota y se verifica si es mayor a un numero determinado.
% Esto dara como resultado una letra correspondiente.
% Ej: notaaletra(95,X).
% X -> 'A'
notaaletra(Nota, 'A'):-Nota =< 100, Nota >= 90.
notaaletra(Nota, 'B'):-Nota =< 89, Nota >= 80.
notaaletra(Nota, 'C'):-Nota =< 79, Nota >= 70.
notaaletra(Nota, 'D'):-Nota =< 69, Nota >= 60.
notaaletra(Nota, 'F'):-Nota < 60.

% Punto 2
% Se toma un numero se le suma el numero 1 para determinar el siguiente.
% Ej: sucesor(5, X).
% X -> 6
sucesor(Numero, Siguiente):-Siguiente is Numero + 1.

% Punto 3
% El caso base sera cuando solo queden 3 elementos en la lista
% Se hizo una regla que remueve la cabeza de cada lista. Al verficar que
% quedan 3 elementos, se imprime la cabeza de la lista resultante.
% Ej.: antepenultimo([5,3,2,1],X).
% X -> 3
antepenultimo([Antepenultimo,_,_], Antepenultimo).
antepenultimo([_|Lista], X):-antepenultimo(Lista, X).

% Punto 4
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

% Punto 5
% Se definio una regla la cual la cual remueve la cabeza de lista y la
% concatena con una nueva lista vacia.
% Cuando se llegue al caso base, la ListaInversa se ira llenando con los
% elementos.
% Ej:
% inversa([1,2,3,4], X).
% X -> [4,3,2,1]
% Luego de ejecutar la regla, se debepresionar ENTER para terminar con la recursion, debido a que se siguen
% ejecutando llamadas recursivas si se presiona punto y coma (;).

inversa([],_).
inversa([Cabeza|Lista], ListaInversa):-append(X, [Cabeza], ListaInversa), inversa(Lista, X).
