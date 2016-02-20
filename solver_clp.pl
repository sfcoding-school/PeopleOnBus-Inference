:-use_module(library(clpfd)).

checkpoint(X,L):-element(_,L,X).

not_present(X,Y,L):-get_people(X,L,R),all_different([Y|R]).

get_people(_,[],[]).
get_people(X,[[Y,Z]|T],R):-X==Y,get_people(X,T,R1),R=[Z|R1].
get_people(X,[[Y,_]|T],R):-X\=Y,get_people(X,T,R).

solve(C,L,R):-length(L,N),length(R,N),R ins 0..1,constraints(C,R,R,L,L),sum(R,#=,V),labeling([max(V)],R).

constraints(_,[],_,[],_).
constraints(C,[A|R],Z,[[X,Y]|T],L):-check(C,A,Z,X,Y,L),constraints(C,R,Z,T,L).

check(C,A,Z,X,Y,L):-J is X+1,checkpoint(J,C),not_present(J,Y,L),V is X+1,constraint_prev(V,Y,Z,L,Z,L),W is X-1,constraint_next(W,Y,Z,L,Z,L),A#=0.
check(C,A,Z,X,Y,L):-J is X-1,checkpoint(J,C),not_present(J,Y,L),V is X+1,constraint_prev(V,Y,Z,L,Z,L),W is X-1,constraint_next(W,Y,Z,L,Z,L),A#=0.
check(_,_,_,_,_,_).

constraint_next(_,_,[],[],_,_).
constraint_next(X,Y,[A|_],[[Z,W]|_],P,T):-X==Z,Y==W,A#=0,V=X+1,constraint_next(V,Y,P,T,P,T).
constraint_next(X,Y,[_|R],[[_,_]|L],P,T):-constraint_next(X,Y,R,L,P,T).

constraint_prev(_,_,[],[],_,_).
constraint_prev(X,Y,[A|_],[[Z,W]|_],P,T):-X==Z,Y==W,A#=0,V=X-1,constraint_next(V,Y,P,T,P,T).
constraint_prev(X,Y,[_|R],[[_,_]|L],P,T):-constraint_next(X,Y,R,L,P,T).

xj(C,L,R):-solve(C,L,V),get_list(L,V,R).

get_list([],[],[]).
get_list([X|T],[A|Z],R):-A==1,get_list(T,Z,R1),R=[X|R1].
get_list([_|T],[A|Z],R):-A==0,get_list(T,Z,R).