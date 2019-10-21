% ----------------- Punto 1 -------------------------
% X is 3 + 4 * 5 - 1 + sqrt(9), Y is (3 + 4) * 5 % 2 // 3.
% - En la primera parte de la expresion, prolog respeta
% el orden de los operadores, dandole mayor importancia a la
% multiplicacion. Por lo que: Primero se multiplica 4*5, a eso se le
% suma 3, luego se le resta 1.
% - En la segunda parte de la expresion, prolog le da prioridad a lo
% que se encuentra dentro de los parentesis, por lo que primero se suma
% 3 + 4, y luego eso se multiplica por 5. Lo que se encuentra despues
% del signo de porcentaje (%) se interpreta como un comentario y prolog
% lo ignora. Por tal razon, si se ejecuta la expresion completa, prolog
% esperara a que se inserte un punto para ejecutar la sentencia, ya que
% el punto incluido en la expresion es parte del comentario.

% ------------------ Punto 2 --------------------------

ganados( juan, 7 ).
ganados( susana, 6 ).
ganados( pedro, 2 ).
ganados( rosa, 5 ).
jugados( rosa, 10 ).
jugados( juan, 13 ).
jugados( pedro, 3 ).
jugados( susana, 7 ).

% A esta regla, se le pasa una variable Persona y otra Porcentaje.
% La misma, verifica si la persona tiene juegos jugados y si tiene
% juegos ganados. Para calcular el porcentaje, se divide los juegos
% ganados entre los jugados y luego se multiplica por 100.
% Ej.: porcentaje_ganados(X, Y).
% Resultado: X-> juan. Y-> 53.846
% Y representa el porcentaje de juegos ganados.
porcentaje_ganados(Persona, Porcentaje):-ganados(Persona, Ganados), jugados(Persona, Jugados), Porcentaje is Ganados / Jugados * 100.

% ---------------- Punto 3 -----------------------------
% En este punto, se utilizan simbolos de mayor que, menor que y mismo
% valor para vericar el primer numero en comparacion con el segundo.
% Ej.: es(5,3,Resultado).
% Resultado -> 'El primer numero es MAYOR que el segundo'
es(Num1, Num2, Resultado):-Num1 > Num2, Resultado = 'El primer numero es MAYOR que el segundo'.
es(Num1, Num2, Resultado):-Num1 < Num2, Resultado = 'El primer numero es MENOR que el segundo'.
es(Num1, Num2, Resultado):-Num1 =:= Num2, Resultado = 'Ambos numeros son iguales'.

% ---------------- Punto 4 ----------------------------
% Esta regla acepta dos variable, a las cuales se les asignara un valor
% con read. Luego cada una de estas variables seran escritas en un
% archivo para formar un hecho con las mismas.
% Ej.: escribo(Nombre, Plato).
% Al presionar ENTER, se le pedira que ingrese el nombre de una persona.
% Luego se le pedira que ingrese el nombre de un plato.
escribo(Nombre, Plato):-open('platos.pl', append, Stream), write('Ingrese un nombre: '), read(Nombre), write('Ingrese un plato: '), read(Plato), write(Stream, ' plato('), write(Stream, Nombre), write(Stream, ','), write(Stream, Plato), write(Stream,').'), close(Stream).

% ---------------- Punto 5 -----------------------------
% En esta regla, se abre el archivo platos.pl y se retorna el primer
% hecho que encuentra la regla.
% Ej.: leo(X)
% X -> plato(raul, pizza).
leo(Plato):-open('platos.pl', read, Stream), see(Stream), read(Plato), close(Stream).




