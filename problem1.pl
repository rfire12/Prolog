% ------------------ Hechos -------------------

% **Sexo
% Los hechos hombre(X) y mujer(X) solo reciben un parametro cada uno.
% Ambos retornaran True si la persona ingresada pertenece al hecho
% correspondiente

hombre(felipe).
hombre(alfredo).
hombre(enrique).
mujer(susana).
mujer(josefina).
mujer(johanna).
mujer(martha).

% **Color de pelo
% Los hechos rubio(X), negro(X) y pelirrojo(X) solo reciben un
% parametro.
% X debe ser uno de los nombres que se han definido para los hechos. Ej:
% X-> felipe ; rubio(X) : True

rubio(felipe).
rubio(susana).
rubio(josefina).
negro(alfredo).
negro(enrique).
pelirrojo(johanna).
pelirrojo(martha).

% **Posesion de oro
% Este hecho recibe un solo parametro
% X debe ser uno de los nombres que se han definido para los hechos. Ej:
% X-> alfredo ; tiene_oro(X) : True

tiene_oro(alfredo).
tiene_oro(josefina).

% **Otras posesiones
% Cada hecho solo recibe un parametro
% X debe ser uno de los nombres que se han definido para los hechos. Ej:
% X-> martha ; tiene_casa(X) : True

tiene_casa(martha).
tiene_carro(felipe).

% ------------------ Reglas -------------------

% **Determinar si una persona es rica
% Si una persona esta en posesion de oro es porque es rica.
% Solo se le debe pasar como argumento el nombre de una persona.
% X-> josefina ; tiene_oro(X) : True
es_rica(Persona):-tiene_oro(Persona).

% **Determinar si a un hombre le gusta una mujer
% Cada una de las reglas "le_gusta" reciben 2 argumentos. El nombre de
% la persona a la que le "gusta" alguien (X) y el nombre de quien
% deseamos verfificar (Y).
% X-> alfredo ; Y-> johanna ; le_gusta(X,Y) : True
%
% Si desea determinar las personas a las cuales le gusta una persona,
% solo coloque el el nombre de la persona y una veriable.
% Ej. le_gusta(felipe, X).

% Para que a felipe le guste alguien, esa persona
% debe ser mujer, rubia y debe ser rica.
le_gusta(felipe,Persona):-mujer(Persona),rubio(Persona),es_rica(Persona).

% Para que a enrique le guste alguien, debe ser una mujer rica
le_gusta(enrique,Persona):-mujer(Persona),es_rica(Persona).

% Para que a Alfredo le guste alguien, debe ser una mujer pelirroja
le_gusta(alfredo,Persona):-mujer(Persona),pelirrojo(Persona).

% **Determinar si a una mujer le gusta un hombre
% Para que a Susana le guste alguien, debe ser un hombre de pelo negro
le_gusta(susana,Persona):-hombre(Persona),negro(Persona).

% Para que a josefina le guste alguien, debe ser un hombre de pelo negro
% y rico
le_gusta(josefina,Persona):-hombre(Persona),negro(Persona),es_rica(Persona).

% A martha le gustan todos los hombre, asi que en esta parte solo se
% verifica si la persona es un hombre
le_gusta(martha,Persona):-hombre(Persona).

% A johanna le gustan todos los hombre, asi que en esta parte tambien se
% verifica solo si la persona es un hombre
le_gusta(johanna,Persona):-hombre(Persona).


% **Dos personas se gustan mutuamente
% Para que dos personas se gusten mutuamente, se aplica la reglas
% "le_gusta" con los parametros en un orden, y luego se verifica la
% misma regla, pero con los parametros invertidos.
% Ej. X-> alfredo ; Y-> johanna ; gustar_mutuamente(X,Y) : True
% Para comprobar esto, solo se debe ejecutar la regla "le_gusta" en
% la cosola dos veces y verificar si a X le gusta Y y si a Y le gusta X
gustar_mutuamente(Persona1,Persona2):-le_gusta(Persona1,Persona2),le_gusta(Persona2,Persona1).
