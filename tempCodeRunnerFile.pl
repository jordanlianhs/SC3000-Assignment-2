/* Define the parent-child relations */
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

/* Define the male and female genders */
male(prince_charles).
male(prince_andrew).
male(prince_edward).
female(princess_ann).
female(queen_elizabeth).

/* Define the order of birth of the children */
older(prince_charles,princess_ann).
older(prince_charles,prince_andrew).
older(prince_charles,prince_edward).
older(princess_ann,prince_andrew).
older(princess_ann,prince_edward).
older(prince_andrew,prince_edward).

/* Define the succession rule */
succession(X) :- 
    male(X), 
    forall(member(Y, [princess_ann,prince_andrew,prince_edward])
    , older(X, Y)).
    
succession(X) :- 
    female(X), 
    older(X, _Y).
    forall(member(Y, [prince_charles,prince_andrew,prince_edward])
    , older(X, Y)).