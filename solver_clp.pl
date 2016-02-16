:-use_module(library(clpfd)).

checkpoint(X,L):-element(_,L,X).

not_present(X,Y,L):-get_people(X,L,R),all_different([Y|R]).

get_people(_,[],[]).
get_people(X,[[Y,Z]|T],R):-X==Y,get_people(X,T,R1),R=[Z|R1].
get_people(X,[[Y,_]|T],R):-X\=Y,get_people(X,T,R).

solve(C,L,R):-length(L,N),length(R,N),R ins 0..1,constraints(C,R,L,L),sum(R,#=,V),labeling([max(V)],R).

constraints(_,[],[],_).
constraints(C,[A|R],[[X,Y]|T],L):-check(C,A,X,Y,L),constraints(C,R,T,L).

check(C,A,X,Y,L):-J#=X+1,checkpoint(J,C),not_present(J,Y,L),A#=0.
check(C,A,X,Y,L):-J#=X-1,checkpoint(J,C),not_present(J,Y,L),A#=0.
check(_,_,_,_,_).

xj(C,L,R):-solve(C,L,V),get_list(L,V,R).

get_list([],[],[]).
get_list([X|T],[A|Z],R):-A==1,get_list(T,Z,R1),R=[X|R1].
get_list([_|T],[A|Z],R):-A==0,get_list(T,Z,R).