takeout(A,[A|B],B).
takeout(A,[B|C],[B|E]) :-
          takeout(A,C,E).
