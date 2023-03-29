% Define facts using a more concise syntax
queen(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

% Define offspring using a more readable syntax
offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).

% Define age hierarchy
older(prince_charles, princess_ann).
older(princess_ann, prince_andrew).
older(prince_andrew, prince_edward).

% Define predicates using a more readable and consistent syntax
older(X, Y) :- X == Y, is_older(X, Y).
is_older(X, Y) :- older(X, Y).
is_older(X, Y) :- older(X, Z), is_older(Z, Y).

% Define succession rules using a more readable syntax
precedes(X, Y) :-
male(X), female(Y),
offspring(X, Parent), offspring(Y, Parent),
not(queen(Y)).
precedes(X, Y) :-
male(X), male(Y),
offspring(X, Parent), offspring(Y, Parent),
is_older(X, Y).
precedes(X, Y) :-
female(X), female(Y),
offspring(X, Parent), offspring(Y, Parent),
not(queen(X)), not(queen(Y)),
is_older(X, Y).

% Define sorting algorithm using a more readable syntax
sort_succession_list([A|B], SortedList) :-
sort_succession_list(B, SortedTail),
insert(A, SortedTail, SortedList).
sort_succession_list([], []).

insert(A, [B|C], [B|D]) :-
not(precedes(A, B)), !,
insert(A, C, D).
insert(A, C, [A|C]).

% Define a predicate for returning a sorted succession list
sortedSuccessionList(X, SuccessionList) :-
findall(Y, offspring(Y, X), Offspring),
sort_succession_list(Offspring, SuccessionList).