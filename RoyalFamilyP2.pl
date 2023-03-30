% Define facts 
queen(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

% Define offspring 
offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).

% Define age hierarchy
older(prince_charles, princess_ann).
older(princess_ann, prince_andrew).
older(prince_andrew, prince_edward).

% Define predicates 
is_older(X, Y) :- 
    older(X, Y).
is_older(X, Y) :- 
    older(X, Z), is_older(Z, Y).

% Define succession rules
precedes(X, Y) :-
    offspring(X, Parent), offspring(Y, Parent), is_older(X, Y), not(queen(X)), not(queen(Y)).

% Define sorting algorithm 
sort_succession_list([], []).
sort_succession_list([A|B], SortedList) :- 
    sort_succession_list(B, SortedTail), insert(A, SortedTail, SortedList).

% Inserts a person into a sorted succession list according to the precedes rule
insert(A, [B|C], [B|D]) :- 
    not(precedes(A, B)), !, insert(A, C, D).

insert(A, C, [A|C]).

% Define a predicate for returning a sorted succession list
sortedSuccessionList(X, SuccessionList) :-
    findall(Y, offspring(Y, X), Offspring), sort_succession_list(Offspring, SuccessionList).

% Define the function for returning a sorted succession list
getSuccessors(Successors) :-
    sortedSuccessionList(queen_elizabeth, Successors).